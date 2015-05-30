
# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @gameSetup()

  endGame: =>
    playerScore = @get('playerHand').score()
    dealerScore = @get('dealerHand').score()
    if playerScore > dealerScore
      @playerWins()
    else if playerScore < dealerScore
      @dealerWins()
    else
      @tie()

  playerWins: ->
    alert 'Player wins'
    @trigger 'playerWins', @
    @refreshGame()

  dealerWins: ->
    alert 'Dealer wins'
    @trigger 'dealerWins', @
    @refreshGame()

  playerStand: ->
    hand = @get 'dealerHand'
    hand.revealFirstCard()
    while hand.score() < 17
      hand.hit()
    if hand.score() <= 21
      @endGame()

  tie: ->
    alert 'Game results in push'
    @refreshGame()

  refreshGame: ->
    @gameSetup()
    @trigger 'endGame', @

  gameSetup: ->
    deck = @get('deck')
    console.log deck.length
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'bust', => @dealerWins()
    (@get 'dealerHand').on 'bust', => @playerWins()
    (@get 'playerHand').on 'playerStand', => @playerStand()









