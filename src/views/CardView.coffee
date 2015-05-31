
class window.CardView extends Backbone.View
  className: 'card'

  template: _.template 'url(img/cards/<%= rankName %>-<%= suitName %>.png)'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.css 'background-size', 'contain'
    @$el.css 'background-image', @template @model.attributes
    console.log @template @model.attributes

    @$el.addClass 'covered' unless @model.get 'revealed'
    if @$el.hasClass('covered')
      @$el.css 'background-image', 'url(img/card-back.png)'

