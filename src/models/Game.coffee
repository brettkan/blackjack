
# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'bust', =>
      @dealerWins()
    (@get 'dealerHand').on 'bust', =>
      @playerWins()
    (@get 'playerHand').on 'playerStand', =>
      hand = @get 'dealerHand'
      hand.revealFirstCard()
      while hand.score() < 17
        hand.hit()
      if hand.score() <= 21
        @endGame()

  # Couldn't get this syntax to work...
  #   (@get 'playerHand').on 'bust', @handlePlayerBust, @
  #   (@get 'dealerHand').on 'bust', => @handleDealerBust()
  #   (@get 'playerHand').on 'playerStand', => @handlePlayerStand()

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
    @refreshGame()

  dealerWins: ->
    alert 'Dealer wins'
    @refreshGame()

  tie: ->
    alert 'Game results in push'
    @refreshGame()

  refreshGame: ->
    @initialize()
    @trigger 'endGame', @










