class App.Views.Header extends Backbone.View
  template: -> $('.header').html();
  el: '.header'
  events:
    'click .logo': 'logo'
    'click .chat-menu-toggle': 'toggle_chat'
    'click #my-task-list': 'toggle_tasks'
    'click #layout-condensed-toggle': 'condens_menu'
    'click #user-options': 'hide_task_list'

  initialize: ->
    @render();
    $('#my-task-list').popover
      html: true
      content: ->
        $('#notification-list').html()
  render: ->
    @$el.html @template
  hide_task_list: ->
    $('#my-task-list').popover('hide');
  toggle_chat: ->
    $("body").toggleChat();
  toggle_tasks: (ev) ->
     $(this).find('#my-task-list').popover({
        html: true,
        trigger: 'click'
        content: $('#notification-list').html();
    });
  condens_menu: ->
    $("body").condensMenu();