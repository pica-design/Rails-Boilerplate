class App.Views.PostsView extends Backbone.View
  template: -> JST["backbone/templates/admin/posts"];
  el: '.page-content .content'
  events:
    'click .logo': 'logo'
    'click #back': 'go_back'

  initialize: ->
    @listenTo @collection, 'sync', @render
  render: ->
    @$el.html @template()
    for model in @collection.models
      post = new App.Models.Post(model.attributes)
      post.fetch({reset: true})
      postView = new App.Views.PostView(model: post)
      $('#posts_table').append postView.el
    return this
  go_back: ->
    Backbone.history.history.back()
    # Backbone.hi
