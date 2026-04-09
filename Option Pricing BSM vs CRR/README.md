# Comparative Analysis of Option Pricing Models: BSM vs. CRR

## Project Overview
This repository contains a quantitative finance project focused on pricing European Options for **Apple Inc. (AAPL)**. The project implements and compares two primary methodologies:
1.  **Black-Scholes-Merton (BSM):** A continuous-time analytical model.
2.  **Cox-Ross-Rubinstein (CRR):** A discrete-time numerical binomial tree model.

The goal is to demonstrate the convergence of numerical methods toward analytical solutions while evaluating real-world market data assumptions.

## Technical Features
* **Object-Oriented Programming (OOP):** Robust architecture using inheritance (Base `Option` class) and specialized pricing classes.
* **Live Data Integration:** Automated data pipeline fetching market prices via `yfinance` and risk-free rates ($r$) via the `fredpy` API.
* **Advanced Python:** Implementation of custom **decorators** (`@timer`) to monitor computational efficiency.
* **Numerical Optimization:** Estimation of **Implied Volatility** using the Newton-Raphson method.

## Statistical Validation
The project includes a rigorous data calibration phase:
* **Stationarity:** Augmented Dickey-Fuller (ADF) tests performed on raw prices and log-returns.
* **Normality:** Visual analysis via QQ-Plots and Histograms to identify **"Fat Tails"** in Apple's historical returns.

## Key Results
* **Convergence:** The CRR model successfully converges to the BSM price as the number of steps ($n$) increases.
* **Sensitivity:** Visualization of the **Delta Greek** and premium fluctuations relative to the underlying spot price.
* **Performance:** Empirical proof of the efficiency gap between analytical solutions and iterative numerical trees.

## Tech Stack
* **Languages:** Python
* **Libraries:** Pandas, NumPy, Matplotlib, SciPy, Statsmodels, fredpy, yfinance.
