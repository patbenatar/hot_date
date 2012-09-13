fs = require 'fs'

{print} = require 'util'
{spawn, exec} = require 'child_process'

COFFEE_FILES = [
  "duration.coffee",
  "ext/date.coffee",
  "ext/number.coffee"
]

task "build", "Package for distribution", ->
  emptyLib()
  compileCoffee(false)

task "build:development", "Watch for changes in src and update development package", ->
  compileCoffee(true)

emptyLib = ->
  execute "rm", ["-r", "lib"]

compileCoffee = (development, version = null) ->
  behavior = if development then "-w" else "-c"
  outputPath = if development then "development/lib" else "lib"
  outputFilename = "hot_date.js"
  options = [
    "-j",
    outputFilename,
    behavior,
    "-o",
    outputPath
  ]
  # Add files to compile in proper order
  options.push "src/#{file}" for file in COFFEE_FILES
  execute "coffee", options

execute = (command, options, callback = null) ->
  command = spawn command, options
  command.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  command.stdout.on 'data', (data) ->
    print data.toString()
  command.on 'exit', (code) ->
    callback?() if code is 0