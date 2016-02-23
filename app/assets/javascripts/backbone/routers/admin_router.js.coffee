class App.Routers.AdminRouter extends Backbone.Router
    routes:
      '': 'index',
      'admin/posts': 'view_posts'
      'admin/posts/': 'view_posts'
      'admin/posts/new': 'post',
      'admin/posts/:id/edit': 'post',
      'contact': 'contact'
    initialize: ->
      console.log "router"
      App.headerView = new App.Views.Header()
      App.footerView = new App.Views.Footer()
      App.adminSideView = new App.Views.AdminSide()
      App.adminChatView = new App.Views.AdminChat()
      $('#multi').select2({
          theme: "bootstrap"
      });
      $('.input-append.date').datepicker
        autoclose: true
        todayHighlight: true
      return
     view_posts: ->
      App.posts = new App.Collections.PostsCollection
      App.posts.fetch({reset: true})
      App.postsListView = new App.Views.PostsView(collection: App.posts)
     post: ->
       window.postView = new App.Views.PostView()
       window.postView.render()