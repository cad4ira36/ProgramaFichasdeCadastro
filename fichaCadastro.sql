-- Criação de banco de dados
CREATE DATABASE Ficha_de_cadastro;

USE Ficha_de_cadastro;

-- Criação de tabelas
CREATE TABLE Paroquia(
    id_paroquia int AUTO_INCREMENT PRIMARY KEY,
    nomeParoquia varchar(100) not null

);
CREATE TABLE Jovem( 
    id_jovem INT AUTO_INCREMENT PRIMARY KEY, 
    nomeJovem VARCHAR(100) not null, 
    apelidoJovem VARCHAR(30) not null, 
    emailJovem VARCHAR(100) not null, 
    dataNascimento DATE not null, 
    naturalidadeJovem VARCHAR(50) not null, 
    horarioLivre VARCHAR(50) not null, 
    escolaridadeJovem VARCHAR(40) not null, 
    cursoJovem VARCHAR(30) not null, 
    instituicaoJovem VARCHAR(30) not null, 
    sacramentosJovem VARCHAR(25) not null, 
    intrumentoJovem VARCHAR(50) not null, 
    situacaoJovem VARCHAR(25) not null, 
    idParoquia INT not null, 
CONSTRAINT fk_jovem_paroquia FOREIGN KEY (idParoquia) REFERENCES Paroquia(id_paroquia) 
);

CREATE TABLE Telefone(
    ID_telefone INT AUTO_INCREMENT PRIMARY KEY,
    numeroTelefone VARCHAR(50) NOT NULL
);
CREATE TABLE Equipes (
	ID_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nomeEquipe VARCHAR(30) NOT NULL,
    tipoEquipe VARCHAR(20) NOT NULL
);
CREATE TABLE Pastoral (
	ID_pastoral INT AUTO_INCREMENT PRIMARY KEY,
    nomePastoral VARCHAR(100) NOT NULL
    
);
CREATE TABLE Endereço(
	ID_endereco INT AUTO_INCREMENT PRIMARY KEY,
    cidade VARCHAR(40) NOT NULL,
    bairro VARCHAR(40) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    notaEndereco VARCHAR(50) NOT NULL --Caso o jovem more em algum apartamento/condominio/vila
);
CREATE TABLE Palestra(
	ID_palestra INT AUTO_INCREMENT PRIMARY KEY,
    nomePalestra VARCHAR(100) NOT NULL
);
CREATE TABLE Responsavel(
	ID_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nomeResponsavel VARCHAR(70) NOT NULL,
    TipoResponsavel VARCHAR(30) NOT NULL --Identificar se é pai/mãe/grau do responsavel
);
