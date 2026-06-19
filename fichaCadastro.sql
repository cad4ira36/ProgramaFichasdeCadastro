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
CREATE TABLE Endereco(
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
--CREATE TABLE paroquia_pastoral ( 
  --  ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY, 
    --idParoquia INT NOT NULL, 
    --idPastoral INT NOT NULL, 
    --CONSTRAINT fk_paroquia FOREIGN KEY (idParoquia) REFERENCES Paroquia(id_paroquia), 
    --CONSTRAINT fk_pastoral FOREIGN KEY (idPastoral) REFERENCES Pastoral(ID_pastoral) 
);
CREATE TABLE Jovem_palestra(
    ID_relacionamento int AUTO_INCREMENT PRIMARY KEY,
    idJovem int NOT NULL,
    FOREIGN KEY (idJovem) REFERENCES Jovem(ID_jovem),

    idPalestra int NOT NULL,
    FOREIGN KEY (idPalestra) REFERENCES Palestra(ID_palestra) -- Referencia a chave primaria da tabela
);
CREATE TABLE Jovem_pastoral (
    ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,

    idPastoral INT NOT NULL,
    FOREIGN KEY (idPastoral)
        REFERENCES Pastoral(ID_pastoral),

    idJovem INT NOT NULL,
    FOREIGN KEY (idJovem)
        REFERENCES Jovem(ID_jovem)
);
CREATE TABLE Telefone_jovem(
	ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
    idTelefone INT NOT NULL,
    FOREIGN KEY (idTelefone) REFERENCES Telefone(ID_telefone),
    idJovem INT NOT NULL,
    FOREIGN KEY(idJovem) REFERENCES Jovem(ID_jovem)
);
CREATE TABLE Endereco_jovem(
	ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
    idEndereco INT NOT NULL,
    FOREIGN KEY(idEndereco) REFERENCES Endereco(ID_endereco),
    idJovem INT NOT NULL,
    FOREIGN KEY(idJovem) REFERENCES Jovem(ID_jovem)
);
CREATE TABLE Jovem_responsavel(
	ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
    idResponsavel INT NOT NULL,
    FOREIGN KEY(idResponsavel) REFERENCES Responsavel(ID_responsavel),
    idJovem INT NOT NULL,
    FOREIGN KEY (idJovem) REFERENCES Jovem(ID_jovem)
);
CREATE TABLE Jovem_equipe(
	ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
    cargoJovem VARCHAR(30) NOT NULL,
    idEquipes INT NOT NULL,
    FOREIGN KEY(idEquipes) REFERENCES Equipes(ID_equipe),
    idJovem INT NOT NULL,
    FOREIGN KEY (idJovem) REFERENCES Jovem(ID_jovem)
);
CREATE TABLE paroquia_pastoral(
	ID_relacionamento INT AUTO_INCREMENT PRIMARY KEY,
    idParoquia INT NOT NULL,
    FOREIGN KEY (idParoquia) REFERENCES Paroquia(id_paroquia),
    idPastoral INT NOT NULL,
    FOREIGN KEY(idPastoral) REFERENCES Pastoral(ID_pastoral)
);
