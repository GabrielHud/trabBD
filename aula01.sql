DROP DATABASE IF EXISTS projetoata; 
CREATE DATABASE IF NOT EXISTS projetoata;

USE projetoata;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS projetoata.aluno
(
	id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    curso VARCHAR(200) NOT NULL
    
); 
CREATE TABLE IF NOT EXISTS projetoata.encaminhamento
(
	id_enc INT NOT NULL auto_increment PRIMARY KEY,
    assunto VARCHAR(200) NOT NULL,
    tarefa VARCHAR (200) NOT NULL,
    id_aluno INT NOT NULL,
    FOREIGN KEY(id_aluno) REFERENCES projetoata.aluno(id_aluno)
); 
CREATE TABLE IF NOT EXISTS projetoata.professor
(	
	id_prof INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    nome_prof VARCHAR(200) NOT NULL,
    titulacao VARCHAR(200),
	formacao VARCHAR(200) NOT NULL

);

CREATE TABLE IF NOT EXISTS projetoata.ata
(
	id_ata INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    assunto VARCHAR(200) NOT NULL,
    data_ata DATE NOT NULL,
    id_prof INT NOT NULL,
    FOREIGN KEY(id_prof) REFERENCES projetoata.professor(id_prof)
);

CREATE TABLE IF NOT EXISTS projetoata.projeto
(
	id_projeto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    id_prof INT NOT NULL,
    FOREIGN KEY(id_prof) REFERENCES projetoata.professor(id_prof)
    
);

CREATE TABLE IF NOT EXISTS projetoata.projeto_ata
(
	id_ata INT NOT NULL,
    id_projeto INT NOT NULL,
    PRIMARY KEY(id_ata,id_projeto),
    FOREIGN KEY(id_ata) REFERENCES projetoata.ata(id_ata),
    FOREIGN KEY(id_projeto) REFERENCES projetoata.projeto(id_projeto)
    
    
);

CREATE TABLE IF NOT EXISTS projetoata.aluno_ata
(
	id_aluno INT NOT NULL,
    id_ata INT NOT NULL,
    PRIMARY KEY (id_ata, id_aluno),
    FOREIGN KEY(id_ata) REFERENCES projetoata.ata(id_ata),
    FOREIGN KEY(id_aluno) REFERENCES projetoata.aluno(id_aluno)
);
CREATE TABLE IF NOT EXISTS projetoata.encaminhamento_ata
(
	id_enc INT NOT NULL,
    id_ata INT NOT NULL,
    PRIMARY KEY(id_enc,id_ata),
    FOREIGN KEY (id_enc) REFERENCES projetoata.encaminhamento(id_enc),
    FOREIGN KEY (id_ata) REFERENCES projetoata.ata(id_ata)
    
    
);

