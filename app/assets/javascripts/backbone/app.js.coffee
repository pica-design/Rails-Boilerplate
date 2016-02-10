#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.App =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  redirectHashBang: ->
    window.location = window.location.hash.substring(2)
  init: ->
     new App.Routers.ApplicationRouter()
     Backbone.history.start pushState: true

  # DOM is ready, are we routing a #!?
$ ->
  if window.location.hash.indexOf('!') > -1
    return App.redirectHashBang()