# just sql

# simple sql syntax checker and compiler
# it's just sql

select = require './select'
from = require './from'
where = require './where'
equals = require './equals'
sum = require './sum'
all = require './all'
groupBy = require './groupBy'
insert = (params) ->
update = (params) ->

module.exports = {select, from, where, equals, sum, all, groupBy, insert, update}
