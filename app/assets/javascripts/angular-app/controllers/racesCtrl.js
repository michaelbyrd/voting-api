var app = angular.module('app.exampleApp')

app.controller('RacesCtrl', ['$scope', '$http', function($scope, $http) {
  console.log("RacesCtrl is running")

  $scope.names = [];

  var config = { headers:  {
        'Authorization': 'Token token=PUT KEY HERE'
      }
  };

  $http.get('./api/v1/races/', config).success(function(data) {
    $scope.races = data;
  });


}]);



// $scope.addUser = function() {
//   $scope.user = { name: $scope.enteredName, email: $scope.enteredEmail }
//   $http.post('/users', $scope.user).
//   success(function(data, status, headers, config) {
//     console.log("successful post");
//   })
// }
