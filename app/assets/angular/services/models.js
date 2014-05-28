'use strict';

var weTap = angular.module('weTap');

weTap.factory('WaterFountain', ['$resource', function ($resource) {

  var waterFountainFactory = $resource('/water_fountains/:id.json', {id: '@id'});

  waterFountainFactory.prototype.longitude = function () {
    if (angular.isDefined(this.location)) {return this.location.coordinates[0];}
  };

  waterFountainFactory.prototype.latitude = function () {
    if (angular.isDefined(this.location)) {return this.location.coordinates[1];}
  };

  return waterFountainFactory;
}]);
