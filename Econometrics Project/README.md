# The Long-Term Impact of WWI Heroic Networks on WWII Collaboration

## Overview & Objective

This research investigates the long-term political consequences of military heroism by analyzing the causal link between Marshal Philippe Pétain's leadership during the WWI Battle of Verdun and subsequent Nazi collaboration in WWII.

Operating on a comprehensive cross-sectional dataset of **34,942 French municipalities** (representing nearly 35,000 distinct geographic data points across 97 departments), the primary objective is to isolate this "Pétain effect" from broader historical, demographic, and political variables. The study aims to understand how autocratic networks are forged through military legacy, employing rigorous econometric modeling to validate these historical claims.

## Econometric Methodology & Architecture

This project is built around an advanced econometric research model, deliberately structured to handle large-scale data and mitigate statistical biases. All data manipulation, regression modeling, and diagnostic testing were executed using **SAS**.

* **Baseline & Refined Modeling (OLS):** Developed a progressive series of Ordinary Least Squares (OLS) regressions (Models M1-M3) to evaluate the logarithmic share of Nazi collaborators (`lncollab`).


* **Control Framework:** Integrated 1911 census population data and 1914 legislative election vote shares (left, right, and centrist) to prevent omitted variable bias and account for pre-existing political ideologies.


* **Fixed Effects (Within-Transformation):** To control for unobserved regional heterogeneity, Model M3 introduces department-specific controls ($K=95$). The mathematical architecture relies on a Within-Transformation (demeaning) approach—subtracting the departmental average from the individual observation to completely eliminate the fixed departmental effect ($\alpha_{\mathcal{D}}$) without inflating the model's degrees of freedom unnecessarily.



## Advanced Diagnostic Testing

To ensure the statistical validity of the causal claims across the 34,000+ row dataset, the model was subjected to a battery of rigorous diagnostic tests:

* **Normality of Residuals:** Conducted Jarque-Bera and Shapiro-Wilk tests. While the residuals demonstrated non-normality (Skewness: 1.566, Kurtosis: 6.390), the massive sample size ($n=34,738$) ensures the OLS estimators remain asymptotically unbiased and valid for inference via the Central Limit Theorem.


* **Heteroscedasticity Mitigation:** Deployed White's Test, which formally rejected the null hypothesis of homoscedasticity ($p < 0.0001$). The model was successfully re-estimated using Heteroscedasticity-Consistent Covariance Matrix Estimators (HCCME) to generate White-robust standard errors.


* **Multicollinearity Checks:** Verified model stability using Variance Inflation Factor (VIF) analysis. The explanatory variables proved to offer highly distinct information, with all VIF scores falling well below the problematic threshold of 10 (maximum VIF $\approx 2.70$).


* **Endogeneity & Instrumental Variables (2SLS):** Investigated potential endogeneity arising from unobserved local "hero-worship" cultures or measurement errors in 1944 records. Explored a Two-Stage Least Squares (2SLS) approach to establish a strictly exogenous instrumental variable ($W$) to isolate the clean variation of the Pétain variable.



## Key Findings

* **The "Pétain Effect":** Ceteris paribus, municipalities whose regiments served under Pétain saw an approximate **6.7% increase** in the share of collaborators compared to those that did not.


* **Statistical Robustness:** This positive relationship remained highly significant (t-value of 10.82, $p < 0.0001$) even after applying White-consistent standard errors and controlling for regional ideologies.


* **General vs. Specific Service:** While general service at Verdun significantly reduced the share of collaborators, service specifically under Pétain's command increased it, highlighting the measurable impact of personal loyalty and perceived heroic legitimacy over general battle trauma.



## Technical Reproduction

To review the methodology or reproduce the findings, navigate to the SAS source code (`Project v1 (def).sas`) included in this repository. The script is organized sequentially:

1. **Data Preparation:** Database initialization, dummy variable creation, and surface area interaction modeling (`PROC MEANS`, `PROC SQL`).


2. **Regression Analysis:** Baseline, refined, and fixed-effect modeling (`PROC REG`, `PROC GLM`).


3. **Diagnostic Testing:** Residual extraction, normality plotting, VIF analysis, and HCCME corrections (`PROC UNIVARIATE`, `PROC SYSLIN 2SLS`).



---

This perfectly highlights that you are not just running standard SQL queries, but deeply analyzing a 34,000+ row dataset using advanced econometric theory.

If this hits the exact mark you are looking for, please go ahead and share the materials for the next project!
