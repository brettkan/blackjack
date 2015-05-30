assert = chai.assert

beforeEach ->
  app = new App()
  appView = new AppView model: App

describe "app view", ->

  it "should create a game view", ->
    assert appView.get('gameView')

describe "deck integrity", ->

