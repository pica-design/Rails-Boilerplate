class App.Views.AdminSide extends Backbone.View
  template: -> $('.page-sidebar').html();
  el: '.page-sidebar'
  events:
    'click .logo': 'logo'
    'click .page-sidebar li a': 'toggle_submenu'

  initialize: ->
    @render();

  render: ->
    @$el.html @template
  logo: ->
    alert('Logo')
  toggle_submenu: ->
    sidebar = $('.page-sidebar').find('li > a')
    sidebar.find('li > a').on 'click', (e) ->
      if $(sidebar).next().hasClass('sub-menu') == false
        return
      parent = $(sidebar).parent().parent()
      parent.children('li.open').children('a').children('.arrow').removeClass 'open'
      parent.children('li.open').children('a').children('.arrow').removeClass 'active'
      parent.children('li.open').children('.sub-menu').slideUp 200
      parent.children('li').removeClass 'open'
      sub = jQuery(sidebar).next()
      if sub.is(':visible')
        jQuery('.arrow', jQuery(sidebar)).removeClass 'open'
        jQuery(sidebar).parent().removeClass 'active'
        sub.slideUp 200, ->
      else
        jQuery('.arrow', jQuery(sidebar)).addClass 'open'
        jQuery(sidebar).parent().addClass 'open'
        sub.slideDown 200, ->
      e.preventDefault()
      return