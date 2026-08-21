-- ========================
-- SECTION CLEAN (réinitialisation)
-- ========================

DROP TABLE IF EXISTS Transaction CASCADE;
DROP TABLE IF EXISTS Inventaire CASCADE;
DROP TABLE IF EXISTS Exposition CASCADE;
DROP TABLE IF EXISTS Edition CASCADE;
DROP TABLE IF EXISTS Oeuvre CASCADE;
DROP TABLE IF EXISTS Artiste CASCADE;
DROP TABLE IF EXISTS Client CASCADE;

-- ========================
-- CREATION DES TABLES
-- ========================

CREATE TABLE Artiste (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100),
    date_naissance DATE,
    pays VARCHAR(100)
);

CREATE TABLE Oeuvre (
    id SERIAL PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    artiste_id INT REFERENCES Artiste(id) ON DELETE CASCADE,
    annee INT,
    support VARCHAR(100),
    description TEXT
);

CREATE TABLE Edition (
    id SERIAL PRIMARY KEY,
    oeuvre_id INT REFERENCES Oeuvre(id),
    id_physique VARCHAR(20),
    tirage INT,
    dimensions VARCHAR(50),
    prix REAL,
    statut VARCHAR(20) CHECK (statut IN ('disponible','reservé','vendu')),
    date_acquisition DATE
);

CREATE TABLE Exposition (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    date_debut DATE,
    date_fin DATE,
    description TEXT
);

CREATE TABLE Inventaire (
	id SERIAL PRIMARY KEY,
    exposition_id INT REFERENCES Exposition(id),
    edition_id INT REFERENCES Edition(id),
    position VARCHAR(50)
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    mail VARCHAR(150) UNIQUE,
    telephone VARCHAR(50),
    adresse TEXT,
    abonnement_newsletter BOOLEAN DEFAULT FALSE
);

CREATE TABLE Transaction (
    id SERIAL PRIMARY KEY,
    edition_id INT REFERENCES Edition(id),
    client_id INT REFERENCES Client(id),
    statut VARCHAR(20) CHECK (statut IN ('en attente','complétée','annulée')),
    date DATE,
    prix REAL
);



-- =======================
-- 3. Insertion des données
-- =======================

-- Artistes
INSERT INTO Artiste (nom, prenom, date_naissance, pays)
VALUES 
('Picasso', 'Pablo', '1881-10-25', 'Espagne'),
('Monet', 'Claude', '1840-11-14', 'France'),
('Rodin', 'Auguste', '1840-11-12', 'France');

-- Œuvres
INSERT INTO Oeuvre (titre, artiste_id, annee, support, description)
VALUES
('Les Demoiselles d’Avignon', 1, 1907, 'Huile sur toile', 'Icône du cubisme.'),
('Nymphéas', 2, 1916, 'Huile sur toile', 'Série impressionniste célèbre.'),
('Le Penseur', 3, 1902, 'Bronze', 'Sculpture emblématique.');

-- Éditions
INSERT INTO Edition (oeuvre_id, id_physique, tirage, dimensions, prix, statut, date_acquisition)
VALUES
(1, 'A001', 10, '100x80', 2000000, 'vendu', '2020-01-10'),
(2, 'M001', 5, '120x90', 1500000, 'disponible', '2021-06-15'),
(3, 'R001', 3, '70x50', 900000, 'reservé', '2019-09-20');

-- Expositions
INSERT INTO Exposition (nom, date_debut, date_fin, description)
VALUES
('Impressionnisme et Modernité', '2023-03-01', '2023-06-01', 'Dialogue entre Monet et Picasso.'),
('Sculpter le Mouvement', '2024-04-15', '2024-09-15', 'Focus sur Rodin.');

-- Inventaire
INSERT INTO Inventaire (exposition_id, edition_id, position)
VALUES
(1, 1, 'Salle 1'),
(1, 2, 'Salle 2'),
(2, 3, 'Salle 3');

-- Clients
INSERT INTO Client (nom, prenom, mail, telephone, adresse, abonnement_newsletter)
VALUES
('Dupont', 'Alice', 'alice.dupont@mail.com', '0601020304', '12 rue des Fleurs, Paris', TRUE),
('Martin', 'Louis', 'louis.martin@mail.com', '0605060708', '5 avenue des Champs, Lyon', FALSE),
('Durand', 'Emma', 'emma.durand@mail.com', '0610101010', '3 boulevard Victor Hugo, Nice', TRUE);

-- Transactions
INSERT INTO Transaction (edition_id, client_id, statut, date, prix)
VALUES
(1, 1, 'complétée', '2021-01-20', 2000000),
(2, 2, 'en attente', '2024-02-12', 1500000),
(3, 3, 'annulée', '2023-11-30', 900000);


