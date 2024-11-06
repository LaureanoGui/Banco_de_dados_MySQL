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
INSERT INTO Cursos (Descricao, Area, Nivel) VALUES ('Engenharia de Software', 'Computação', 2);
INSERT INTO Cursos (Descricao, Area, Nivel) VALUES ('Direito Penal', 'Direito', 1);
INSERT INTO Cursos (Descricao, Area, Nivel) VALUES ('Física Quântica', 'Ciências Exatas', 3);

-- Tabela Turmas
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (1, '2024-01-10', '2024-10-23');
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (2, '2024-02-15', '2024-10-23');
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (1, '2024-03-01', '2024-11-30');
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (2, '2024-04-05', '2024-12-15');
INSERT INTO Turmas (Cod_curso, Data_inicio, Data_fim) VALUES (3, '2024-05-20', '2024-12-20');

-- Tabela Alunos
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('123456789', 1, '12345678910');
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('987654321', 2, '23456789011');
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('111223344', 3, '34567890123');
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('222334455', 4, '45678901234');
INSERT INTO Alunos (RG, Cod_turma, CPF) VALUES ('333445566', 5, '56789012345');

-- Tabela Disciplinas
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Gestão de Projetos', 40, 1);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Ecologia Marinha', 75, 2);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Desenvolvimento Web', 60, 3);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Introdução ao Direito Penal', 50, 4);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Mecânica Quântica', 90, 5);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Cálculo Diferencial e Integral', 114, 5);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Cálculo Diferencial e Integral', 114, 3);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Álgebra Linear', 60, 5);
INSERT INTO Disciplinas (Descricao, Carga_horaria, Cod_curso) VALUES ('Álgebra Linear', 60, 3);


-- Tabela Professores
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Mestre em Administração', '11111111111', '334455667');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Doutor em Biologia', '22222222222', '445566778');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Mestre em Engenharia', '33333333333', '556677889');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Doutor em Direito', '44444444444', '667788990');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('PhD em Física', '55555555555', '778899001');
INSERT INTO Professores (Titulacao, CPF, RG) VALUES ('Doutor em Matemática', '66666666666', '889910101');

-- Tabela ProfTurmaDisc
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (1, 1, 1);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (2, 2, 2);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (3, 3, 3);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (4, 4, 4);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (5, 5, 5);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (6, 5, 6);
INSERT INTO ProfTurmaDisc (Cod_disciplina, Cod_turma, Cod_prof) VALUES (7, 5, 6);

-- 1 - Listar as turmas e os alunos de cada curso.
SELECT * FROM Cursos
JOIN Turmas ON Cursos.Cod_curso = Turmas.Cod_curso JOIN Alunos ON Turmas.Cod_turma = Alunos.Cod_turma;

-- 2 - Listar os cursos com sua matriz curricular e os professores de cada disciplina.
SELECT * FROM Cursos 
JOIN Disciplinas ON Cursos.Cod_curso = Disciplinas.Cod_Curso 
JOIN ProfTurmaDisc ON Disciplinas.Cod_disciplina = ProfTurmaDisc.Cod_disciplina
JOIN Professores ON Professores.Cod_prof = ProfTurmaDisc.Cod_prof;

-- 3 - Listar as disciplinas comuns em mais de um curso.
SELECT Disciplinas.Descricao AS Disciplina,
COUNT(DISTINCT Cod_curso) AS Quantidade_de_Cursos FROM Disciplinas 
GROUP BY Descricao HAVING Quantidade_de_Cursos > 1; 

-- 4 - Listar os professores que lecionam em mais de um curso
SELECT Professores.cpf AS Professor_CPF,
Professores.Titulacao AS Professor_Titulacao,
COUNT(DISTINCT Cursos.Cod_curso) AS Quantidade_de_cursos FROM professores 
JOIN ProfTurmaDisc ON Professores.Cod_prof = ProfTurmaDisc.Cod_prof
JOIN Disciplinas ON ProfTurmaDisc.Cod_disciplina = Disciplinas.Cod_disciplina
JOIN Cursos ON Disciplinas.Cod_curso = Cursos.Cod_curso
GROUP BY Professores.CPF, Professores.Titulacao
HAVING Quantidade_de_cursos > 1;

-- 5 - Listar os alunos com todos os seus dados pessoais e de matrícula
SELECT Alunos.RA, Alunos.RG, Alunos.CPF, Turmas.Cod_turma As Turma, Cursos.Descricao AS Curso,
Cursos.Area, Cursos.Nivel FROM Alunos JOIN Turmas ON Alunos.Cod_turma = Turmas.Cod_Turma
JOIN Cursos ON Turmas.Cod_curso = Cursos.Cod_curso ORDER BY Alunos.RA, Turma;
