var app = angular.module('app.exampleApp')

app.controller('RacesCtrl', ['$scope', '$http', function($scope, $http) {
  console.log("RacesCtrl is running")

  $scope.names = [];

  var config = { headers:  {
        'Authorization': 'Token token='
      }
  };

  $http.get('./api/v1/races/', config).
  success(function(data) {
    $scope.races = data;
  }).
  error(function(data) {
    $scope.races = [{"title":"Something went wrong with your Authorization","vote_count": 0}]
  });



  $scope.addRace = function() {
    var dataObject = {
      title : $scope.title,
      start_at : "Tue, 03 Mar 2015 21:54:29 -0500",
      end_at : "Wed, 04 Mar 2015 21:54:13 -0500"
    }
    $http.post('./api/v1/races', dataObject, config ).
    success(function(data, status, headers, config) {
    }).
    error(function(data, status, headers, config) {

    });
  }


}]);



// $scope.addUser = function() {
//   $scope.user = { name: $scope.enteredName, email: $scope.enteredEmail }
//   $http.post('/users', $scope.user).
//   success(function(data, status, headers, config) {
//     console.log("successful post");
//   })
// }
