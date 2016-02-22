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

     # If we are in the admin section load the admin router
     # else load the regular router
     if document.location.pathname.indexOf("/admin") == 0
        new App.Routers.AdminRouter()
     else
      new App.Routers.ApplicationRouter()

     Backbone.history.start pushState: true

  # DOM is ready, are we routing a #!?
$ ->
  if window.location.hash.indexOf('!') > -1
    return App.redirectHashBang()

_.extend(App, Backbone.Events);


window.slugify = (text) ->
  text.toString().toLowerCase().replace(/\s+/g, '-').replace(/[^\w\-]+/g, '').replace(/\-\-+/g, '-').replace(/^-+/, '').replace /-+$/, ''