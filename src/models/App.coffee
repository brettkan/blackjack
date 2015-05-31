
class window.App extends Backbone.Model

  defaults:
    purse: 500
    currentBet: 0

  initialize: ->
    @set 'game', game = new Game()

    context = @
    @get('game').on 'playerWins', ->
      newValue = context.get('purse') + context.get('currentBet')
      context.set 'purse', newValue

    @get('game').on 'dealerWins', ->
      newValue = context.get('purse') - context.get('currentBet')
      context.set 'purse', newValue
