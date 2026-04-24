# Q2. Optimization of Multi-Product Production 

# Loading the library
library(lpSolve)

# Creating the Linear Programming Model for maximizing profit
# We have 12 constraints (3 Demand + 9 Blending) and 9 decision variables.
# Variables mapping:
# 1-3: Spring (Cotton, Wool, Silk)
# 4-6: Autumn (Cotton, Wool, Silk)
# 7-9: Winter (Cotton, Wool, Silk)

Multi_Product_Production  <- make.lp(12, 9)

# Setting optimization direction (maximize/ minimize)
lp.control(Multi_Product_Production, sense= "maximize")


# Setting Objective Function

# Coefficients are Net Profit per ton (Sales - Prod Cost - Material Cost)
# Spring: Cotton(15), Wool(9), Silk(3)
# Autumn: Cotton(3), Wool(-3), Silk(-9)
# Winter: Cotton(19), Wool(13), Silk(7)

set.objfn(Multi_Product_Production, c(15, 9, 3, 3, -3, -9, 19, 13, 7))

# Setting Constraints
# Demand Constraints (Total Weight <= Max Demand)

set.row(Multi_Product_Production, 1, c(1, 1, 1), indices = c(1, 2, 3)) # Spring Demand
set.row(Multi_Product_Production, 2, c(1, 1, 1), indices = c(4, 5, 6)) # Autumn Demand
set.row(Multi_Product_Production, 3, c(1, 1, 1), indices = c(7, 8, 9)) # Winter Demand

# Blending Constraints (Material % >= Min %) 
# Logic: Material >= Pct * (Sum)  -->  (1-Pct)*Mat - Pct*Other1 - Pct*Other2 >= 0

# Spring (Indices 1,2,3)
set.row(Multi_Product_Production, 4, c(0.49, -0.51, -0.51), indices = c(1, 2, 3)) # Min Cotton 51%: 0.49*C - 0.51*W - 0.51*S >= 0
set.row(Multi_Product_Production, 5, c(-0.10, 0.90, -0.10), indices = c(1, 2, 3)) # Min Wool 10%:  -0.10*C + 0.90*W - 0.10*S >= 0
set.row(Multi_Product_Production, 6, c(-0.02, -0.02, 0.98), indices = c(1, 2, 3)) # Min Silk 2%:   -0.02*C - 0.02*W + 0.98*S >= 0

# Autumn (Indices 4,5,6)
set.row(Multi_Product_Production, 7, c(0.60, -0.40, -0.40), indices = c(4, 5, 6)) # Min Cotton 40%: 0.60*C - 0.40*W - 0.40*S >= 0
set.row(Multi_Product_Production, 8, c(-0.20, 0.80, -0.20), indices = c(4, 5, 6)) # Min Wool 20%:  -0.20*C + 0.80*W - 0.20*S >= 0
set.row(Multi_Product_Production, 9, c(-0.03, -0.03, 0.97), indices = c(4, 5, 6)) # Min Silk 3%:   -0.03*C - 0.03*W + 0.97*S >= 0

# Winter (Indices 7,8,9)
set.row(Multi_Product_Production, 10, c(0.62, -0.38, -0.38), indices = c(7, 8, 9)) # Min Cotton 38%: 0.62*C - 0.38*W - 0.38*S >= 0
set.row(Multi_Product_Production, 11, c(-0.30, 0.70, -0.30), indices = c(7, 8, 9)) # Min Wool 30%:  -0.30*C + 0.70*W - 0.30*S >= 0
set.row(Multi_Product_Production, 12, c(-0.04, -0.04, 0.96), indices = c(7, 8, 9)) # Min Silk 4%:   -0.04*C - 0.04*W + 0.96*S >= 0


# Setting Right Hand Side Values
set.rhs(Multi_Product_Production, c(3500, 4400, 4800, 0, 0, 0, 0, 0, 0, 0, 0, 0))

# Constraint Types: First 3 are "<=" (Demand), rest are ">=" (Blending)
set.constr.type(Multi_Product_Production, c("<=", "<=", "<=",
                         ">=", ">=", ">=",
                         ">=", ">=", ">=",
                         ">=", ">=", ">="))

# Setting variable types to Real and Non-negative
set.type(Multi_Product_Production, c(1:9), "real")
set.bounds(Multi_Product_Production, lower = rep(0, 9), upper = rep(Inf, 9))

solve(Multi_Product_Production)

objvalue <- get.objective(Multi_Product_Production)
cat("Total Maximum Profit: $", objvalue, "\n")

solution <- get.variables(Multi_Product_Production)
cat("Optimal Variable Values (in tons):\n")
print(solution)

