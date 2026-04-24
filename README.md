# Operations Research: LP Optimization & Strategic Game Theory

![R Version](https://img.shields.io/badge/R-v4.0+-blue?style=for-the-badge&logo=r)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)

A comprehensive application of Linear Programming and Game Theory to solve complex manufacturing resource allocation and strategic competition problems in R.

## Project Overview
This project focuses on the implementation of Operations Research methodologies to drive data-driven decision-making. It covers two primary domains: multi-product blending optimization for textile manufacturing and optimal strategy determination in sequential two-player zero-sum games. By leveraging mathematical modeling, the project demonstrates how businesses can maximize profitability and navigate competitive environments with precision.

👉 [Open the script to explore full analysis](Notebook.R)

## Business Problem
### Real-world Context
In the textile industry, production planning requires balancing material costs, seasonal demand, and strict composition requirements. Simultaneously, strategic decision-making in competitive markets can be modeled as a game where players seek to maximize their security levels against an opponent's moves.

### Stakeholders
- **Production Managers**: Responsible for meeting seasonal demand while minimizing costs.
- **Strategic Analysts**: Focused on identifying optimal competitive moves.
- **Supply Chain Officers**: Managing the allocation of limited materials (Cotton, Wool, Silk).

### Decision Impact
The analysis directly influences resource allocation, inventory management, and strategic positioning, ensuring that production mixes are mathematically optimal and strategic risks are minimized.

## Dataset
### Source
Internal production specifications and strategic payoff matrices modeled for industrial scenarios.

### Size
- **Blending Problem**: 9 Decision Variables, 12 Linear Constraints (Demand & Composition).
- **Game Theory**: 6x6 Payoff Matrix representing strategic interactions.

### Key Features
- **Material Costs & Sales Prices**: Unit profits for various seasonal products.
- **Demand Caps**: Seasonal production limits for Spring, Autumn, and Winter.
- **Composition Constraints**: Minimum percentage requirements for Cotton, Wool, and Silk per product.
- **Payoff Values**: Quantitative outcomes of strategic interactions between two players.

### Data Types
- Numerical (Continuous) for material weights and profits.
- Matrix (Discrete) for game theory payoffs.

## Methodology
### Data Understanding & Preprocessing
Analyzed unit profit margins by calculating the difference between sales prices and material/production costs. Defined the demand and blending constraints based on seasonal requirements.

### Exploratory Analysis
Evaluated the relationship between material availability and seasonal demand to identify potential bottlenecks in the production cycle.

### Linear Programming Modeling
- **Production Optimization**: Formulated a maximization model using `lpSolve` to determine the optimal tons of Cotton, Wool, and Silk for each seasonal product.
- **Game Theory Formulation**: Developed a security level maximization (Player I) and minimization (Player II) model to solve for mixed strategy equilibrium.

### Optimization & Evaluation
Executed the models using R's optimization libraries to find the global maximum for profit and the stable value of the game. Validated results against demand ceilings and material ratios.

## Key Results
### Main Metrics
- **Optimal Production Mix**: Identified the exact quantity of each material for Spring, Autumn, and Winter lines to achieve maximum revenue.
- **Value of the Game**: Determined the expected outcome of the strategic game when both players act optimally.

### Key Insights
- **Seasonality Efficiency**: Winter products showed the highest profit potential per unit, leading to prioritized material allocation.
- **Strategic Stability**: Found that a mixed strategy is essential for both players in the game to maintain their security levels, as no pure strategy equilibrium exists.

## Business Impact
- **Profit Maximization**: The optimized blending strategy ensures the highest possible net profit while strictly adhering to quality standards.
- **Resource Efficiency**: Reduced waste by aligning material usage exactly with demand and composition constraints.
- **Competitive Resilience**: Mathematically sound game strategies provide a robust framework for decision-making in zero-sum competitive scenarios.

## Skills
### Technical Skills
![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![lpSolve](https://img.shields.io/badge/lpSolve-FFA500?style=for-the-badge&logo=r&logoColor=white)
![Linear Programming](https://img.shields.io/badge/Linear_Programming-008080?style=for-the-badge&logo=diagram-next&logoColor=white)
![Game Theory](https://img.shields.io/badge/Game_Theory-8B0000?style=for-the-badge&logo=game-controller&logoColor=white)
![Data Analysis](https://img.shields.io/badge/Data_Analysis-FFA500?style=for-the-badge&logo=google-analytics&logoColor=white)

### Soft Skills
![Analytical Thinking](https://img.shields.io/badge/Analytical_Thinking-4B0082?style=for-the-badge&logo=mindmap&logoColor=white)
![Communication](https://img.shields.io/badge/Communication-25D366?style=for-the-badge&logo=google-messages&logoColor=white)
![Problem Solving](https://img.shields.io/badge/Problem_Solving-FF4500?style=for-the-badge&logo=brainly&logoColor=white)
![Attention to Detail](https://img.shields.io/badge/Attention_to_Detail-00CED1?style=for-the-badge&logo=google-search-console&logoColor=white)

## Key Learnings
- **Constraint Handling**: Learned the importance of precise constraint formulation (e.g., blending ratios) in preventing infeasible solutions.
- **Strategic Resilience**: Understood how mixed strategies in Game Theory provide a mathematical "safety net" in competitive environments.
- **R Optimization Ecosystem**: Gained proficiency in using `lpSolve` and `lpSolveAPI` for large-scale optimization tasks.

## Future Improvements
- **Stochastic Programming**: Incorporate uncertainty in material prices and demand forecasts.
- **Sensitivity Analysis**: Implement shadow price analysis to identify which constraints are most restrictive to profit growth.
- **Multi-Objective Optimization**: Balance profit maximization with environmental sustainability (e.g., lower material waste).
- **GUI Integration**: Build a Shiny app to allow stakeholders to input constraints and visualize optimal results in real-time.

## 👨‍💻 Author
 **Nabankur Ray** 
 
 Passionate about real-world data-driven solutions
 
 [![GitHub](https://img.shields.io/badge/GitHub-Profile-black?style=flat&logo=github)](https://github.com/nabankur14) [![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue?style=flat&logo=linkedin)](https://www.linkedin.com/in/nabankur-ray-876582181/) 
 
![GitHub Stats](https://github-readme-stats-eight-theta.vercel.app/api?username=nabankur14&show_icons=true)

⭐ If you like this project

Give it a ⭐ on GitHub — it helps a lot!
