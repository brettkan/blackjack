
class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()

    # @get('game').on 'endGame', =>
    #   @set 'game', new Game()

