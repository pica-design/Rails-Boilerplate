class App.Views.PostsView extends Backbone.View
  template: -> JST["backbone/templates/posts"];
  el: '.page-content .content'
  events:
    'click .logo': 'logo'
    'click #back': 'go_back'

  initialize: ->
    @listenTo @collection, 'sync', @render
  render: ->
    @$el.html @template()
    i = 0;
    posts = new Array()
    for model in @collection.models
      posts[i] = new App.Models.Post(model.attributes)
      posts[i].fetch({reset: true})
      postView = new App.Views.PostView(model: posts[i])
      i++
    return this
  go_back: ->
    Backbone.history.history.back()
    # Backbone.hi
