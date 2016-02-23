class App.Views.PostView extends Backbone.View
  template: JST['backbone/templates/post'];
  el: '#posts_table'
  events:
    'click .fa-edit': 'go_to_edit'
    'click .post_title': 'go_to_edit'
  initialize: ->
    @listenTo @model, 'sync', @render
    this.delegateEvents(this.events)
  render: ->
    @model.created_at = new Date(@model.created_at).toDateString()
    @$el.append @template(@model.toJSON())
    return this
  go_to_edit: (ev) ->
    title = this.model.get("title")
    console.log title