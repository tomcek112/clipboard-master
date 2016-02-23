module.exports =
class ClipboardMasterView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('clipboard-master')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The ClipboardMaster package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  flash: (selection)->
    console.log selection + 'hi'




  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
