
class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="game"></div>
  '

  events:
    'click .hit-button': 'handlePlayerHit'
    'click .stand-button': 'handlePlayerStand'

  initialize: ->
    @render()

    @model.on 'change:game', =>
      @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @gameView = new GameView(model: @model.get 'game')
    @$('.game').html @gameView.el

  handlePlayerHit: ->
    @gameView.handlePlayerHit()

  handlePlayerStand: ->
    @gameView.handlePlayerStand()

