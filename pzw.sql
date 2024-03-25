-- Check if czlonkowie table exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'czlonkowie') THEN
    CREATE TABLE czlonkowie (
        id_czlonka INT AUTO_INCREMENT PRIMARY KEY,
        imie VARCHAR(120) NOT NULL,
        nazwisko VARCHAR(120) NOT NULL,
        pesel VARCHAR(11) NOT NULL UNIQUE,
        email VARCHAR(255) UNIQUE,
        nr_tel VARCHAR(9) UNIQUE,
        wiek INT NOT NULL,
        id_kola INT NOT NULL,
        FOREIGN KEY (id_kola) REFERENCES kolo(id_kola)
    );
END IF;

-- Check if kolo table exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'kolo') THEN
    CREATE TABLE kolo (
        id_kola INT AUTO_INCREMENT PRIMARY KEY,
        nazwa VARCHAR(120) NOT NULL UNIQUE,
        miejscowosc VARCHAR(255) NOT NULL UNIQUE,
        nr_kola INT NOT NULL UNIQUE,
        prct_skladki FLOAT NOT NULL
    );
END IF;

-- Check if zbiornik table exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'zbiornik') THEN
    CREATE TABLE zbiornik (
        id_zbiornika INT AUTO_INCREMENT PRIMARY KEY,
        nazwa VARCHAR(120) NOT NULL UNIQUE,
        nr_kola INT NOT NULL,
        typ_zbiornika ENUM('staw', 'jezioro', 'zbiornik zaporowy', 'rzeka', 'strumyk') NOT NULL,
        typ_zbiornika_pzw ENUM('zwykly', 'specialny', 'chroniony'),
        FOREIGN KEY (nr_kola) REFERENCES kolo(nr_kola)
    );
END IF;

-- Check if okrog table exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'okrog') THEN
    CREATE TABLE okrog (
        id_okregu INT AUTO_INCREMENT PRIMARY KEY,
        nazwa VARCHAR(120) NOT NULL UNIQUE,
        nr_okregu INT NOT NULL UNIQUE,
        miejscowosc VARCHAR(255) NOT NULL UNIQUE
    );
END IF;

-- Check if skladki table exists
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'skladki') THEN
    CREATE TABLE skladki (
        id_skladki INT AUTO_INCREMENT PRIMARY KEY,
        stala_skladki FLOAT NOT NULL DEFAULT 300
    );
END IF;
