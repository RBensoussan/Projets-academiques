# 🧮 Calculatrice Financière Interactive

Ce projet consiste en la création d'une application interactive en Python permettant de résoudre des problématiques complexes de mathématiques financières. L'outil est conçu de manière modulaire pour faciliter la prise de décision financière à travers une interface en ligne de commande (CLI) robuste.

## 🚀 Fonctionnalités principales

L'application est structurée en 5 modules théoriques :

1. **Actualisation & Capitalisation** : Calcul des valeurs actuelles et futures selon les trois régimes : intérêts simples, composés et capitalisation continue ($e^{\delta n}$).
2. **Annuités** : Évaluation de suites de flux constants ou en progression (arithmétique et géométrique).
3. **Emprunts Indivis** : Génération d'échéanciers complets pour trois modes de remboursement :
    * Annuités constantes.
    * Amortissements constants.
    * Remboursement *In Fine*.
4. **Valorisation d'Obligations** : Pricing d'obligations classiques (coupons) et Zéro-Coupon.
5. **Gestion de Portefeuille** : Modélisation du couple rendement-risque pour 2 actifs (Modèle de Markowitz) et tracé de la frontière efficiente.

## 🛠️ Expertise Technique & Algorithmique

Ce projet met en œuvre des concepts avancés de programmation Python pour la finance :

* **Optimisation avec NumPy** : Utilisation de la vectorisation pour simuler 100 portefeuilles simultanément sans boucles `for` coûteuses, optimisant ainsi les calculs de la frontière efficiente.
* **Structuration avec Pandas** : Génération dynamique de DataFrames pour les tableaux d'amortissement, avec **export automatique au format Excel** (`.xlsx`).
* **Visualisation Matplotlib** : Génération de graphiques financiers exportés en `.png` pour analyser l'effet de diversification selon le coefficient de corrélation ($\rho$).
* **Robustesse du code** : Implémentation de blocs `try...except` pour la gestion des erreurs de saisie et utilisation de la *list comprehension* pour le traitement des flux de trésorerie.

## 📊 Visualisation & Sorties

L'outil ne se contente pas de calculer ; il produit des livrables exploitables :
* **Graphique** : La frontière efficiente identifiant le Portefeuille de Variance Minimale (MVP).
* **Données** : Des tableaux de remboursement propres et formatés.

---

## 📂 Contenu du dossier
* `Calculatrice_Financiere.ipynb` : Le code source documenté avec Docstrings.
* `frontiere_efficiente.png` : Exemple de sortie graphique du module portefeuille.
* `Explications_Techniques.pdf` : Détail des choix algorithmiques.
