# 🖼️ Conception et Implémentation d'une Base de Données : Galerie d'Art

Ce projet vise à concevoir une base de données complète sous **PostgreSQL** pour gérer les opérations quotidiennes d'une galerie d'art, de la création d'une œuvre par un artiste jusqu'à sa vente finale.

## 🎯 Objectifs du Projet
* Modélisation conceptuelle (UML) et logique (Schéma relationnel).
* Gestion de l'intégrité référentielle et des contraintes métiers (statuts, tirages).
* Analyse de données via des requêtes SQL complexes (Jointures, Sous-requêtes, Agrégations).

## 🛠️ Stack Technique
* **SGBD :** PostgreSQL.
* **Outil de gestion :** DBeaver.
* **Langage :** SQL.

## 📊 Structure de la Base
La base de données repose sur 6 entités principales interconnectées :
1. **Artiste** : Gestion des créateurs.
2. **Oeuvre** : Catalogue des créations uniques.
3. **Édition** : Suivi des exemplaires physiques et de leur disponibilité.
4. **Exposition** : Organisation des événements de la galerie.
5. **Client** : Gestion de la base de données acheteurs et marketing.
6. **Transaction** : Historique commercial complet et suivi des ventes.

## 🔍 Exemples de Requêtes Analytiques
Le projet inclut des requêtes avancées telles que :
* Identification des artistes n'ayant pas produit d'œuvres depuis une date donnée.
* Calcul de la valeur moyenne des éditions par œuvre avec filtrage.
* Suivi des ventes réalisées par exposition spécifique.

