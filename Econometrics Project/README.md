# 📊 Heroes and Villains: The Impact of WWI Heroic Networks on WWII Collaboration in France

This research investigates the long-term political consequences of military heroism by analyzing the link between Marshal Philippe Pétain's leadership during the 1916 WWI Battle of Verdun and subsequent Nazi collaboration in WWII.

## 📌 Project Overview

Utilizing a dataset of **34,942 French municipalities**, this study isolates the "Pétain effect" from broader political and demographic factors. The research explores whether the "heroic network" forged at Verdun played a causal role in individual collaboration with Nazi Germany during WWII.

* **Data Scope**: 34,942 observations across 97 departments.


* **Historical Context**: Covers the 1911 census, 1914 legislative elections, and WWI military regimental data.



## 🛠️ Econometric Methodology

### Regression Models

The study employs a series of OLS regressions (M1-M3) to establish and refine the relationship between military service and collaboration.

* **Dependent Variable (`lncollab`)**: Logarithm of the share of Nazi collaborators relative to the municipality's population.


* **Interest Variable (`petain`)**: A dummy variable equal to 1 if the municipality's regiment was rotated at Verdun under Pétain's leadership.


* **Control Variables**: Includes general Verdun service (`verdun`), 1914 left/right-wing vote shares (`vsL`, `vsR`), and municipal population (`lnpop`).



### Diagnostics and Robustness

* **Heteroscedasticity**: White’s test indicated non-constant variance. The model was re-estimated using **White-robust standard errors** (HCCME) to ensure statistical validity.


* **Multicollinéarité**: Variance Inflation Factor (VIF) analysis confirmed no problematic multicollinearity, with all values well below the threshold of 10.


* **Fixed Effects**: Model M3 introduced department-specific dummies to control for unobserved regional heterogeneity.



## 📈 Key Findings

* **The Pétain Effect**: Service under Pétain's command resulted in a statistically significant **6.7% increase** in the share of collaborators, ceteris paribus.


* **Verdun Contrast**: Interestingly, general service at the Battle of Verdun (not specifically under Pétain) was found to **decrease** collaboration shares.


* **Robustness**: Findings remained robust even when controlling for 1914 political leanings and department-specific fixed effects.



## 💻 Technical Implementation

* **Language**: SAS.


* **Procedures Used**: `PROC REG` for modeling and diagnostics, `PROC GLM` for fixed effects, `PROC UNIVARIATE` for normality tests, and `PROC SQL` for data management.
 
