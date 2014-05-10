'use strict';

var app = angular.module('app');

app.factory('WaterFountain', ['$resource', function($resource) {

    var waterFountainFactory = $resource('/water_fountains/:id', {id: '@id'});
    
    waterFountainFactory.prototype.longitude = function(){
      return this.location.coordinates[0];
    };

    waterFountainFactory.prototype.latitude = function(){
      return this.location.coordinates[1];
    };
    
    return waterFountainFactory;
  }]
);
