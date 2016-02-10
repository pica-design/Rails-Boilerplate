class App.Views.Home extends Backbone.View
  template: -> $('#pagewrapper').html();
  el: '#pagewrapper'
  events:
    'click .somethingspecial': 'doesSomething'

  initialize: ->
    @render();

  render: ->
    @$el.html @template

  doesSomething: ->
    alert('Im doing something')

