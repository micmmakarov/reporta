window.Reporta ||= {}

Reporta.App = angular.module('Reporta', [])

Reporta.App.filter "date", ->
  (date) ->
    moment(date).fromNow()


Reporta.App.controller "MainCtrl", ["$scope", "$http", ($scope, $http) ->
  $scope.filters = {}
  $scope.setType = (type) ->
    $scope.filters.type=type
  $scope.setDate = (date) ->
    $scope.filters.created_at=date
  $scope.setRepo = (repo) ->
    $scope.filters.repo = {}
    $scope.filters.repo.name=repo

    
  $scope.setData = (data) ->
    $scope.events = data
    console.log data
    angular.forEach $scope.events, (event) ->
      event.date = event.created_at[0..9]

]