-- =======================
-- 4. Requêtes SQL
-- =======================

-- 4.1 Artistes français
SELECT nom, prenom, pays
FROM Artiste
WHERE pays = 'France';
-- Résultat attendu : Monet, Rodin

-- 4.2 Œuvres avant 1950
SELECT titre, annee
FROM Oeuvre
WHERE annee < 1950;
-- Résultat attendu : les 3 œuvres

-- 4.3 Éditions disponibles
SELECT id_physique, prix, statut
FROM Edition
WHERE statut = 'disponible';
-- Résultat attendu : M001 – 1 500 000 – disponible

-- 4.4 Nombre d’œuvres par artiste
SELECT a.nom, COUNT(o.id) AS nb_oeuvres
FROM Artiste a
LEFT JOIN Oeuvre o ON a.id = o.artiste_id
GROUP BY a.nom;
-- Résultat attendu : Picasso(1), Monet(1), Rodin(1)



-- 4.6 Nombre d’éditions par statut
SELECT statut, COUNT(*) AS nombre
FROM Edition
GROUP BY statut;
-- Résultat attendu : vendu(1), disponible(1), reservé(1)

-- 4.7 Œuvres et artistes associés
SELECT o.titre, a.nom AS artiste
FROM Oeuvre o
JOIN Artiste a ON o.artiste_id = a.id;
-- Résultat attendu : Les Demoiselles d’Avignon – Picasso, Nymphéas – Monet, Le Penseur – Rodin

-- 4.8 Éditions exposées et expositions
SELECT e.id_physique, ex.nom AS exposition
FROM Edition e
JOIN Inventaire i ON e.id = i.edition_id
JOIN Exposition ex ON i.exposition_id = ex.id;
-- Résultat attendu : A001–Impressionnisme, M001–Impressionnisme, R001–Sculpter le Mouvement

-- 4.9 Transactions complètes
SELECT t.id, c.nom AS client, a.nom AS artiste, o.titre, t.prix, t.statut
FROM Transaction t
JOIN Client c ON t.client_id = c.id
JOIN Edition ed ON t.edition_id = ed.id
JOIN Oeuvre o ON ed.oeuvre_id = o.id
JOIN Artiste a ON o.artiste_id = a.id;
-- Résultat attendu : transaction 1 (Dupont–Picasso–Les Demoiselles), etc.

-- 4.10 Œuvres dont le prix moyen > 1 000 000
SELECT titre
FROM Oeuvre
WHERE id IN (
    SELECT oeuvre_id
    FROM Edition
    GROUP BY oeuvre_id
    HAVING AVG(prix) > 1000000
);
-- Résultat attendu : Les Demoiselles d’Avignon, Nymphéas

-- 4.11 Clients ayant acheté une œuvre de Picasso
SELECT DISTINCT c.nom, c.prenom
FROM Client c
WHERE c.id IN (
    SELECT t.client_id
    FROM Transaction t
    JOIN Edition e ON t.edition_id = e.id
    JOIN Oeuvre o ON e.oeuvre_id = o.id
    JOIN Artiste a ON o.artiste_id = a.id
    WHERE a.nom = 'Picasso' AND t.statut = 'complétée'
);
-- Résultat attendu : Dupont Alice

-- 4.12 Éditions non encore vendues
SELECT id_physique, prix
FROM Edition
WHERE id NOT IN (
    SELECT edition_id
    FROM Transaction
    WHERE statut = 'complétée'
);
-- Résultat attendu : M001, R001

-- 4.13 Artistes dont toutes les œuvres datent d’avant 1950
SELECT a.nom
FROM Artiste a
WHERE NOT EXISTS (
    SELECT 1
    FROM Oeuvre o
    WHERE o.artiste_id = a.id
    AND o.annee >= 1950
);
-- Résultat attendu : Picasso, Monet, Rodin

-- 4.14 Expositions contenant au moins une œuvre vendue
SELECT DISTINCT ex.nom
FROM Exposition ex
WHERE EXISTS (
    SELECT 1
    FROM Inventaire i
    JOIN Edition e ON i.edition_id = e.id
    JOIN Transaction t ON e.id = t.edition_id
    WHERE i.exposition_id = ex.id AND t.statut = 'complétée'
);
-- Résultat attendu : Impressionnisme et Modernité

-- 4.15 Éditions plus chères que toutes celles de Monet
SELECT e.id_physique, e.prix
FROM Edition e
WHERE e.prix > ALL (
    SELECT ed.prix
    FROM Edition ed
    JOIN Oeuvre o ON ed.oeuvre_id = o.id
    JOIN Artiste a ON o.artiste_id = a.id
    WHERE a.nom = 'Monet'
);
-- Résultat attendu : A001 (2 000 000)







