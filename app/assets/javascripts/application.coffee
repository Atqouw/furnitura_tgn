#= require ./plugins/index
#= require_tree ./core
#= require_tree ./classes

$ ->
  Application.app = new Application.Core
  Application.app.start()
