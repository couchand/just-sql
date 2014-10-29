# groupBy clause

class GroupBy
  constructor: (fields) ->
    @_fields = fields
  toString: ->
    "GROUP BY #{@_fields.join ', '}"

groupBy = (params...) ->
  for param in params
    unless "#{param}" is param
      throw new Error "Expected field name, got #{param}"

  new GroupBy params

groupBy.isGroupBy = (thing) ->
  thing instanceof GroupBy

module.exports = groupBy
