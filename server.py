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

#bad word list
arrBad = [
'2g1c',
'2 girls 1 cup',
'acrotomophilia',
'anal',
'anilingus',
'anus',
'arsehole',
'ass',
'asshole',
'assmunch',
'auto erotic',
'autoerotic',
'babeland',
'baby batter',
'ball gag',
'ball gravy',
'ball kicking',
'ball licking',
'ball sack',
'ballsack',
'ball sucking',
'bangbros',
'bareback',
'barely legal',
'barenaked',
'bastardo',
'bastinado',
'bbw',
'bdsm',
'beaver cleaver',
'beaver lips',
'bestiality',
'bi curious',
'big black',
'big breasts',
'big knockers',
'big tits',
'bimbos',
'birdlock',
'bitch',
'black cock',
'blonde action',
'blonde on blonde action',
'blow j',
'blow your l',
'blue waffle',
'blumpkin',
'bollocks',
'bondage',
'boner',
'boob',
'boobs',
'booty call',
'brown showers',
'brunette action',
'bukkake',
'bulldyke',
'bullet vibe',
'bung hole',
'bunghole',
'busty',
'butt',
'buttcheeks',
'butthole',
'camel toe',
'camgirl',
'camslut',
'camwhore',
'carpet muncher',
'carpetmuncher',
'chocolate rosebuds',
'circlejerk',
'cleveland steamer',
'clit',
'clitoris',
'clover clamps',
'clusterfuck',
'cock',
'cocks',
'coprolagnia',
'coprophilia',
'cornhole',
'cum',
'cumming',
'cum dumpster',
'cunnilingus',
'cunt',
'dammit',
'damn',
'darkie',
'date rape',
'daterape',
'deep throat',
'deepthroat',
'dick',
'dildo',
'dirty pillows',
'dirty sanchez',
'dog style',
'doggie style',
'doggiestyle',
'doggy style',
'doggystyle',
'dolcett',
'domination',
'dominatrix',
'dommes',
'donkey punch',
'double dong',
'double penetration',
'dp action',
'eat my ass',
'ecchi',
'ejaculation',
'erotic',
'erotism',
'escort',
'ethical slut',
'eunuch',
'faggot',
'fecal',
'felch',
'fellatio',
'feltch',
'female squirting',
'femdom',
'figging',
'fingering',
'fisting',
'foot fetish',
'footjob',
'frotting',
'fuck',
'fucking',
'fuck buttons',
'fudge packer',
'fudgepacker',
'futanari',
'g-spot',
'g spot',
'gang bang',
'gay sex',
'genitals',
'giant cock',
'girl on',
'girl on top',
'girls gone wild',
'goatcx',
'goatse',
'gokkun',
'golden shower',
'goo girl',
'goodpoop',
'goregasm',
'grope',
'group sex',
'guro',
'hand job',
'handjob',
'hard core',
'hardcore',
'hentai',
'hell',
'homoerotic',
'honkey',
'hooker',
'hot chick',
'how to kill',
'how to murder',
'huge fat',
'humping',
'incest',
'intercourse',
'jack off',
'jail bait',
'jailbait',
'jerk off',
'jigaboo',
'jiggaboo',
'jiggerboo',
'jizz',
'juggs',
'kike',
'kinbaku',
'kinkster',
'kinky',
'knobbing',
'leather restraint',
'leather straight jacket',
'lemon party',
'lolita',
'lovemaking',
'make me come',
'male squirting',
'masturbate',
'menage a trois',
'milf',
'missionary position',
'motherfucker',
'mound of venus',
'mr hands',
'muff diver',
'muffdiving',
'nambla',
'nawashi',
'negro',
'neonazi',
'nig nog',
'nigga',
'nigger',
'nimphomania',
'nipple',
'nipples',
'nsfw images',
'nude',
'nudity',
'nympho',
'nymphomania',
'octopussy',
'omorashi',
'one cup two girls',
'one guy one jar',
'orgasm',
'orgy',
'paedophile',
'panties',
'panty',
'pedobear',
'pedophile',
'pegging',
'penis',
'penis docking',
'penises',
'phone sex',
'piece of shit',
'piss pig',
'pissing',
'pisspig',
'playboy',
'pleasure chest',
'pole smoker',
'ponyplay',
'poof',
'poon',
'poon tang',
'poop',
'poop chute',
'poopchute',
'porn',
'porno',
'pornography',
'prince albert piercing',
'pthc',
'pubes',
'pussy',
'queaf',
'raghead',
'raging boner',
'rape',
'raping',
'rapist',
'rectum',
'reverse cowgirl',
'rimjob',
'rimming',
'rosy palm',
'rosy palm and her 5 sisters',
'rusty fishhook',
'rusty trombone',
's&m',
'sadism',
'scat',
'schlong',
'scissoring',
'semen',
'sex',
'sexo',
'sexy',
'shaved beaver',
'shaved pussy',
'shemale',
'shibari',
'shit',
'shota',
'shrimping',
'slanteye',
'slut',
'smut',
'snatch',
'snowballing',
'sodomize',
'sodomy',
'spic',
'spooge',
'spread legs',
'strap on',
'strapon',
'strappado',
'strip club',
'style doggy',
'suicide girls',
'sultry women',
'swastika',
'swinger',
'tainted love',
'taste my',
'tea bagging',
'threesome',
'throating',
'tied up',
'tight white',
'tit',
'tits',
'titties',
'titty',
'twerking',
'tongue in a',
'topless',
'tosser',
'towelhead',
'tranny',
'tribadism',
'tub girl',
'tubgirl',
'tushy',
'twat',
'twink',
'twinkie',
'two girls one cup',
'undressing',
'upskirt',
'urethra play',
'urophilia',
'vagina',
'venus mound',
'vibrator',
'violet blue',
'violet wand',
'vorarephilia',
'voyeur',
'vulva',
'wank',
'wet dream',
'wetback',
'white power',
'women rapping',
'wrapping men',
'wrinkled starfish',
'xx',
'xxx',
'yaoi',
'yellow showers',
'yiffy',
'zoophilia']
#End of bad word list

