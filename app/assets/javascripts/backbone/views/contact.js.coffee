class App.Views.Contact extends Backbone.View
  template: -> JST["backbone/templates/contact"]
  el: '#pagewrapper'

  initialize: ->
    @render();

  render: ->
    @$el.html @template