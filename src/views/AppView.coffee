
class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="game"></div>
  '

  events:
    'click .hit-button': 'handleHit'
    'click .stand-button': 'handleStand'

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @gameView = new GameView(model: @model.get 'game')
    @$('.game').html @gameView.el

  handleHit: ->
    @gameView.handleHit()

  handleStand: ->
    @gameView.handleStand()

