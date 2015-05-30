
# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    (@get 'playerHand').on 'bust', @handlePlayerBust
    (@get 'dealerHand').on 'bust', => @handleDealerBust()
    (@get 'playerHand').on 'playerStand', => @handlePlayerStand()

  handlePlayerBust: =>
    @trigger 'playerBust', @

  handleDealerBust: =>
    @trigger 'dealerBust', @

  handlePlayerStand: =>
    hand = @get 'dealerHand'
    hand.revealFirstCard()
    while hand.score() < 17
      hand.hit()
    if hand.score() > 21
      hand.bust()
    else
      @endGame()


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
    console.log 'Player wins'

  dealerWins: ->
    console.log 'Dealer wins'

  tie: ->
    console.log 'Game results in push'





