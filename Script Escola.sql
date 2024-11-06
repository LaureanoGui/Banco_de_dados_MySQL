DROP DATABASE IF EXISTS Escola;
CREATE DATABASE Escola;
USE Escola;

CREATE TABLE Cursos (
	Cod_curso INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(60) NOT NULL, 
    Area VARCHAR(30) NOT NULL, 
    Nivel INT UNSIGNED,
    PRIMARY KEY (Cod_curso) 
);

CREATE TABLE Turmas (
	Cod_turma INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Cod_curso INT UNSIGNED,
    Data_inicio DATE, 
    Data_fim DATE, 
    PRIMARY KEY (Cod_turma),
    FOREIGN KEY (Cod_curso) REFERENCES Cursos(Cod_curso)
);

CREATE TABLE Alunos (
	RA INT UNSIGNED NOT NULL AUTO_INCREMENT,
    RG CHAR(9),
    Cod_turma INT UNSIGNED, 
    CPF CHAR(11), 
    PRIMARY KEY (RA),
    FOREIGN KEY (Cod_turma) REFERENCES Turmas(Cod_turma)
);

CREATE TABLE Disciplinas (
	Cod_disciplina INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Descricao VARCHAR(60) NOT NULL,
    Carga_horaria INT UNSIGNED, 
    Cod_curso INT UNSIGNED, 
    PRIMARY KEY (Cod_disciplina),
    FOREIGN KEY (Cod_curso) REFERENCES Cursos(Cod_curso)
);

CREATE TABLE Professores (
	Cod_prof INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Titulacao VARCHAR(30) NOT NULL,
    CPF CHAR(11) NOT NULL UNIQUE, 
    RG CHAR(9) NOT NULL UNIQUE,
    PRIMARY KEY (Cod_prof)
);

CREATE TABLE ProfTurmaDisc (
	Cod_disciplina INT UNSIGNED,
    Cod_turma INT UNSIGNED,
    Cod_prof INT UNSIGNED,
    FOREIGN KEY (Cod_disciplina) REFERENCES Disciplinas(Cod_disciplina),
    FOREIGN KEY (Cod_turma) REFERENCES Turmas(Cod_turma),
    FOREIGN KEY (Cod_prof) REFERENCES Professores(Cod_prof)
);

-- Tabela Cursos
INSERT INTO Cursos (Descricao, Area, Nivel) VALUES ('Gestão Empresarial', 'Administração', 2);
INSERT INTO Cursos (Descricao, Area, Nivel) VALUES ('Biologia Marinha', 'Ciências Biológicas', 1);

-- Tabela Turmas
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (1, '2024-01-10', '2024-10-23');
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (2, '2024-02-15', '2024-10-23');

-- Tabela Alunos
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('123456789', 1, '12345678910');
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('987654321', 2, '23456789011');

-- Tabela Disciplinas
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Gestão de Projetos', 40, 1);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Ecologia Marinha', 75, 2);

-- Tabela Professores
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Mestre em Administração', '11111111111', '334455667');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Doutor em Biologia', '22222222222', '445566778');

-- Tabela ProfTurmaDisc
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (1, 1, 1);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (2, 2, 2);
