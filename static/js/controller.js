var movieApp = angular.module('MovieApp', ['ngSanitize']);
var socket = io.connect('https://' + document.domain + ':' + 8080 + '/movie');

movieApp.controller('SearchController', function($scope, $sce){
    
    $scope.name = '';
    $scope.text = '';
    $scope.searchResults = [];
    $scope.rating = '';
    $scope.rateResults = [];
    $scope.rateText = '';
    $scope.movieGenres = [];
    $scope.year = '';
    $scope.recommendationResults = []
    $scope.top12query = []
    $scope.offset = 0;
    $scope.username = '';
    $scope.ratings = [];
    
    $scope.search = function search(){
        console.log('Search result: ', $scope.text);
        socket.emit('search', {'moviename' : $scope.text});
        $scope.offset = 0;
        $scope.searchResults = [];
        $scope.$applyAsync();
    };
    
    $scope.clearSearchResults = function clearSearchResults(){
        $('#continueSearch').hide();
        $scope.searchResults = [];
        $scope.text = '';
        $scope.$applyAsync();
    };
    
    $scope.continueSearch = function continueSearch(){
        console.log('Listing more search results');
        $scope.offset += 10;
        socket.emit('search', {'moviename' : $scope.text, 'offset' : $scope.offset});
    };
    
    $scope.rateMovie = function rateMovie() {
        var moviename = $("#moviename").val();
        var movierating = $("#movierating").val();
        var moviereview = $("#moviereview").val();
        var movieyear = $("#movieyear").val();
        
        $('#rateModal').modal('toggle');
        socket.emit('rateMovie', {'moviename' : moviename, 'movierating' : movierating, 'moviereview' : moviereview, 'movieyear' : movieyear});
    };
    
    socket.on('onRateMovie', function(data)  {
        console.log('movie rating/review data received.')
        var messageBox = $('#messageBox');
        var messageText = ''
        if (data['success']) {
            messageBox.removeClass('alert-danger');
            messageBox.addClass('alert-success');
            
            messageText = '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span><span class="sr-only">Success:</span> ' + data['message'];
        } else {
            messageBox.removeClass('alert-success');
            messageBox.addClass('alert-danger');
            
            messageText = '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' + data['message'];            
        }
        
        $scope.$apply();
        
        messageBox.empty();
        messageBox.append(messageText);
        
        messageBox.fadeIn().delay(3000).fadeOut(600);
    });
    
    socket.on('login', function(data) {
        var messageBox = $('#messageBox');
        var messageText = ''
        
        if (data['success']){
            console.log('successfully logged in');
            
            $scope.logged_in = true;
            $scope.username = data['username'];   

            $scope.ratings = data['ratings']
            if ($scope.ratings > 0) {
                
            }
            
            messageBox.removeClass('alert-danger');
            messageBox.addClass('alert-success');
            
            messageText = '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span><span class="sr-only">Success:</span> ' + data['message'];
        } else {
            console.log('unsuccessful log in');
            
            $scope.logged_out = true;
            
            messageBox.removeClass('alert-success');
            messageBox.addClass('alert-danger');
            
            messageText = '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' + data['message'];
            
        }
        
        $scope.$apply()
        
        
        messageBox.empty();
        messageBox.append(messageText);
        
        messageBox.fadeIn().delay(3000).fadeOut(600);
    });
    
    socket.on('populateHomePage', function(data){
       $scope.top12query = []
       $scope.top12query = data['top12query']
       $scope.$apply()
    });
    
    socket.on('register', function(data){
        var messageBox = $('#messageBox');
        var messageText = ''
        if (data['success']) {
            console.log('successfully registered');
            
            messageBox.removeClass('alert-danger');
            messageBox.addClass('alert-success');
            
            messageText = '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span><span class="sr-only">Success:</span> ' + data['message'];
        } else {
            console.log('unsuccessful registration attempt');
            
            messageBox.removeClass('alert-success');
            messageBox.addClass('alert-danger');
            
            messageText = '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' + data['message'];
            
        }
        messageBox.empty();
        messageBox.append(messageText);
        
        messageBox.fadeIn().delay(3000).fadeOut(600);
    });
    
    socket.on('logout', function(data) {
        console.log('logged out...');
        var messageBox = $('#messageBox');
        var messageText = ''
        if (data['success']) {
            console.log('successfully logged out');
            
            $scope.logged_in = false
            $scope.$apply();
            
            
            
            messageBox.removeClass('alert-danger');
            messageBox.addClass('alert-success');
            
            messageText = '<span class="glyphicon glyphicon-ok" aria-hidden="true"></span><span class="sr-only">Success:</span> ' + data['message'];
        } else {
            console.log('unsuccessful registration attempt');
            
            messageBox.removeClass('alert-success');
            messageBox.addClass('alert-danger');
            
            messageText = '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' + data['message'];
            
        }
        
        messageBox.empty();
        messageBox.append(messageText);
        
        messageBox.fadeIn().delay(3000).fadeOut(600);
    });
    
    socket.on('error', function(error) {
        if (error['exists']) {
            switch (error['type']) {
                case 'login':
                    // invoke login error
                    break;
                case 'register':
                    // invoke register error
                    break;
                case 'recommend':
                    // invoke recommend error
                    break;
            }
        }
    });
    
    socket.on('searchResults', function(data){
        
        
        var messageBox = $('#messageBox');
        var messageText = ''
        var results = data['results'];
        if (results.length > 0) {
            $("#searchResultsPanel").show();
        } else {
            
            $("#searchModal").modal('toggle');
            messageBox.removeClass('alert-success');
            messageBox.addClass('alert-danger');
            
            messageText = '<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span><span class="sr-only">Error:</span> ' + data['message'];
            messageBox.empty();
            messageBox.append(messageText);
        
            messageBox.fadeIn().delay(3000).fadeOut(600);
        }
        
        if (results.length < 10) {
            $('#continueSearch').hide();
        } else {
            $('#continueSearch').show();
        }
        
        
        for(var i = 0; i < results.length; i++){
            $scope.searchResults.push(results[i]);
            var genreString = "";
            for(let genre of results[i]['genres']){
                genreString +=  genre + ", ";
            }
            var newStr = genreString.substring(0, genreString.length-2);
            results[i]['genres'] = newStr;
        }
        $scope.$apply();
        
    });
    
    socket.on('recommendationResults', function(data){
        $scope.recommendationResults = [];
        var results = data['results']
        $("#recommendationModal").modal('show');
        for(var i = 0; i < results.length; i++){
            console.log(results[i]);
            $scope.recommendationResults.push(results[i]);
        }
        
        $scope.$apply();
    });
    
    $scope.recommend = function recommend(){
        console.log('user clicked recommend');
        socket.emit('recommend', 'recommend');
    };
    
    $scope.login = function login(){
        console.log('user clicked login');
        var username = $('#username').val();
        var password = $('#password').val();
        
        if (username.length == 0 || password.length == 0) {
            return;
        }
        
        socket.emit('login', {'username' : username, 'password' : password});
        
        $('#loginModal').modal('toggle');
    };
    
    $scope.logout = function logout(){
        console.log('user clicked logout');
        socket.emit('logout', {'empty': 'blah'});
    };
    
    $scope.register = function register(){
        console.log('user clicked register');
        var username = $('#registerUsername').val();
        var password = $('#registerPassword').val();
        var confirmPassword = $('#registerConfirmPassword').val()
        var firstname = $('#firstName').val()
        var lastname = $('#lastName').val()
        
        if (username.length == 0 || password.length == 0 || confirmPassword.length == 0 || firstname.length == 0 || lastname.length == 0) {
            return;
        }
        
        socket.emit('register', {'username' : username, 'password' : password, 'confirmPassword' : confirmPassword, 'firstname' : firstname, 'lastname' : lastname});
        $('#registerModal').modal('toggle');
    };

    
    $scope.setName = function setName(){
      socket.emit('identify', $scope.name)  
    };
    
    socket.on('on_connect', function(data){
       console.log('Connected'); 
       $scope.logged_in = data['logged_in'];
       console.log('logged in: ');
       console.log(data['logged_in']);
       $scope.$apply();
    });
    
    $scope.rate = function rate(result){
        console.log('Rating: ', result);
        $("#searchModal").modal('hide');
        var text = '<input class="form-control" type="text" name="moviename" id="moviename" value=' + '"' + result['text'] +'">'
        var yearText = '<input class="form-control" type="hidden" name="movieyear" id="movieyear" value=' + '"' + result['year'] +'">'
        console.log(text);
        $scope.rateText = $sce.trustAsHtml(text);
        $scope.year = $sce.trustAsHtml(yearText);
        console.log($scope.rateText);
        $("#rateModal").modal('show');
        $scope.text = '';
    };
});


