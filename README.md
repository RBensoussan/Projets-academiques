# Strategic Financial Analysis & Quantitative Modeling

## Overview & Objective

This repository contains a comprehensive portfolio of five advanced financial case studies, simulating the rigorous quantitative environment of an institutional financial analyst. The primary objective is to demonstrate the application of complex mathematical modeling to solve distinct real-world financial challenges—spanning equity valuation, fixed-income arbitrage, industrial capital budgeting, portfolio optimization, and derivative engineering.

## Advanced Excel Engineering & Methodology

All quantitative models were architected entirely within **Excel** (`Quantitative_Financial_Analysis.xlsx`), strictly adhering to institutional modeling standards by separating data into distinct Input, Calculation, and Output/KPI layers.

To execute these models, the workbook leverages advanced Excel engineering competencies:

* **Time Value of Money (TVM) & Fixed Income:** Deployed dynamic financial functions (e.g., `NPV`, `IRR`, `PMT`) to construct full amortization schedules and consumption smoothing algorithms.


* **Sensitivity & Scenario Analysis:** Utilized Advanced Data Tables and What-If Analysis to evaluate interest rate fluctuations and capital budgeting stress tests.


* **Modern Portfolio Theory (MPT) via Matrix Algebra:** Implemented native matrix operations (`MMULT`, `TRANSPOSE`) to construct the Variance-Covariance matrix, isolating systematic risk and generating the risk-return efficient frontier.


* **Stochastic Pricing Engines:** Built multi-period binomial trees utilizing nested logical functions and backward induction to dynamically price crypto-derivatives across extreme volatility nodes.



## Case Studies & Key Findings

Each case study required transforming raw financial data into actionable strategic recommendations:

* **Case 01: Equity Valuation (Gordon-Shapiro):** Evaluated stable vs. growth assets, ultimately issuing a "Sell" recommendation for EDF after identifying a 31% market premium over its fundamental €8.24 intrinsic value.


* **Case 02: Mortgage Arbitrage & Bank Risk:** Modeled a €650,000 debt structure. Proved that strategic capital reinvestment yielded a €14,364 net gain over early prepayment, while actively mapping the counterparty systemic risks (e.g., maturity transformation).


* **Case 03: Industrial Asset Retirement Obligations (ARO):** Conducted long-term capital budgeting for a national nuclear decommissioning project. Modeled a €27.76 Billion discounted liability over 21 years and recommended accepting an external €25 Billion bid to optimize the NPV of costs.


* **Case 04: Portfolio Optimization:** Analyzed multi-decade sector fund data (1964-2011) to prove that holding low-correlation assets (e.g., Food sector) reduces overall portfolio volatility more effectively than holding a single "safe" asset.


* **Case 05: Derivative Engineering (Delta Hedging):** Engineered a stochastic pricing model for a 2-year Bitcoin Put Option facing 75% annual volatility. Derived the exact no-arbitrage market price and structured a delta-neutral replicating portfolio (risk-free bonds + BTC) to perfectly hedge downside exposure.



## Technical Reproduction

To review the mathematical logic or adapt the models to new datasets, open the `Quantitative_Financial_Analysis.xlsx` workbook. Each case study is isolated within its own dedicated tab. The models are fully dynamic; adjusting assumptions in the Input layers will automatically recalculate the associated KPIs, Data Tables, and arbitrage scenarios.
