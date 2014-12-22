should = require 'should'
setup = require '../../setup'
data = require './data'

describe 'Add', ->
  @beforeEach ->
    setup @, data

  it 'should add two numbers', ->
    @onePlusTwo.exec(@ctx).should.equal 3

  it 'should add multiple numbers', ->
    @addMultiple.exec(@ctx).should.equal 55

  it 'should add variables', ->
    @addVariables.exec(@ctx).should.equal 21

describe 'Subtract', ->
  @beforeEach ->
    setup @, data

  it 'should subtract two numbers', ->
    @fiveMinusTwo.exec(@ctx).should.equal 3

  it 'should subtract multiple numbers', ->
    @subtractMultiple.exec(@ctx).should.equal 15

  it 'should subtract variables', ->
    @subtractVariables.exec(@ctx).should.equal 1

describe 'Multiply', ->
  @beforeEach ->
    setup @, data

  it 'should multiply two numbers', ->
    @fiveTimesTwo.exec(@ctx).should.equal 10

  it 'should multiply multiple numbers', ->
    @multiplyMultiple.exec(@ctx).should.equal 120

  it 'should multiply variables', ->
    @multiplyVariables.exec(@ctx).should.equal 110

describe 'Divide', ->
  @beforeEach ->
    setup @, data

  it 'should divide two numbers', ->
    @tenDividedByTwo.exec(@ctx).should.equal 5

  it 'should divide two numbers that don\'t evenly divide', ->
    @tenDividedByFour.exec(@ctx).should.equal 2.5

  it 'should divide multiple numbers', ->
    @divideMultiple.exec(@ctx).should.equal 5

  it 'should divide variables', ->
    @divideVariables.exec(@ctx).should.equal 25

describe 'Negate', ->
  @beforeEach ->
    setup @, data

  it 'should negate a number', ->
    @negativeOne.exec(@ctx).should.equal -1

describe 'MathPrecedence', ->
  @beforeEach ->
    setup @, data

  it 'should follow order of operations', ->
    @mixed.exec(@ctx).should.equal 46

  it 'should allow parentheses to override order of operations', ->
    @parenthetical.exec(@ctx).should.equal -10

describe  'Power', ->
  @beforeEach ->
    setup @, data

  it "should be able to calculate the power of a number" , ->
    @pow.exec(@ctx).should.equal 81

describe 'TruncatedDivide', ->
  @beforeEach ->
    setup @, data

  it "should be able to return just the integer portion of a division", ->
    @trunc.exec(@ctx).should.equal 3
    @even.exec(@ctx).should.equal 3

describe  'Truncate', ->
  @beforeEach ->
    setup @, data   

  it "should be able to return the integer portipon of a number", ->
    @trunc.exec(@ctx).should.equal 10
    @even.exec(@ctx).should.equal 10

describe  'Floor', ->
  @beforeEach ->
    setup @, data         

  it "should be able to round down to the closest integer", ->
    @flr.exec(@ctx).should.equal 10
    @even.exec(@ctx).should.equal 10

describe 'Ceiling', ->
  @beforeEach ->
    setup @, data 

    it "should be able to round up to the closest integer", ->
      @ceil.exec(@ctx).should.equal 11
      @even.exec(@ctx).should.equal 10

describe 'Ln', ->
  @beforeEach ->
    setup @, data      

  it "should be able to return the natrual log of a number", ->
    @ln.exec(@ctx).should.equal Math.log(4)

describe 'Log', ->
  @beforeEach ->
    setup @, data      

    it "should be able to return the log of a number based on an arbitary base value", ->
      @log.exec(@ctx).should.equal 0.25

describe 'Modulo', ->
  @beforeEach ->
    setup @, data      

    it "should be able to return the remainder of a division", ->
      @mod.exec(@ctx).should.equal 1
    
describe 'Abs', ->
  @beforeEach ->
    setup @, data

  it "should be able to return the absolute value of a positive number", ->
    @pos.exec(@ctx).should.equal 10
  it "should be able to return the absolute value of a negative number", ->    
    @neg.exec(@ctx).should.equal 10
  it "should be able to return the absolute value of 0", ->    
    @zero.exec(@ctx).should.equal 0

describe 'Round', ->
  @beforeEach ->
    setup @, data

  it "should be able to round a number up or down to the closest integer value", ->
    @up.exec(@ctx).should.equal 5
    @down.exec(@ctx).should.equal 4
  