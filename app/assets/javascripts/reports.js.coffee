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
    $scope.filters.date=date
  $scope.setRepo = (repo) ->
    $scope.filters.repo = {}
    $scope.filters.repo.name=repo

  $scope.setData = (data) ->
    $scope.events = data
    console.log data
    angular.forEach $scope.events, (event) ->
      a = moment(event.created_at)
      b = moment()
      event.date = "#{b.diff(a, 'days')}"

]