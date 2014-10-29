# from clause

class From
  constructor: (table) ->
    # simplify to tables right now
    @_table = table
  toString: ->
    "FROM #{@_table}"

from = (param) ->
  unless "#{param}" is param
    throw new Exception "Expected table name, got #{param}"

  new From param

from.isFrom = (thing) ->
  thing instanceof From

module.exports = from
