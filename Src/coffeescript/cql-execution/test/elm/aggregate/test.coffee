should = require 'should'
setup = require '../../setup'
data = require './data'

describe 'Count', ->
  @beforeEach ->
    setup @, data

  it 'should be able to count lists without nulls', ->
    @not_null.exec(@ctx).should.equal 5
  it 'should be able to count lists with nulls', ->
    @has_null.exec(@ctx).should.equal 2
  it 'should be able to count empty list', ->
    @empty.exec(@ctx).should.equal 0

describe 'Sum', ->
  @beforeEach ->
    setup @, data

  it 'should be able to sum lists without nulls', ->
    @not_null.exec(@ctx).should.equal 15
  it 'should be able to sum lists with nulls', ->
    @has_null.exec(@ctx).should.equal 3
  it 'should be able to sum empty list', ->
    @empty.exec(@ctx) == null

describe 'Min', ->
  @beforeEach ->
    setup @, data

  it 'should be able to find min in  lists without nulls', ->
    @not_null.exec(@ctx).should.equal 0
  it 'should be able to find min in  lists with nulls', ->
    @has_null.exec(@ctx).should.equal -1
  it 'should be return null for empty list', ->
    @empty.exec(@ctx) == null

describe 'Max', ->
  @beforeEach ->
    setup @, data

  it 'should be able to find max in  lists without nulls', ->
    @not_null.exec(@ctx).should.equal 10
  it 'should be able to find max in  lists with nulls', ->
    @has_null.exec(@ctx).should.equal 2
  it 'should be return null for empty list', ->
    @empty.exec(@ctx) == null

describe 'Avg', ->
  @beforeEach ->
    setup @, data
  it 'should be able to find average   lists without nulls', ->
    @not_null.exec(@ctx).should.equal 3
  it 'should be able to find average   lists with nulls', ->
    @has_null.exec(@ctx).should.equal 1.5
  it 'should be return null for empty list', ->
    @empty.exec(@ctx) == null   

describe 'Median', ->
  @beforeEach ->
    setup @, data

  it 'should be able to find median of odd numbered list', ->
    @odd.exec(@ctx).should.equal 3
  it 'should be able to find median of even numbered list', ->
    @even.exec(@ctx).should.equal 3.5
  it 'should be able to find median of odd numbered list that contains duplicates', ->
    @dup_vals_odd.exec(@ctx).should.equal 3
  it 'should be able to find median of even numbered list that contians duplicates', ->
    @dup_vals_even.exec(@ctx).should.equal 2.5    
  it 'should be return null for empty list', ->
    @empty.exec(@ctx) == null       
 
describe.skip 'Mode', ->
  @beforeEach ->
    setup @, data
  it 'should be able to find mode  of lists without nulls', ->
    @not_null.exec(@ctx).should.equal 2
  it 'should be able to find Mode   lists with nulls', ->
    @has_null.exec(@ctx).should.equal 2
  it 'should be return null for empty list', ->
    @empty.exec(@ctx) == null  
  it 'should be able to find bimodal', ->
    @bi_modal.exec(@ctx).should.equal [2,3]   