#Acceptable Rating Ammounts
acceptableRatings = [1.0, 1, 1.5, 2, 2.0, 2.5, 3, 3.0, 3.5, 4, 4.0, 4.5, 5, 5.0]

#Start of all Queries used on the site
movieSearchQuery = "SELECT movie_title, id FROM movie_titles WHERE movie_title LIKE %s"
movieIDSearchQuery = "SELECT mt.movie_title, mt.id, my.year FROM movie_titles mt JOIN movie_years my ON mt.id = my.movie_id WHERE mt.id = %s"
newMovieSearch = "SELECT mt.movie_title, my.year, mt.id, COUNT(mr.*) AS count, AVG(mr.rating) AS average FROM movie_titles mt JOIN movie_years my ON mt.id =" + \
    " my.movie_id JOIN movie_ratings mr ON mr.movie_id = mt.id WHERE LOWER(movie_title) LIKE %s GROUP BY mt.movie_title, my.year, mt.id LIMIT 10"
continuedNewMovieSearch = newMovieSearch + ' OFFSET %s'
movieGenreSearch = "SELECT mt.id, mg.movie_genre FROM movie_titles mt JOIN movie_genres mg ON mt.id = mg.movie_id WHERE LOWER(mt.movie_title) LIKE %s"
movieRatingQuery = "SELECT mt.movie_title AS movie_id, u.id, mr.rating FROM movie_ratings mr JOIN users u ON u.id = mr.user_id JOIN movie_titles mt ON mt.id = mr.movie_id"
movieIDQuery = "SELECT * FROM movie_titles LIMIT 10"
doesUserAlreadyExist = "SELECT * FROM users WHERE username = %s LIMIT 1"
registerNewUser = "INSERT INTO users VALUES (default, %s, %s, %s, crypt(%s, gen_salt('md5')))"
loginQuery = "SELECT users.id, users.username, users.is_admin, count(movie_ratings.*) AS ratings FROM users LEFT JOIN movie_ratings ON users.id =" + \
    " movie_ratings.user_id WHERE users.username = %s AND users.password = crypt(%s, password) GROUP BY users.id"
top20Query = "SELECT movie_titles.movie_title as title, AVG(movie_ratings.rating) AS average FROM movie_titles INNER JOIN movie_ratings ON movie_titles.id =" + \
    " movie_ratings.movie_id GROUP BY movie_titles.movie_title, movie_ratings.rating ORDER BY movie_ratings.rating DESC LIMIT 20"
