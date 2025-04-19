CREATE DATABASE IF NOT EXISTS farmtech;
USE farmtech;

-- Tabela: Produtor
CREATE TABLE Produtor (
    id_produtor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela: Cultura
CREATE TABLE Cultura (
    id_cultura INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    data_inicio DATE,
    data_fim DATE,
    id_produtor INT,
    FOREIGN KEY (id_produtor) REFERENCES Produtor(id_produtor)
);

-- Tabela: Sensor
CREATE TABLE Sensor (
    id_sensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    modelo VARCHAR(50),
    localizacao VARCHAR(100),
    id_cultura INT,
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura)
);

-- Tabela: Leitura_Sensor
CREATE TABLE Leitura_Sensor (
    id_leitura INT PRIMARY KEY AUTO_INCREMENT,
    id_sensor INT,
    data_hora DATETIME NOT NULL,
    valor_umidade DOUBLE,
    valor_ph DOUBLE,
    valor_npk_fosforo DOUBLE,
    valor_npk_potassio DOUBLE,
    FOREIGN KEY (id_sensor) REFERENCES Sensor(id_sensor)
);

-- Tabela: Aplicacao
CREATE TABLE Aplicacao (
    id_aplicacao INT PRIMARY KEY AUTO_INCREMENT,
    id_cultura INT,
    data_hora DATETIME NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    quantidade DOUBLE NOT NULL,
    FOREIGN KEY (id_cultura) REFERENCES Cultura(id_cultura)
);