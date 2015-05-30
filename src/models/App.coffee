
class window.App extends Backbone.Model

  defaults:
    purse: 500
    currentBet: 0

  initialize: ->
    @set 'game', game = new Game()

    context = @
    @get('game').on 'playerWins', ->
      # console.dir context
      newValue = context.get('purse') + context.get('currentBet')
      # console.log newValue
      context.set 'purse', newValue
      console.log newValue

    @get('game').on 'dealerWins', ->
      # console.dir context
      newValue = context.get('purse') - context.get('currentBet')
      # console.log newValue
      context.set 'purse', newValue
      # console.log newValue

