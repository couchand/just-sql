# all clause

class All
  constructor: (specs) ->
    @_specs = specs
  toString: ->
    @_specs
      .map (spec) -> spec.toString()
      .join "\nAND "

all = (param) ->
  unless Array.isArray(param) and param.length > 0
    throw new Error "Expected specification list, got #{param}"

  new All param

all.isAll = (thing) ->
  thing instanceof All

module.exports = all
