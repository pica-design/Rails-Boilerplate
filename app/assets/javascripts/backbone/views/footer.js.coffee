class App.Views.Footer extends Backbone.View
  template: -> $('#footer').html();
  el: '#footer'
  events:
    'click .something': 'footer'

  initialize: ->
    @render();

  render: ->
    @$el.html @template

  footer: ->
    alert('Something in the Footer')