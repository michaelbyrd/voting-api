var app = angular.module('app', ['ngRoute']);

// Set up our 404 handler
app.config(['$routeProvider', function ($routeProvider) {
  $routeProvider.otherwise({
    controller: 'Error404Ctrl',
    controllerAs: 'vm',
    templateUrl: 'errors/404/error-404.html'
  });
}]);

// app.config([
//   "$httpProvider", function($httpProvider) {
//     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
//   }
// ]);
