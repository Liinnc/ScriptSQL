CREATE DATABASE InstitutoDoFuturo;

USE InstitutoDoFuturo;


CREATE TABLE Pessoa (
    ID_Pessoa INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    RG VARCHAR(20) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Profissao VARCHAR(100),
    Numero_PIS_PASEP VARCHAR(11),
    Empresa VARCHAR(100)
);


CREATE TABLE Tema (
    ID_Tema INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Coordenador INT,
    FOREIGN KEY (Coordenador) REFERENCES Pessoa(ID_Pessoa)
);


CREATE TABLE Comite (
    ID_Comite INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    ID_Tema INT,
    FOREIGN KEY (ID_Tema) REFERENCES Tema(ID_Tema)
);


CREATE TABLE Projeto (
    ID_Projeto INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200) NOT NULL,
    Coordenador INT,
    Orçamento DECIMAL(15, 2),
    Data_Inicio DATE,
    Data_Termino DATE,
    Situacao VARCHAR(50),
    Proposta_Geral TEXT,
    Descricao_Detalhada TEXT,
    ID_Tema INT,
    FOREIGN KEY (Coordenador) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (ID_Tema) REFERENCES Tema(ID_Tema)
);


CREATE TABLE Espaco (
    ID_Espaco INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Localidade VARCHAR(200),
    Tipo VARCHAR(50),
    Capacidade INT,
    Horario_de_funcionamento VARCHAR(50)
);


CREATE TABLE Item (
    ID_Item INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50),
    Quantidade INT,
    ID_Espaco INT,
    FOREIGN KEY (ID_Espaco) REFERENCES Espaco(ID_Espaco)
);


CREATE TABLE Resultado (
    ID_Resultado INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(50),
    Titulo VARCHAR(200),
    Resumo TEXT,
    Data_Publicacao DATE,
    Data_Revisao DATE,
    Local_Publicacao VARCHAR(200),
    Premios TEXT,
    URL_Publicacao VARCHAR(200),
    Indexacao VARCHAR(50),
    Indice_citacoes INT,
    ID_Projeto INT,
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto)
);


CREATE TABLE Documento (
    ID_Documento INT PRIMARY KEY AUTO_INCREMENT,
    Titulo VARCHAR(200),
    Corpo_Texto TEXT,
    Palavras_Chave VARCHAR(200),
    Referencias TEXT,
    ID_Resultado INT,
    FOREIGN KEY (ID_Resultado) REFERENCES Resultado(ID_Resultado)
);


CREATE TABLE Autor (
    ID_Pessoa INT,
    ID_Resultado INT,
    PRIMARY KEY (ID_Pessoa, ID_Resultado),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (ID_Resultado) REFERENCES Resultado(ID_Resultado)
);


CREATE TABLE Participa (
    ID_Pessoa INT,
    ID_Projeto INT,
    Hora_dedicada INT,
    PRIMARY KEY (ID_Pessoa, ID_Projeto),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto)
);


CREATE TABLE Pertence (
    ID_Pessoa INT,
    ID_Comite INT,
    PRIMARY KEY (ID_Pessoa, ID_Comite),
    FOREIGN KEY (ID_Pessoa) REFERENCES Pessoa(ID_Pessoa),
    FOREIGN KEY (ID_Comite) REFERENCES Comite(ID_Comite)
);


CREATE TABLE Utiliza (
    ID_Projeto INT,
    ID_Espaco INT,
    PRIMARY KEY (ID_Projeto, ID_Espaco),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Espaco) REFERENCES Espaco(ID_Espaco)
);