getMovieIDQuery = "SELECT movie_titles.id FROM movie_titles JOIN movie_years ON movie_titles.id = movie_years.movie_id WHERE movie_title = %s AND year = %s"
insertRateQuery = "INSERT INTO movie_ratings VALUES(default, %s, %s, %s)"
insertReviewQuery = "INSERT INTO movie_reviews VALUES(default, %s, %s, %s)"
reviewQuery = "SELECT mr.movie_review as review, mr.id as reviewID, mt.movie_title as title, u.username as un from movie_reviews mr join movie_titles mt on mt.id = mr.movie_id join users u on u.id = mr.user_id where mt.id = %s LIMIT 10"
continuedReviewQuery = reviewQuery +  " OFFSET %s"
checkRatingQuery = "SELECT id FROM movie_ratings WHERE user_id = %s AND movie_id = %s LIMIT 1"
checkReviewQuery = "SELECT id FROM movie_reviews WHERE user_id = %s AND movie_id = %s LIMIT 1"
updateReviewQuery = "UPDATE movie_reviews SET movie_review = %s WHERE user_id = %s AND movie_id = %s"
updateRatingQuery = "UPDATE movie_ratings SET rating = %s WHERE user_id = %s AND movie_id = %s"
profanitySearchingQuery= "SELECT movie_review from movie_reviews WHERE movie_review LIKE %s"
deleteReviewByID= "DELETE FROM movie_reviews WHERE id= %s"
deleteRatingByID= "DELETE FROM movie_ratings WHERE id= %s"
userRatedQuery= "SELECT mr.rating, mr.id FROM movie_ratings mr JOIN movie_titles mt ON mt.id = mr.movie_id JOIN users u ON mr.user_id = u.id WHERE u.username = %s AND mt.movie_title = %s"

#End of all Queries

def connect_to_db():
    return psycopg2.connect('dbname=movie_recommendations user=movie_normal password=password host=localhost')

def connect_to_db_admin():
    return psycopg2.connect('dbname=movie_recommendations user=movie_admin password=password host=localhost')
    
@app.route('/', methods=['GET', 'POST'])
def index():
    return render_template('index.html')    
    
def populateHomePage():
  
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    try:
        cur.execute(top20Query)
        results=cur.fetchall()
    except Exception, e:
        raise e
    
    top20 = []
        
    for i in range(len(results)):
        top20.append({'title' : results[i]['title'], 'average' : results[i]['average'], 'position': i+1})
        
    return top20
    
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
        
    
    print(results)
    
    if len(error) == 0:
        emit('login', {'success' : True, 'message' : 'Successfully logged in.', 'username' : session['username'], 'ratings' : session['ratings'], 'isAdmin' : results['is_admin']})
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
    
    hasBadWord = False
    badWords = []
    for word in arrBad:
        if word in username.lower():
            hasBadWord = True
            badWords.append(word)
    
    if not hasBadWord:
    
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
        
    else:
        
        concatStr = ', '.join(badWords)
        emit('register', {'success' : False, 'message' : 'Inappropriate Username. You are not allowed to use: ' + concatStr })
    
@socketio.on('logout', namespace='/movie')
def logout(data):
    print(session)
    print("logged out...")
    session.clear()
    emit('logout', {'success' : True, 'message' : 'Successfully logged out.'})
    
    
