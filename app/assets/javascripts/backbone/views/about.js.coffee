class App.Views.About extends Backbone.View
    template: -> JST["backbone/templates/about"]
    el: '#pagewrapper'
    initialize: ->
      @render()

    render: ->
      @$el.html @template