
CREATE USER 'standardowy'@'localhost' IDENTIFIED BY 'haslo_standardowy';
CREATE USER 'moderator'@'localhost' IDENTIFIED BY 'haslo_moderator';
CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'haslo_administrator';

GRANT SELECT, INSERT, UPDATE, DELETE ON moja_aplikacja.* TO 'standardowy'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON moja_aplikacja.* TO 'moderator'@'localhost';
GRANT ALL PRIVILEGES ON moja_aplikacja.* TO 'administrator'@'localhost';
