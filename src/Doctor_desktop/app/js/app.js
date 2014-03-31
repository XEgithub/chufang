'use strict';

/* App Module */

var phonecatApp = angular.module('phonecatApp', [
  'ngRoute',
  'phonecatControllers',
  'phonecatFilters'
]);

phonecatApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/phones', {
        templateUrl: 'partials/phone-list.html',
        controller: 'PhoneListCtrl'
      }).
      when('/phones/:phoneId', {
        templateUrl: 'partials/phone-detail.html',
        controller: 'PhoneDetailCtrl'
      }).
      when('/listImages', {
        templateUrl: 'partials/listImages.html',
        controller: 'listImagesCtrl'
      }).
      when('/inputCase', {
        templateUrl: 'partials/inputCase.html',
        controller: 'inputCaseCtrl'
      }).
      when('/saveCase', {
        templateUrl: 'partials/saveCase.html',
        controller: 'saveCaseCtrl'
      }).
      otherwise({
        redirectTo: '/phones'
      });
  }]);
