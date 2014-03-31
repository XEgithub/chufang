'use strict';

/* Controllers */

var phonecatControllers = angular.module('phonecatControllers', []);

phonecatControllers.controller('PhoneListCtrl', ['$scope', '$http',
  function($scope, $http) {
    $http.get('data/patients.json').success(function(data) {
      $scope.phones = data;
    });

    $scope.orderProp = 'name';
  }]);

phonecatControllers.controller('PhoneDetailCtrl', ['$scope', '$routeParams', '$http',
  function($scope, $routeParams, $http) {
    $http.get('data/' + $routeParams.phoneId + '.json').success(function(data) {
      //alert();
      $scope.phone = data;
      $scope.mainImageUrl = data.case_photoes[0];
    });

    $scope.setImage = function(imageUrl) {
      $scope.mainImageUrl = imageUrl;
    }
  }]);

phonecatControllers.controller('inputCaseCtrl', ['$scope', '$http',
  function($scope, $http) {
    $http.get('data/patients.json').success(function(data) {
      $scope.phones = data;
    });
  }]);

phonecatControllers.controller('saveCaseCtrl', ['$scope', '$http',
  function($scope, $http) {
    $http.get('data/patients.json').success(function(data) {
      $scope.phones = data;
    });
  }]);