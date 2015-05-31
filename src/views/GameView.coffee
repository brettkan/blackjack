
class window.GameView extends Backbone.View
  template: _.template '
    <div class="cards-remaining"> Cards remaining: <%= cardsRemaining %></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  initialize: ->
    @render()
    @model.get('deck').on 'remove', => @renderCardsRemaining()
    @model.on 'newDeck', => @renderCardsRemaining()

  render: ->
    @$el.children().detach()
    @$el.html @template cardsRemaining: @model.get('deck').length
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el

  handlePlayerHit: ->
    @model.get('playerHand').hit()

  handlePlayerStand: ->
    @model.get('playerHand').stand()

  renderCardsRemaining: ->
    @$('.cards-remaining').text 'Cards Remaining: ' + @model.get('deck').length

