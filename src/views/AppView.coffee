
class window.AppView extends Backbone.View
  template: _.template '
    <span class="betting">
      <div class="purse">Purse: <%=purse %></div>
      <div class="currentBet">Current Bet: <%=currentBet %></div>
    </span>
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="game"></div>
  '

  events:
    'click .hit-button': 'handlePlayerHit'
    'click .stand-button': 'handlePlayerStand'

  initialize: ->
    @promptUser()
    @render()

    @model.get('game').on 'endGame', =>
      @promptUser()
      @render()


  render: ->
    @$el.children().detach()
    # debugger
    @$el.html @template @model.attributes
    @gameView = new GameView(model: @model.get 'game')
    @$('.game').html @gameView.el

  handlePlayerHit: ->
    @gameView.handlePlayerHit()

  handlePlayerStand: ->
    @gameView.handlePlayerStand()

  promptUser: ->
    bet = parseInt prompt 'How much do you want to bet?', 50
    if bet > @model.get 'purse'
      bet = @model.get 'purse'
    @model.set 'currentBet', bet

