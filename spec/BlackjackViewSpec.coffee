assert = chai.assert
expect = chai.expect

describe "app view", ->
  app = null
  appView = null

  beforeEach ->
    app = new App()
    appView = new AppView model: app

  it "should create a game view", ->
    expect(appView.gameView).to.not.be.undefined

  it "should keep track of the player score", ->
    playerScore = app.get('game').get('playerHand').score().toString()
    displayedScore = appView.gameView.$el.find(".player-hand-container").find(".score").text()
    assert.strictEqual playerScore, displayedScore


  it "should keep track of the dealer score", ->
    dealerScore = app.get('game').get('dealerHand').score().toString()
    displayedScore = appView.gameView.$el.find(".dealer-hand-container").find(".score").text()
    assert.strictEqual dealerScore, displayedScore

  it "should render new AppView on game end", ->
    spy = sinon.spy(AppView.prototype, 'render')
    app.get('game').trigger('endGame', app.get('game'))
    assert.isFalse spy.calledTwice
    assert.isTrue spy.calledOnce





