# Ingénierie Logicielle et Mathématiques Financières : Calculatrice Interactive

## Vue d'ensemble et Objectifs

Ce projet porte sur le développement d'une application interactive en ligne de commande (CLI) codée en **Python**, conçue pour automatiser la résolution de problématiques complexes de mathématiques financières. L'objectif de cet outil est de fournir une aide à la décision rapide et fiable couvrant un spectre large : de l'actualisation des flux de trésorerie (TVM) à la théorie moderne du portefeuille (Markowitz), en passant par le pricing obligataire et la génération d'échéanciers d'amortissement.

## Architecture Technique & Algorithmique (Python)

L'application est structurée de manière modulaire et exploite les bibliothèques standards de la *Data Science* pour garantir l'optimisation des calculs et la clarté des exports :

* **Optimisation Algorithmique (NumPy) :** Utilisation de la vectorisation (`np.linspace`, `np.sqrt`) pour simuler instantanément la performance de 100 portefeuilles et cartographier la frontière efficiente, évitant ainsi le coût computationnel des boucles itératives (`for` loops).


* **Structuration des Données & Reporting (Pandas) :** Génération dynamique de DataFrames pour les tableaux d'amortissement, intégrant une fonction d'export automatisé au format `.xlsx` pour une exploitation immédiate en Back-Office.


* **Visualisation Quantitative (Matplotlib) :** Génération et sauvegarde automatisée (`.png`) de graphiques financiers pour analyser l'impact du coefficient de corrélation ($\rho$) sur la diversification et isoler visuellement le Portefeuille de Variance Minimale (MVP).


* **Robustesse et Gestion des Exceptions :** Architecture CLI sécurisée par des blocs `try...except` et des algorithmes de prévention (ex: protection contre la division par zéro dans le calcul du MVP) pour garantir la stabilité du programme face aux anomalies de saisie.



## Modules Financiers & Fonctionnalités

L'outil transforme les inputs utilisateurs en livrables opérationnels via 5 modules dédiés :

* **Module 1 & 2 : TVM & Annuités :** Calcul de la Valeur Actuelle Nette (VAN) et projection des valeurs futures sous différents régimes, incluant la capitalisation continue ($e^{\delta n}$), ainsi que l'évaluation de flux en progression arithmétique ou géométrique.


* **Module 3 : Ingénierie de la Dette :** Édition complète d'échéanciers pour trois structures d'emprunts indivis : annuités constantes, amortissements constants, et remboursement *In Fine*.


* **Module 4 : Pricing Obligataire :** Actualisation des flux futurs (Yield to Maturity) pour évaluer la décote ou la surcote d'obligations classiques (à coupons) ou Zéro-Coupon.


* **Module 5 : Optimisation de Portefeuille (Markowitz) :** Modélisation stochastique du couple rentabilité-risque pour 2 actifs. L'algorithme calcule mathématiquement les poids exacts du Portefeuille de Variance Minimale (MVP) et trace la frontière efficiente.



## Limites Modélisatrices et Dette Technique

Pour conserver une architecture légère et générique, certains partis pris de modélisation ont été adoptés. Ces éléments constituent la base des futures itérations d'optimisation institutionnelle :

* **Conventions Calendaires (Day-Count) :** Le moteur de calcul raisonne actuellement en périodes discrètes ($n=1, 2...$). Le passage à un pricing de marché réel nécessitera l'intégration d'une gestion fine des dates (conventions Exact/360, 30/360) et des années bissextiles.


* **Méthodes Itératives (TRI) :** Le calcul du Taux de Rendement Interne n'est pas traité par approximations successives. L'implémentation de l'algorithme de Newton-Raphson (via `scipy.optimize`) a été volontairement exclue pour limiter la dépendance du projet aux bibliothèques externes complexes.


* **Biais d'Allocation (Markowitz vs Utilité) :** Le module de portefeuille se concentre strictement sur l'approche objective Espérance-Variance. La Théorie de l'Utilité a été écartée du modèle car les fonctions d'aversion au risque sont subjectives et difficiles à standardiser dans une interface CLI générique.



## Déploiement et Livrables

Pour exécuter le simulateur :

1. Lancer le script via la commande classique ou exécuter le notebook `Calculatrice_Financiere.ipynb`.


2. Naviguer via le menu interactif (1-6) pour sélectionner le module souhaité.


3. **Livrables :** Le programme génère automatiquement le tableau d'amortissement (`tableau_amortissement.xlsx`) et le graphique d'optimisation stochastique (`frontiere_efficiente.png`) dans le répertoire racine.

