ClipboardMasterView = require './clipboard-master-view'
{CompositeDisposable} = require 'atom'

global.sel1 = ''
global.sel2 = ''
global.sel3 = ''
global.sel4 = ''
global.sel5 = ''

module.exports = ClipboardMaster =
  clipboardMasterView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @clipboardMasterView = new ClipboardMasterView(state.clipboardMasterViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @clipboardMasterView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace',
      'clipboard-master:toggle': => @toggle()
      'clipboard-master:grab': => @grab()
      'clipboard-master:paste1': => @paste1()
      'clipboard-master:paste2': => @paste2()
      'clipboard-master:paste3': => @paste3()
      'clipboard-master:paste4': => @paste4()
      'clipboard-master:paste5': => @paste5()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @clipboardMasterView.destroy()

  serialize: ->
    clipboardMasterViewState: @clipboardMasterView.serialize()

  grab: ->
    if editor = atom.workspace.getActiveTextEditor()
      selection = editor.getSelectedText()
      if global.sel1 == ''
        global.sel1 = selection
        console.log 'grab1 ' + global.sel1
      else if global.sel2 == ''
        global.sel2 = selection
        console.log 'grab2'
      else if global.sel3 == ''
        global.sel3 = selection
      else if global.sel4 == ''
        global.sel4 = selection
      else if global.sel5 == ''
        global.sel5 = selection
    else
      console.log 'error in grab'

  paste1: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(global.sel1)
      console.log global.sel1
    else
      console.log 'error in paste1'

  paste2: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(global.sel2)
    else
      console.log 'error in paste2'

  paste3: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(global.sel3)
    else
      console.log 'error in paste3'

  paste4: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(global.sel4)
    else
      console.log 'error in paste4'

  paste5: ->
    if editor = atom.workspace.getActiveTextEditor()
      editor.insertText(global.sel5)
    else
      console.log 'error in paste5'



  toggle: ->
    console.log 'ClipboardMaster was toggled!'
