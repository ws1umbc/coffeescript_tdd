window.Raffler = 
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}



  init: -> 
    console.log 'Hello from Backbone!'
    new Raffler.Routers.Entries
    Backbone.history.start()

class Raffler.Routers.Entries extends Backbone.Router
  routes:
    '': 'index'
    'entries/:id': 'show'
  initialize: ->
    @collection = new Raffler.Collections.Entries()
    @collection.fetch()             
  index: ->
    view = new Raffler.Views.EntriesIndex(collection: @collection)
    $('#container').html(view.render().el)

class Raffler.Models.Entry extends Backbone.Model
  defaults: 
    name:''
    winner: false


class Raffler.Collections.Entries extends Backbone.Collection
  model: Raffler.Models.Entry
  localStorage: new Backbone.LocalStorage('backbone-coffee-raffle')


class Raffler.Views.EntriesIndex extends Backbone.View
  template:  _.template($('#item-template').html())
  events:
  	'click #new': 'createEntry'
  	'click #draw': 'drawWinner'
  	'click li': 'kill'
  initialize: ->
    @collection.on('sync', @render, this)
    @collection.on('add',@render, this)
  render: ->
    $(@el).html(@template(entries: @collection.toJSON()))
    this
  createEntry: ->
    console.log("You clicked createEntry")
    @collection.create name: $('#new_entry').val()
  drawWinner: ->
    console.log("collection",@collection.length)
    entries = @collection.models
    console.log(entries)
    entry.set(winner: false) for entry in entries
    entry.save() for entry in entries
    winner = @collection.shuffle()[0]
    if winner
      winner.set(winner: true)
      winner.save()
  kill: (ev) ->
    console.log $(ev.target).attr('id') # log the jquery selector for debug
    item=@collection.find (model) ->
        model.get("id") is $(ev.target).attr('id')
    item.destroy()
    this.render()





  


$(document).ready ->
  Raffler.init()

