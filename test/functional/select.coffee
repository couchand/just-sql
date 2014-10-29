# select functional tests

{select, from, where, equals, sum, all, groupBy} = require 'just-sql'

describe "select", ->
  describe "simple queries", ->
    it "should create legal SQL", ->
      query = select ['Id', 'Name', 'Department'],
        from 'Employees'
        where equals 'Id', 347

      query.toString().should.equal "SELECT Id, Name, Department\nFROM Employees\nWHERE Id = 347"

  describe "grouping query", ->
    it "should create legal SQL", ->
      query = select [
        sum 'Amount'
        'Type'
      ],
        from 'Deals'
        where all [
          equals 'IsClosed', true
          equals 'IsWon', true
        ]
        groupBy 'Type'

      query.toString().should.equal "SELECT SUM(Amount), Type\nFROM Deals\nWHERE IsClosed = true\nAND IsWon = true\nGROUP BY Type"

  describe "errors", ->
    it "expects a select list", ->
      (->
        select from 'Deals'
      ).should.throw /select/i

    it "expects a from clause", ->
      (->
        select ['Id'], 'Deals'
      ).should.throw /from/i

    it "expects where before group", ->
      (->
        select ['Id', 'Name'],
          from 'Deals'
          groupBy 'Id'
          where equals 'Name', 'Foobar'
      ).should.throw /where/i
