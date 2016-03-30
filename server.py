#Start of imports
import sys
import resource
from recommender import recommender
reload(sys)
sys.setdefaultencoding("UTF8")
import os
import uuid
from flask import *
from flask.ext.socketio import SocketIO, emit
from flask_socketio import join_room, leave_room
import psycopg2
import psycopg2.extras
#End of inmports

#Start of setting up web application
psycopg2.extensions.register_type(psycopg2.extensions.UNICODE)
psycopg2.extensions.register_type(psycopg2.extensions.UNICODEARRAY)

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app)
#End of setting up web application

#Start of all Queries used on the site
movieSearchQuery = "SELECT movie_title, id FROM movie_titles WHERE movie_title LIKE %s" 
newMovieSearch = "SELECT mt.movie_title, my.year, mt.id FROM movie_titles mt JOIN movie_years my ON mt.id = my.movie_id WHERE movie_title LIKE %s LIMIT 10"
continuedNewMovieSearch = newMovieSearch + ' OFFSET %s'
movieGenreSearch = "SELECT mt.id, mg.movie_genre FROM movie_titles mt JOIN movie_genres mg ON mt.id = mg.movie_id WHERE mt.movie_title LIKE %s "
movieRatingQuery = "SELECT mt.movie_title AS movie_id, u.id, mr.rating FROM movie_ratings mr JOIN users u ON u.id = mr.user_id JOIN movie_titles mt ON mt.id = mr.movie_id "
movieIDQuery = "SELECT * FROM movie_titles LIMIT 10"
doesUserAlreadyExist = 'SELECT * FROM users WHERE username = %s LIMIT 1'
registerNewUser = "INSERT INTO users VALUES (default, %s, %s, %s, crypt(%s, gen_salt('md5')))"
loginQuery = 'SELECT users.id, users.username, count(movie_ratings.*) AS ratings FROM users LEFT JOIN movie_ratings ON users.id = movie_ratings.user_id WHERE users.username = %s AND users.password = crypt(%s, password) GROUP BY users.id'
top12Query = "SELECT movie_titles.movie_title, movie_ratings.rating FROM movie_titles INNER JOIN movie_ratings ON movie_titles.id=movie_ratings.movie_id ORDER BY movie_ratings.rating DESC LIMIT 12"
getMovieIDQuery = "SELECT movie_titles.id FROM movie_titles JOIN movie_years ON movie_titles.id = movie_years.movie_id WHERE movie_title = %s AND year = %s"
insertRateQuery = "INSERT INTO movie_ratings VALUES(default, %s, %s, %s)"
insertReviewQuery = "INSERT INTO movie_reviews VALUES(default, %s, %s, %s)"
#End of all Queries

def connect_to_db():
    return psycopg2.connect('dbname=movie_recommendations user=movie_normal password=password host=localhost')

@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')    
    
def populateHomePage():
  
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    try:
        cur.execute(top12Query)
        results=cur.fetchall()
    except Exception, e:
        raise e
        
    return results
    
@socketio.on('connect', namespace='/movie')
def onConnect():
    print('session on connect...')
    print(session)
    #session['uuid'] = uuid.uuid1()
    
    emit('on_connect', {'logged_in' : 'username' in session})
    
@socketio.on('disconnect', namespace='/movie')
def onDisconnect():
    print('session on disconnect')
    print(session)
    pass

@socketio.on('identify', namespace='/movie')
def on_identify(user):
    pass
    #print('Identify: ' + user)
    #users[session['uuid']] = {'username' : user}
    
@socketio.on('login', namespace='/movie')
def login(data):
    print('login page...')
    print(session)
    redirectPage = 'landing.html'
    error = ''
    results = None
    
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    username = data['username']
    pw = data['password']

    try:
        cur.execute(loginQuery, (username, pw))
        results = cur.fetchone()
    except Exception as e:
        print("Error: SEARCH in 'user' table: %s" % e)
    
    cur.close()
    db.close()
    if not results: # user does not exist
        error += 'Incorrect username or password.\n'
    else:
        session['username'] = results['username']
        session['id'] = results['id']
        session['ratings'] = results['ratings']
        
    
    if len(error) == 0:
        emit('login', {'success' : True, 'message' : 'Successfully logged in.', 'username' : session['username'], 'ratings' : session['ratings']})
        results = populateHomePage()
        print(results)
        emit('populateHomePage', {'top12query' : results})
    else:
        emit('login', {'success' : False, 'message' : error})
        
    emit('error', {'exists' : len(error) != 0, 'message' : error, 'type' : 'login'})    

@socketio.on('register', namespace='/movie')
def register(data):
    
    error = ''
    
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    firstName = data['firstname']
    lastName = data['lastname']
    username = data['username']
    password = data['password']
    password2 = data['confirmPassword']
    
    if username.isspace():
        error += 'Username is required.\n'
    if firstName.isspace():
        error += 'First Name is required.\n'
    if lastName.isspace():
        error += 'Last Name is required.\n'
    if password.isspace():
        error += 'Password is required.\n'
    if password2.isspace():
        error += 'Password must be entered in twice.\n'
    if password != password2:
        error += 'Passwords do not match.\n'
    
    if len(error) == 0:
        try:
            cur.execute(doesUserAlreadyExist, (username,)) # check whether user already exists
            
            if cur.fetchone():
                error += 'Username is already taken.\n'
            else:
                try:
                    cur.execute(registerNewUser, (firstName, lastName, username, password)) # add user to database
                    db.commit()
                    
                except Exception as e:
                    print("Error: Invalid INSERT in 'user' table: %s" % e)
        except Exception as e:
            print("Error: Invalid SEARCH in 'user' table: %s" % e)

    cur.close()
    db.close()
    
    if len(error) == 0:
        emit('register', {'success' : True, 'message' : 'Successfully registered. Login to continue.'})
    else:
        emit('register', {'success' : False, 'message' : error})
        
    emit('error', {'exists' : len(error) != 0, 'message' : error, 'type' : 'register'})
    
