# where clause

class Where
  constructor: (spec) ->
    @_spec = spec
  toString: ->
    "WHERE #{@_spec.toString()}"

where = (param) ->
  # TODO: input check
  new Where param

where.isWhere = (thing) ->
  thing instanceof Where

module.exports = where
