{ Expression, UnimplementedExpression } = require './expression'
{ FunctionRef } = require './reusable'
module.exports.Add = class Add extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    args = @execArgs(ctx)
    if (args.some (x) -> not x?) then null else args.reduce (x,y) -> x + y

module.exports.Subtract = class Subtract extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    args = @execArgs(ctx)
    if (args.some (x) -> not x?) then null else args.reduce (x,y) -> x - y

module.exports.Multiply = class Multiply extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    args = @execArgs(ctx)
    if (args.some (x) -> not x?) then null else args.reduce (x,y) -> x * y

module.exports.Divide = class Divide extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    args = @execArgs(ctx)
    if (args.some (x) -> not x?) then null else args.reduce (x,y) -> x / y

module.exports.TruncatedDivide = class TruncatedDivide extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    Math.floor( @execArgs(ctx).reduce (x,y) -> x / y)

# TODO: Remove functionref when ELM does TruncatedDivide natively
module.exports.TruncatedDivideFunctionRef = class TruncatedDivideFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @trunc = new TruncatedDivide {
      "type" : "TruncatedDivide",
      "operand" : json.operand
    }

  exec: (ctx) ->
    @trunc.exec(ctx)    

module.exports.Modulo = class Modulo extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    @execArgs(ctx).reduce (x,y) -> x % y


# TODO: Remove functionref when ELM does Modulo natively
module.exports.ModuloFunctionRef = class ModuloFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Modulo {
      "type" : "Modulo",
      "operand" : json.operand
    }

  exec: (ctx) ->
    @func.exec(ctx)    


module.exports.Ceiling = class Ceiling extends  Expression 
  constructor: (json) ->
    super

  exec: (ctx) ->
    Math.ceil @execArgs(ctx)

# TODO: Remove functionref when ELM does Modulo natively
module.exports.CeilingFunctionRef = class CeilingFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Ceiling {
      "type" : "Ceiling",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   

module.exports.Floor = class Floor extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    Math.floor @execArgs(ctx)

# TODO: Remove functionref when ELM does Floor natively
module.exports.FloorFunctionRef = class FloorFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Floor {
      "type" : "Floor",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   

module.exports.Truncate = class Truncate extends Floor

  # TODO: Remove functionref when ELM does Floor natively
module.exports.TruncateFunctionRef = class TruncateFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Truncate {
      "type" : "Truncate",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   


module.exports.Abs = class Abs extends  Expression
  constructor: (json) ->
    super
  
  exec: (ctx) ->
    Math.abs @execArgs(ctx)

  # TODO: Remove functionref when ELM does Floor natively
module.exports.AbsFunctionRef = class AbsFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Abs {
      "type" : "Abs",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   


module.exports.Negate = class Negate extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    @execArgs(ctx) * -1


  # TODO: Remove functionref when ELM does Floor natively
module.exports.NegateFunctionRef = class NegateFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Negate {
      "type" : "Negate",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   
        


module.exports.Round = class Round extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    Math.round @execArgs(ctx)

  # TODO: Remove functionref when ELM does Round natively
module.exports.RoundFunctionRef = class RoundFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Round {
      "type" : "Round",
      "operand" : json.operand
    }

  exec: (ctx) ->
    @func.exec(ctx)   

module.exports.Ln = class Ln extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    Math.log @execArgs(ctx)

  # TODO: Remove functionref when ELM does Round natively
module.exports.LnFunctionRef = class LnFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Ln {
      "type" : "Ln",
      "operand" : json.operand[0]
    }

  exec: (ctx) ->
    @func.exec(ctx)   

module.exports.Log = class Log extends  Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    @execArgs(ctx).reduce (x,y) -> Math.log(x)/Math.log(y)

  # TODO: Remove functionref when ELM does Log natively
module.exports.LogFunctionRef = class LogFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Log {
      "type" : "Log",
      "operand" : json.operand
    }

  exec: (ctx) ->
    @func.exec(ctx)   
    

module.exports.Power = class Power extends Expression
  constructor: (json) ->
    super

  exec: (ctx) ->
    @execArgs(ctx).reduce (x,y) -> Math.pow(x , y)

  # TODO: Remove functionref when ELM does Power natively
module.exports.PowerFunctionRef = class PowerFunctionRef extends FunctionRef
  constructor: (json) ->
    super
    @func = new Power {
      "type" : "Power",
      "operand" : json.operand
    }

  exec: (ctx) ->
    @func.exec(ctx)   
    

module.exports.MinValue = class MinValue extends UnimplementedExpression

module.exports.MaxValue = class MaxValue extends UnimplementedExpression

module.exports.Successor = class Successor extends UnimplementedExpression

module.exports.Predecessor = class Predecessor extends UnimplementedExpression
