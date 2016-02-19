class App.Views.AdminChat extends Backbone.View
  template: -> $('.chat-window-wrapper').html();
  el: '.chat-window-wrapper'
  events:
    'click .logo': 'logo'
    'click .chat-menu-toggle': 'toggle_chat'
    'click .user-details-wrapper': 'see_user_details'
    'click .chat_back': 'chat_back'
    'click .bubble': 'sent_time'

  initialize: ->
    @render();

  render: ->
    @$el.html @template
  logo: ->
    alert('Logo')
  toggle_chat: ->
    $.Webarch.toggleRightSideBar()
  chat_back: ->
    $('#messages-wrapper .chat-messages-header .status').removeClass 'online'
    $('#messages-wrapper .chat-messages-header .status').removeClass 'busy'
    el = $('#messages-wrapper').parent('.scroll-content').show()
    if el.length > 0
      $('#chat-users').parent().show()
      $('#messages-wrapper').parent('.scroll-content').hide()
    else
      $('#chat-users').show()
    $('#messages-wrapper').hide()
    $('.chat-input-wrapper').hide()
  sent_time: (ev)->
    $(ev.target).parent().parent('.user-details-wrapper').children('.sent_time').slideToggle()
  see_user_details: ->
    set_user_details $(this).attr('data-user-name'), $(this).attr('data-chat-status')
    el = $('#messages-wrapper').parent('.scroll-content').show()
    if el.length > 0
      $('#chat-users').parent().hide()
      $('#messages-wrapper').parent('.scroll-content').show()
    else
      $('#chat-users').hide()
    $('#messages-wrapper').show()
    $('.chat-input-wrapper').show()
  set_user_details = (username, status) ->
    $('#messages-wrapper .chat-messages-header .status').addClass status
    $('#messages-wrapper .chat-messages-header span').text username
    return
  build_conversation = (msg, isOpponent, img, retina) ->
    if isOpponent == 1
      $('.chat-messages').append '<div class="user-details-wrapper">' + '<div class="user-details">' + '<div class="user-profile">' + '<img src="' + img + '"  alt="" data-src="' + img + '" data-src-retina="' + retina + '" width="35" height="35">' + '</div>' + '<div class="bubble old sender">' + msg + '</div>' + '</div>' + '<div class="clearfix"></div>' + '</div>'
    else
      $('.chat-messages').append '<div class="user-details-wrapper pull-right">' + '<div class="user-details">' + '<div class="bubble old sender">' + msg + '</div>' + '</div>' + '<div class="clearfix"></div>' + '</div>'
    return
  end_message = (msg) ->
    $('.chat-messages').append '<div class="user-details-wrapper pull-right animated fadeIn">' + '<div class="user-details">' + '<div class="bubble old sender">' + msg + '</div>' + '</div>' + '<div class="clearfix"></div>' + '</div>'
    return