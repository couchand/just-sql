# select query

from = require './from'
where = require './where'
groupBy = require './groupBy'

class Select
  constructor: (fields, source, others) ->
    @_fields = [].concat fields
    @_from = source
    @_others = others or []

  addOther: (thing) ->
    @_others.push thing

  toString: ->
    fields = @_fields.join ", "
    source = @_from.toString()
    others = if @_others.length
      "\n#{@_others.map((o) -> o.toString()).join '\n'}"
    else
      ""
    """
    SELECT #{fields}
    #{source}#{others}
    """

parseSubsequent = (query, params) ->
  sawJoin = no
  sawWhere = no
  sawGroup = no
  sawOrder = no

  for param in params
    if where.isWhere param
      if sawGroup
        throw new Error "Where clause must preceed group clause"
      sawWhere = yes

    if groupBy.isGroupBy param
      if sawOrder
        throw new Error "Group By clause must preceed order by"
      sawGroup = yes

    query.addOther param

  query

select = (params...) ->
  unless Array.isArray(params[0]) and params[0].length > 0
    throw new Error "Expected select list, got #{params[0]}"

  unless from.isFrom params[1]
    throw new Error "Expected from clause, got #{params[1]}"

  query = new Select params[0], params[1]

  parseSubsequent query, params[2...]

select.isSelect = (thing) ->
  return thing instanceof Select

module.exports = select
