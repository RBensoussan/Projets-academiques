# Architecture et Implémentation d'une Base de Données Relationnelle : Gestion de Galerie d'Art

## Vue d'ensemble et Objectifs

Ce projet porte sur la modélisation conceptuelle et l'implémentation logique d'un système de gestion de base de données relationnelle (SGBDR) sous **PostgreSQL**. Développé pour répondre aux besoins opérationnels d'une galerie d'art, le système assure la traçabilité complète d'une œuvre : de sa création par un artiste, à son édition physique, son exposition, jusqu'à sa transaction commerciale finale. L'objectif principal est de centraliser l'information, d'éliminer la redondance et de garantir une intégrité référentielle stricte pour permettre des analyses de données fiables.

## Architecture des Données et Modélisation

La base de données a été structurée autour d'un modèle conceptuel (UML) traduit en un schéma relationnel de 7 tables, implémenté via des scripts SQL (DDL/DML). L'architecture met l'accent sur la robustesse et la cohérence des données :

* **Modélisation des Entités :** Création de tables maîtresses (`Artiste`, `Oeuvre`, `Exposition`, `Client`) et de tables associatives (`Inventaire`, `Transaction`) pour cartographier les relations complexes (cardinalités 1..N et N..N).


* **Intégrité Référentielle :** Utilisation systématique de clés primaires (`SERIAL PRIMARY KEY`) et de clés étrangères avec des règles de suppression en cascade (`ON DELETE CASCADE`) pour maintenir la cohérence de la base lors des mises à jour.


* **Contraintes Métiers :** Implémentation de contraintes `CHECK` pour encadrer strictement le statut des éditions physiques (`'disponible'`, `'reservé'`, `'vendu'`) et l'état des transactions commerciales.


* **Sécurité et Unicité :** Application de contraintes `UNIQUE` sur les données de contact des clients et de valeurs par défaut (`DEFAULT FALSE`) pour la gestion opt-in des campagnes marketing.



## Intelligence Commerciale et Requêtes Analytiques (DQL)

Au-delà du stockage, la base a été conçue pour interroger les données et extraire des indicateurs clés via des requêtes SQL avancées :

* **Analyse de Valorisation :** Utilisation d'agrégations et de clauses `HAVING` pour isoler les œuvres dont le prix moyen des éditions dépasse le million d'euros (`HAVING AVG(prix) > 1000000`).


* **Gestion des Stocks et Liquidité :** Identification des éditions en attente de vente via des sous-requêtes d'exclusion (`WHERE id NOT IN`...).


* **Performance des Événements :** Extraction du taux de succès des expositions en combinant des jointures multiples (`JOIN`) et des conditions d'existence (`EXISTS`) pour cibler les événements ayant généré des ventes concrètes.


* **Filtrage Ciblé :** Comparaison de prix dynamiques via des opérateurs de sous-requêtes (`> ALL`) pour des analyses de marché comparatives entre artistes.



## Déploiement Technique

Pour reproduire ce schéma et tester les requêtes :

1. Importer le script source `.sql` dans un outil d'administration de base de données tel que **DBeaver**.


2. Exécuter le bloc de création (DDL) pour initialiser l'architecture.


3. Exécuter le bloc d'insertion (DML) pour peupler la base avec le jeu de données factice.


4. Lancer les requêtes analytiques (DQL) documentées en fin de script pour tester la logique métier.



Que pensez-vous de ce recadrage ? Si l'équilibre entre le vocabulaire base de données (DDL, clés étrangères) et l'aspect financier vous convient, nous pouvons le valider et passer à votre prochain projet !
