class App.Views.Header extends Backbone.View
  template: -> $('.header').html();
  el: '.header'
  events:
    'click .logo': 'logo'
    'click .chat-menu-toggle': 'toggle_chat'
    # 'click #my-task-list': 'toggle_tasks'

  initialize: ->
    @render();
    $('#my-task-list').popover({
        html: true,
        trigger: 'click'
        content: $('#notification-list').html();
    });
  render: ->
    @$el.html @template
  logo: ->
    alert('Logo')
  toggle_chat: ->
    $.Webarch.toggleRightSideBar()
  toggle_tasks: ->