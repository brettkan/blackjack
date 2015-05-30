assert = chai.assert
expect = chai.expect

describe 'game', ->
  game = null

  beforeEach ->
    game = new Game()

  describe 'game reset mechanics', ->
    xit 'should deal two cards to player and dealer on game reset', ->
      tenOfSpades = new Card rank: 10, suit: 0
      tenOfClubs = new Card rank: 10, suit: 2
      aceOfSpades = new Card rank: 1, suit: 0
      aceOfHearts = new Card rank: 1, suit: 3
      twoOfSpades = new Card rank: 2, suit: 0

      handOne = new Hand [tenOfSpades, tenOfClubs, aceOfSpades], game.get('deck')

      game.set 'playerHand', handOne
      game.trigger 'endGame'
