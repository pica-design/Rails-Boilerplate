class App.Views.PostView extends Backbone.View
  template: JST['backbone/templates/admin/post'];
  tagName: 'tr'
  className: 'gradeX odd'
  events:
    'click .fa-edit': 'go_to_edit'
    'click .post_title': 'go_to_edit'
  initialize: ->
    @listenTo @model, 'sync', @render
    this.delegateEvents(this.events)
  render: ->
    console.log @model.toJSON()
    html = @template(@model.toJSON())
    @$el.append html
    return this
  go_to_edit: (ev) ->
    Backbone.history.navigate("admin/posts/" + @model.get('id') + "/edit", true)
    # console.log title