// @Test: Add
define Ten = 10
define Eleven = 11
define OnePlusTwo = 1 + 2
define AddMultiple = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
define AddVariables = Ten + Eleven

// @Test: Subtract
define Ten = 10
define Eleven = 11
define FiveMinusTwo = 5 - 2
define SubtractMultiple = 100 - 50 - 25 - 10
define SubtractVariables = Eleven - Ten

// @Test: Multiply
define Ten = 10
define Eleven = 11
define FiveTimesTwo = 5 * 2
define MultiplyMultiple = 1 * 2 * 3 * 4 * 5
define MultiplyVariables = Eleven * Ten

// @Test: Divide
define Hundred = 100
define Four = 4
define TenDividedByTwo = 10 / 2
define TenDividedByFour = 10 / 4
define DivideMultiple = 1000 / 4 / 10 / 5
define DivideVariables = Hundred / Four

// @Test: Negate
define NegativeOne = -1

// @Test: MathPrecedence
define Mixed = 1 + 5 * 10 - 15 / 3
define Parenthetical = (1 + 5) * (10 - 15) / 3

// @Test: Power
define Pow = 3 ^ 4

// @Test: TruncatedDivide
define Trunc = TruncatedDivide(10,3)
define Even = TruncatedDivide(9,3)

// @Test: Modulo 
define Mod = Modulo(3 , 2)

// @Test: Ceiling 
define Ceil = Ceiling(10.1)
define Even = Ceiling(10)

// @Test: Floor
define flr = Floor(10.1)
define Even = Floor(10)


// @Test: Truncate
define Trunc = Truncate(10.1)
define Even = Truncate(10)

// @Test: Abs 
define Pos = Abs(10)
define Neg = Abs(-10)
define Zero = Abs(0)

// @Test: Round 
define Up = Round(4.56)
define Up_percent = Round(4.56,1)
define Down = Round(4.49)
define Down_percent = Round(4.43,1)

// @Test: Ln 
define ln = Ln(4)

// @Test: Log 
define log = Log(10,10000)


// @Test: MinValue

// @Test: MaxValue 

// @Test: Successor

// @Test: Predecessor