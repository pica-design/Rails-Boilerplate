class App.Views.AdminChat extends Backbone.View
  template: -> $('.chat-window-wrapper').html();
  el: '.chat-window-wrapper'
  events:
    'click .logo': 'logo'
    'click .chat-menu-toggle': 'toggle_chat'

  initialize: ->
    @render();

  render: ->
    @$el.html @template
  logo: ->
    alert('Logo')
  toggle_chat: ->
    $.Webarch.toggleRightSideBar()