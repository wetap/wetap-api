'use strict';

var app = angular.module('app');

app.controller('WaterFountainIndexController', ['$scope', 'WaterFountain', function ($scope, WaterFountain) {
  //Grab all waterFountains from the server
  $scope.items = WaterFountain.query();

  //Destroy method for deleting a waterFountain
  $scope.destroy = function (index) {

    //Tell the server to remove the object
    WaterFountain.remove({id: $scope.items[index].id}, function () {
      //If successful, remove it from our collection
      $scope.items.splice(index, 1);
    });
  }
}]);

app.controller('WaterFountainCreateController', ['$scope', '$location', 'WaterFountain', function ($scope, $location, WaterFountain) {
  //The save method which is called when the user wants to submit their data
  $scope.save = function () {

    //Create the waterFountain object to send to the back-end
    var waterFountain = new WaterFountain($scope.waterFountain);

    //Save the waterFountain object
    waterFountain.$save(function () {

      //Redirect us back to the main page
      $location.path('/');

    }, function (response) {

      //Post response objects to the view
      $scope.errors = response.data.errors;
    });
  }
}]);

//A controller to show the waterFountain and all it's glory
app.controller('WaterFountainShowController', ['$scope', 'WaterFountain', '$routeParams', function ($scope, WaterFountain, $routeParams) {
  //Grab the waterFountain from the server
  $scope.waterFountain = WaterFountain.get({id: $routeParams.id})
}]);
