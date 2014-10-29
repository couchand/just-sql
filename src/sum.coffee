# sum clause

class Sum
  constructor: (field) ->
    @_field = field
  toString: ->
    "SUM(#{@_field})"

sum = (param) ->
  unless "#{param}" is param
    throw new Error "Expecting field, got #{param}"

  new Sum param

sum.isSum = (thing) ->
  thing instanceof Sum

module.exports = sum
