class Watcher

  constructor: ->
    @editor = CodeMirror $('#dirty')[0],
      mode: 'css'
      onChange: @onChange

    @display = CodeMirror $('#clean')[0],
      mode: 'css'
      readonly: true

    $.get '/stylesheets/sample.scss', @load

  load: (d)=>
    @editor.setValue(d)

  onChange: (d) =>
    $.post '/', {css: @editor.getValue() }, @onData

  onData: (cleaned)=>
    @display.setValue(cleaned) if cleaned


new Watcher()
