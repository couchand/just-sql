# equals specification

class Equals
  constructor: (column, value) ->
    @_column = column
    @_value = value
  toString: ->
    "#{@_column} = #{@_value}"

equals = (column, value) ->
  unless "#{column}" is column
    throw new Error "Expected column name, got #{column}"

  # TODO: input check
  new Equals column, value

equals.isEquals = (thing) ->
  thing instanceof Equals

module.exports = equals
