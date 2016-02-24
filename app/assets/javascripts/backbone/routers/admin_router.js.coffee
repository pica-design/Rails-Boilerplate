class App.Routers.AdminRouter extends Backbone.Router
  routes:
    '': 'index',
    'admin/posts': 'view_posts'
    'admin/posts/new': 'post',
    'admin/posts/:id/edit': 'post',
    'contact': 'contact'
  initialize: ->
    console.log "router"
    App.headerView = new App.Views.Header()
    App.footerView = new App.Views.Footer()
    App.adminSideView = new App.Views.AdminSide()
    App.adminChatView = new App.Views.AdminChat()
    return
  view_posts: ->
    App.posts = new App.Collections.PostsCollection
    App.posts.fetch({reset: true})
    App.postsListView = new App.Views.PostsView(collection: App.posts)
  post: (id) ->
    post = App.post = new App.Models.Post({id: id})
    post.fetch()
    window.postView = new App.Views.SinglePostView({model: post})
    # window.postView.render()