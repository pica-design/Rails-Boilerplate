class App.Routers.AdminRouter extends Backbone.Router
    routes:
      '': 'index',
      'admin/posts/new': 'posts_new',
      'admin/posts/:id/edit': 'posts_new',
      'contact': 'contact'
    initialize: ->
      window.headerView = new App.Views.Header()
      window.footerView = new App.Views.Footer()
      window.adminSideView = new App.Views.AdminSide()
      window.adminChatView = new App.Views.AdminChat()
      $('#multi').select2({
          theme: "bootstrap"
      });
      $('.input-append.date').datepicker
        autoclose: true
        todayHighlight: true
      return
     posts_new: ->
       window.aboutView = new App.Views.Post()