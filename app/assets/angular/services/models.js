'use strict';

var app = angular.module('app');
app.factory('WaterFountain', ['$resource', function($resource) {
    return $resource('/water_fountains/:id', {id: '@id'});
}]);