# Breakdown by Product
cat("\nTotal Amount (in tons) of Material per Product:\n")
cat("Spring: ", sum(solution[c(1,2,3)]), "\n")
cat("Autumn: ", sum(solution[c(4,5,6)]), "\n")
cat("Winter: ", sum(solution[c(7,8,9)]), "\n")

#
#
#
#
#
# -------------------------------------------------------------------------
# Q3. Optimal Strategy Determination in a Sequential Two-Player Zero-Sum Game Using LP.

# Loading the library
library(lpSolveAPI)


# Player I's game: Maximizing Security Level

# Player I has 6 strategies (x1 to x6) and the game value v (7 variables total)
lprec_p1 <- make.lp(0, 7)
lp.control(lprec_p1, sense = "maximize")

# Objective function: Maximize v (the 7th variable)
set.objfn(lprec_p1, c(0, 0, 0, 0, 0, 0, 1))

# Constraints for each of Player II's strategies (Columns of the payoff matrix)
# Logic: - (Expected Payoff) + v <= 0;  Expected Payoff >= v
add.constraint(lprec_p1, c(0,    0,    0,    160, -160,  0,    1), "<=", 0) # vs P2-RWB
add.constraint(lprec_p1, c(0,    0,    160,  0,    0,   -160,  1), "<=", 0) # vs P2-RBW
add.constraint(lprec_p1, c(0,   -160,  0,    0,    0,    160,  1), "<=", 0) # vs P2-WRB
add.constraint(lprec_p1, c(-160, 0,    0,    0,    160,  0,    1), "<=", 0) # vs P2-WBR
add.constraint(lprec_p1, c(160,  0,    0,   -160,  0,    0,    1), "<=", 0) # vs P2-BRW
add.constraint(lprec_p1, c(0,    160, -160,  0,    0,    0,    1), "<=", 0) # vs P2-BWR

# Probability constraint: Sum of probabilities = 1
add.constraint(lprec_p1, c(1, 1, 1, 1, 1, 1, 0), "=", 1)

# Setting bounds: probabilities >= 0, v is unrestricted (u.r.s.)
set.bounds(lprec_p1, lower = c(0, 0, 0, 0, 0, 0, -Inf))

# Naming variables for clarity
RowNames <- c("Col1", "Col2", "Col3", "Col4", "Col5", "Col6", "ProbSum")
ColNames <- c("x1", "x2", "x3", "x4", "x5", "x6", "v")
dimnames(lprec_p1) <- list(RowNames, ColNames)

# Result for Player I
solve(lprec_p1)
get.objective(lprec_p1)
get.variables(lprec_p1)



# Player II's game: Minimizing Security Level

# Player II has 6 strategies (y1 to y6) and the game value v (7 variables total)
lprec_p2 <- make.lp(0, 7)
lp.control(lprec_p2, sense = "minimize")

# Objective function: Minimize v
set.objfn(lprec_p2, c(0, 0, 0, 0, 0, 0, 1))

# Constraints for each of Player I's strategies (Rows of the payoff matrix)
# Logic: - (Expected Payoff) + v >= 0;  Expected Payoff <= v
add.constraint(lprec_p2, c(0,    0,    0,   -160,  160,  0,    1), ">=", 0) # vs P1-RWB
add.constraint(lprec_p2, c(0,    0,   -160,  0,    0,    160,  1), ">=", 0) # vs P1-RBW
add.constraint(lprec_p2, c(0,    160,  0,    0,    0,   -160,  1), ">=", 0) # vs P1-WRB
add.constraint(lprec_p2, c(160,  0,    0,    0,   -160,  0,    1), ">=", 0) # vs P1-WBR
add.constraint(lprec_p2, c(-160, 0,    0,    160,  0,    0,    1), ">=", 0) # vs P1-BRW
add.constraint(lprec_p2, c(0,   -160,  160,  0,    0,    0,    1), ">=", 0) # vs P1-BWR

# Probability constraint: Sum of probabilities = 1
add.constraint(lprec_p2, c(1, 1, 1, 1, 1, 1, 0), "=", 1)

# Setting bounds: probabilities >= 0, v is unrestricted (u.r.s.)
set.bounds(lprec_p2, lower = c(0, 0, 0, 0, 0, 0, -Inf))

# Naming variables for clarity
RowNames_p2 <- c("Row1", "Row2", "Row3", "Row4", "Row5", "Row6", "ProbSum")
ColNames_p2 <- c("y1", "y2", "y3", "y4", "y5", "y6", "v")
dimnames(lprec_p2) <- list(RowNames_p2, ColNames_p2)

# Result for Player II
solve(lprec_p2)
get.objective(lprec_p2)
get.variables(lprec_p2)
