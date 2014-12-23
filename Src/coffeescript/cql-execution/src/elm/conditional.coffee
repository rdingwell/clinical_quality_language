{ Expression, UnimplementedExpression } = require './expression'

# TODO: Spec lists "Conditional", but it's "If" in the XSD
module.exports.If = class If extends UnimplementedExpression
  constructor: (json) ->
    super
    @condition = build json.condition
    @th = build json.then
    @els = build json.else

  exec: (ctx) ->
    if @condition.exec(ctx) then @th.exec(ctx) else @els.exec(ctx)

class CaseItem 
  constructor:(json) ->
    @when = build json.when
    @then = build json.then
  
module.exports.Case = class Case extends UnimplementedExpression

  constructor: (json) ->
    super
    @comparand = build json.condition
    @caseItems = build json.caseItem
    @els = build json.else

  exec: (ctx) ->
    val = @comparand.exec(ctx)
    for ci in @caseItems
      if ci.when.exec(ctx) == val 
       return ci.then.exec(ctx)
    @els.exec(ctx)

module.exports.CaseItem = class CaseItem 
  constructor:(json) ->
    @when = build json.when
    @then = build json.then
