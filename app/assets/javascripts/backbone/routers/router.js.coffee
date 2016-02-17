class App.Routers.ApplicationRouter extends Backbone.Router
    routes:
      '': 'index',
      'about': 'about',
      'contact': 'contact'
    initialize: ->
      # window.headerView = new App.Views.Header()
      # window.footerView = new App.Views.Footer()
      # window.adminSideView = new App.Views.AdminSide()
      # window.adminChatView = new App.Views.AdminChat()
    about: ->
      window.aboutView = new App.Views.About()
    index: ->
      window.indexView = new App.Views.Home()
    contact: ->
      window.contactView = new App.Views.Contact()