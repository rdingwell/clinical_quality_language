module.exports.typeIsArray = Array.isArray || ( value ) ->
  return {}.toString.call( value ) is '[object Array]'

module.exports.allTrue = (things) ->
  if typeIsArray things
    things.every (x) -> x
  else
    things

module.exports.anyTrue = (things) ->
  if typeIsArray things
    things.reduce (x,y) -> x || y
  else
    things