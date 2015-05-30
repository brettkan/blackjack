assert = chai.assert
expect = chai.expect

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'handScore', ->
    it 'should keep track of hand score', ->
      tenOfSpades = new Card rank: 10, suit: 0
      tenOfClubs = new Card rank: 10, suit: 2
      aceOfSpades = new Card rank: 1, suit: 0
      aceOfHearts = new Card rank: 1, suit: 3
      twoOfSpades = new Card rank: 2, suit: 0

      handOne = new Hand [tenOfSpades, tenOfClubs, aceOfSpades], deck
      handTwo = new Hand [tenOfSpades, tenOfClubs, twoOfSpades], deck
      handThree = new Hand [tenOfSpades, aceOfSpades], deck

      assert.strictEqual handOne.score(), 21
      assert.strictEqual handTwo.score(), 22
      assert.strictEqual handThree.score(), 21

  describe 'bust', ->
    it 'should register a bust on hit', ->
      sinon.spy(hand, 'trigger')
      hand.bust()
      expect(hand.trigger).to.have.been.calledWith('bust', hand)



    xit 'should register a bust if hand score is over 21', ->
      tenOfSpades = new Card rank: 10, suit: 0
      tenOfClubs = new Card rank: 10, suit: 2
      aceOfSpades = new Card rank: 1, suit: 0
      aceOfHearts = new Card rank: 1, suit: 3
      twoOfSpades = new Card rank: 2, suit: 0

      handOne = new Hand [tenOfSpades, tenOfClubs, aceOfSpades], deck
      handTwo = new Hand [tenOfSpades, tenOfClubs, twoOfSpades], deck
      handThree = new Hand [tenOfSpades, aceOfSpades], deck

      handOne.hit()

      ## assert.strictEqual handOne.bust,
      # assert.strictEqual handTwo.score(), 22
      # assert.strictEqual handThree.score(), 21

