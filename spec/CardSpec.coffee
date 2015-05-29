assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

describe "deck integrity", ->

  it "should not duplicate cards when dealing initial hands", ->
    collection = new Deck()
    collection.dealPlayer()
    collection.dealDealer()
    assert.strictEqual collection.length, 48

  it "should not duplicate cards player or dealer hits", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    dealerHand = collection.dealDealer()
    assert.strictEqual collection.length, 48
    playerHand.hit()
    dealerHand.hit()
    assert.strictEqual collection.length, 46