@socketio.on('search', namespace='/movie')
def search(data):
    name = data['moviename'].lower()
    searchTerm = '%{0}%'.format(name)
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
        
        #needed to round ratings to 2 decimal points
        temp =  results[i]['average']
        results[i]['average'] = round(temp, 2)
        
        resultsDict = {'text' : results[i]['movie_title'], 'year' : results[i]['year'], 'numOfRates' : results[i]['count'], 'avgRate' : results[i]['average'], 'id' : results[i]['id']}
        if results[i]['id'] in movieList:
            resultsDict['genres'] = movieList[results[i]['id']]
        queryResults.append(resultsDict)
    
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
    hasError = False
    error = ''

    try:
        rating = float(rating)
    except TypeError:
        error += 'Ratings have to be float values with .5 intervals! '
        hasError = True
    
    if rating > 5.0 or rating < 0:
        error += 'Ratings have to be between 1 and 5! '
        hasError = True
    if rating not in acceptableRatings:
        error += 'Invalid Rating amount! '
        hasError = True

    hasBadWord = False
    badWords = []
    for word in arrBad:
        if word in review.lower():
            hasBadWord = True
            badWords.append(word)

    if not hasBadWord and not hasError:
        try:
            cur.execute(getMovieIDQuery, (movie_title, year))
            movieID = cur.fetchone()
        except Exception as e:
            print(e)
    
        message = ''
        checkRating = None
        checkReview = None
        
        if rating:
            try:
                cur.execute(checkRatingQuery, (session['id'], movieID['id']))
                checkRating = cur.fetchone()
            except Exception as e:
                print(e)
            
            if not checkRating:
                try:
                    cur.execute(insertRateQuery, (session['id'], movieID['id'], rating))
                    db.commit()
                    session['ratings'] += 1
                    message += 'Successfully rated {0} with a rating of: {1}. \n'.format(movie_title, rating)
                except Exception as e:
                    print(e)
            else:
                try:
                    cur.execute(updateRatingQuery, (rating, session['id'], movieID['id']))
                    db.commit()
                    message += 'Successfully updated {0} with a rating of: {1}. \n'.format(movie_title, rating)
                except Exception as e:
                    print(e)
        
        if review:
            try:
                cur.execute(checkReviewQuery, (session['id'], movieID['id']))
                checkReview = cur.fetchone()
                
            except Exception as e:
                print(e)
            
            if not checkReview:
                try:
                    cur.execute(insertReviewQuery, (movieID['id'], session['id'], review))
                    db.commit()
                    message +=  'Successfully reviewed {0}.'.format(movie_title)
                except Exception as e:
                    print(e)
                    
            else:
                try:
                    cur.execute(updateReviewQuery, (review, session['id'], movieID['id']))
                    db.commit()
                    message += 'Successfully updated review on {0}. \n'.format(movie_title)
                except Exception as e:
                    print(e)
        
        if len(message) != 0:
            emit('onRateMovie', {'success' : True, 'message' : message })
        else:
            emit('onRateMovie', {'success' : False, 'message' : 'Rating and/or Review was not published.'})
            
    else:
        errMsg = ''
        if hasBadWord:
            concatStr = ', '.join(badWords)
            errMsg += 'Inappropriate review. You are not allowed to use: ' + concatStr
        
        if len(error) != 0:
            errMsg += error[:-1]
        
        
        emit('onRateMovie', {'success' : False, 'message' : errMsg })

@socketio.on('searchReviews', namespace='/movie')
def searchReviews(data):
    
    movieID = data['data']
    
    if 'offset' in data:
        searchQuery = continuedReviewQuery
        searchParams = (movieID, data['offset'])
    else:
        searchQuery = reviewQuery
        searchParams = (movieID,)
        
    db = connect_to_db()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    try:
        cur.execute(searchQuery, searchParams)
        results = cur.fetchall()
    except Exception as e:
        print (e)
        
    try:
        cur.execute(movieIDSearchQuery, (movieID,))
        movieTitle = cur.fetchone()
    except Exception as e:
        print (e)
        
    resultSize = len(results)
    searchResults = []

    if resultSize == 0:
        emit('searchReviewsResults', {'success' : False, 'message' : 'There are no reviews for ' + movieTitle['movie_title'] +'!' })
    else:
        for row in results:
            try:
                cur.execute(userRatedQuery, (row['un'], row['title']))
                rateResult = cur.fetchone()
            except Exception as e:
                print(e)
            
            if rateResult:
                searchResults.append({'review' : row['review'], 'reviewID' : row[1], 'title' : row['title'], 'username' : row['un'], 'rating' : rateResult['rating'], 'ratingID' : rateResult['id']})
            
        if rateResult:        
            emit('searchReviewsResults', {'success' : True, 'title': movieTitle['movie_title'], 'data' :  searchResults, 'year' : movieTitle['year'], 'id' : data})
        else:
            emit('searchReviewsResults', {'success' : False, 'message' : 'There are no reviews for ' + movieTitle['movie_title'] +'!' })

@socketio.on('deleteReview', namespace='/movie')
def deleteReviews(data):

    db = connect_to_db_admin()
    cur = db.cursor(cursor_factory=psycopg2.extras.DictCursor)
    
    reviewId = data['data']
    ratingId = data['ratingID']
    
    try:
        cur.execute(deleteReviewByID, (reviewId,))
        db.commit()
        
    except Exception as e:
        print(e)
        
    try:
        cur.execute(deleteRatingByID, (ratingId,))
        db.commit()
        
    except Exception as e:
        print(e)
    
    emit('deleteReview', {'message' : "Successfully deleted review!"})
    

# start the server
if __name__ == '__main__':
        socketio.run(app, host=os.getenv('IP', '0.0.0.0'), port =int(os.getenv('PORT', 8080)), debug=True)
