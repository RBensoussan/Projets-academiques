# Comparative Analysis of Option Pricing Models: BSM vs. CRR

## Overview & Objective

This project implements and evaluates the two fundamental pillars of modern option pricing: the Black-Scholes-Merton (BSM) continuous-time model and the Cox-Ross-Rubinstein (CRR) discrete-time binomial model. Using Apple Inc. (AAPL) as the underlying asset, the primary objective is to empirically demonstrate the convergence of discrete numerical methods toward analytical solutions, while critically evaluating the theoretical assumptions of these models against real-world market data.

## Methodology & Architecture

The project is built entirely in **Python**, utilizing a robust Object-Oriented Programming (OOP) architecture to ensure code reusability and scalability.

* **Data Pipeline:** Engineered an automated data acquisition pipeline using `yfinance` to handle MultiIndex structural updates for equity data, alongside the `fredpy` API to dynamically fetch the risk-free rate ($r$).


* **Statistical Calibration:** Prior to pricing, the Geometric Brownian Motion (GBM) assumption was rigorously tested. Augmented Dickey-Fuller (ADF) tests were deployed to confirm the stationarity of log-returns ($\ln(S_t/S_{t-1})$), while QQ-Plots and histograms were used to evaluate normality.


* **OOP Pricing Architecture:** Designed a parent `Option` class to encapsulate core market parameters, with inherited child classes (`BSMModel`, `CRRModel`) housing specific pricing logic and Greek calculations (Delta).


* **Algorithmic Optimization:** Implemented the Newton-Raphson numerical method to iteratively extract Implied Volatility (IV) from market prices.


* **Performance Monitoring:** Developed custom Python decorators (`@timer` using `functools.wraps`) to wrap pricing methods and accurately log the computational efficiency of analytical vs. numerical approaches.



## Key Findings

* **The Convergence Phenomenon:** Successfully visualized the Law of Large Numbers applied to finance. As the number of binomial steps ($n$) approaches 100, the CRR discrete-time approximation smoothly converges to the exact BSM analytical benchmark.


* **Hedge Ratio Dynamics:** Sensitivity analysis confirmed the S-curve behavior of the Call Delta, demonstrating how the hedge ratio dynamically transitions from 0 to 1 as the underlying spot price fluctuates—a critical visualization for Delta-Hedging strategies.


* **Real-World Deviations (Fat Tails):** Visual normality checks revealed significant leptokurtosis (fat tails) in AAPL returns. This empirically proves that extreme market events occur more frequently than predicted by a Normal distribution, suggesting that standard BSM and CRR models systematically underprice extreme tail risk.



## Technical Reproduction

To run this analysis locally:

1. Ensure the required stack is installed: `pandas`, `numpy`, `matplotlib`, `scipy`, `statsmodels`, `yfinance`, and `fredpy`.


2. Insert your active FRED API key into the designated variable in the Data Pipeline section.


3. Run the Jupyter Notebook sequentially to generate the statistical validations, convergence plots, and dual-axis sensitivity charts.

