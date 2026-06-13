-- Criação de banco de dados
CREATE DATABASE Ficha_de_cadastro;

USE Ficha_de_cadastro;

-- Criação de tabelas
CREATE TABLE Paroquia(
    id_paroquia int AUTO_INCREMENT PRIMARY KEY,
    nomeParoquia varchar(100) not null

)