@socketio.on('logout', namespace='/movie')
def logout(data):
    print(session)
    print("logged out...")
    session.clear()
    emit('logout', {'success' : True, 'message' : 'Successfully logged out.'})


    
    
@socketio.on('search', namespace='/movie')
def search(data):
    
    searchTerm = '%{0}%'.format(data['moviename'])
    
    searchQuery = ''
    if 'offset' in data:
        searchQuery = continuedNewMovieSearch
        searchParams = (searchTerm, data['offset'])
    else:
        searchQuery = newMovieSearch
        searchParams = (searchTerm,)
        
    
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    results = []
    queryResults = []
    
    try:
        cur.execute(searchQuery, searchParams)
        results = cur.fetchall()
    except Exception as e:
        print("Error: Invalid SEARCH in 'movie_titles' table: %s" % e)
    
    try:
        cur.execute(movieGenreSearch, (searchTerm,))
        genreResults = cur.fetchall()
    except Exception as e:
        print("Error: Invalid SEARCH in 'movie_titles' table: %s" % e)
    
    movieGenres = {}
    copyGenres = genreResults
    parsedResults = []
    movieList = {}
    prevMovie = None
    for movie in genreResults:
        if prevMovie is not None and prevMovie[0] == movie[0]:
            movieList[movie[0]].append(movie[1])
            
        else:
            movieList[movie[0]] = [movie[1]]
            prevMovie = movie
            
    for i in range(len(results)):
        resultsDict = {'text' : results[i]['movie_title'], 'year' : results[i]['year']}
        print(results[i]['movie_title'], results[i]['id'])
        if results[i]['id'] in movieList:
            resultsDict['genres'] = movieList[results[i]['id']]
        queryResults.append(resultsDict)
    
    print(queryResults)
    cur.close()
    db.close()
    
    message = ''
    if len(results) == 0:
        message = 'No results found!'
    
    emit('searchResults', {'results' : queryResults, 'message' : message })
        
@socketio.on('recommend', namespace='/movie')
def recommend(test):
    data = {}
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    error = ''
    try:
        cur.execute(movieRatingQuery)
        results = cur.fetchall()
    except Exception as e:
        print("Error: SEARCH in 'movie_ratings table: %s" % e)
    
    if len(results) == 0:
        error += 'You have not rated any movies yet!'
        emit('error', {'exists' : len(error) != 0, 'message' : error, 'type' : 'recommend'})
    else:
        for row in results:
            user = row['id']
            movie = row['movie_id']
            rating = float(row['rating'])
            if user in data:
                currentRatings = data[user]
            else:
                currentRatings = {}
            currentRatings[movie] = rating
            data[user] = currentRatings
        
        try:
            cur.execute(movieIDQuery)
            results = cur.fetchall()
        except Exception as e:
            print("Error: SEARCH in 'movie_titles' table: %s" % e)
        
        cur.close()
        db.close()
        
        movieLens = recommender(5, 15) #Manhattan Distance 5 Nearest Neighbors
        movieLens.data = data
        results = movieLens.recommend(session['id'])
        print(results)
        queryResults = []
        for i,movie in enumerate(results):
            queryResults.append({'text': movie[0], 'rank': str(i+1)})
        
        emit('recommendationResults', {'results' : queryResults})
        


@socketio.on('rateMovie', namespace='/movie')
def rateMovie(data):
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    movie_title= data['moviename'] #both queries
    rating = data['movierating'] #insertRateQuery
    review = data['moviereview']
    year = data['movieyear']
    try:
        cur.execute(getMovieIDQuery, (movie_title, year))
        movieID = cur.fetchone()
    except Exception as e:
        print(e)

    #
    # Work out logic to prevent people from rating movies twice.
    #
    message = ''
    if rating:
        try:
            cur.execute(insertRateQuery, (session['id'], movieID['id'], rating))
            db.commit()
            session['ratings'] += 1
            message += 'Successfully rated {0} with a rating of: {1}. \n'.format(movie_title, rating)
        except Exception as e:
            print(e)
    else:
        pass
    
    if review:
        try:
            cur.execute(insertReviewQuery, (movieID['id'], session['id'], review))
            message +=  'Successfully reviewed {0}.'.format(movie_title)
        except Exception as e:
            print(e)
    else:
        pass
        
    if len(message) != 0:
        emit('onRateMovie', {'success' : True, 'message' : message })
    else:
        emit('onRateMovie', {'success' : False, 'message' : 'Rating and/or Review was not published.' })



# start the server
if __name__ == '__main__':
        socketio.run(app, host=os.getenv('IP', '0.0.0.0'), port =int(os.getenv('PORT', 8080)), debug=True)
