var app = angular.module('app.exampleApp')

app.controller('RacesCtrl', ['$scope', '$http', function($scope, $http) {
  console.log("RacesCtrl is running")

  $scope.names = [];

  var config = { headers:  {
        'Authorization': 'Token token=c0efb4d89fd6535467433796edee070e'
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
      title : $scope.race.title,
      start_at : $scope.race.start_at,
      end_at : $scope.race.end_at
    }
    $http.post('./api/v1/races', dataObject, config ).
    success(function(data, status, headers, config) {
      $scope.races.push(data);
      $scope.race.title = ""
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
