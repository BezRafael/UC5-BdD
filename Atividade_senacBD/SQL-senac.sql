create database senac;

use senac;

create table endereco(
    id_endereco INT IDENTITY(1,1) PRIMARY KEY,
    cep CHAR(9) NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numero SMALLINT NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

exec sp_rename 'endereco', 'Endereco'
exec sp_rename 'Endereco', 'endereco'

----REFERENTE A FUNCIONARIO
create table funcionario(
    matricula_funcionario INT PRIMARY KEY,   
    nome VARCHAR(50) NOT NULL, 
    cpf CHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    data_emissao DATE NOT NULL,
    salario FLOAT NOT NULL,
    ano_xp INT NOT NULL,
    id_endereco INT,
    FOREIGN KEY id_endereco REFERENCES endereco(id_endereco)
);

create table pedagogo(
    id_pedagogo INT IDENTITY(1,1) PRIMARY KEY,
    especialidade VARCHAR(255) NOT NULL,
    matricula_funcionario INT,
    FOREIGN KEY matricula_funcionario REFERENCES funcionario(matricula_funcionario)
);

create table porteiro(
    id_porteiro INT IDENTITY(1,1) PRIMARY KEY,
    matricula_funcionario INT,
    FOREIGN KEY matricula_funcionario REFERENCES funcionario(matricula_funcionario)  
);

create table professor(
    id_professor INT IDENTITY(1,1) PRIMARY KEY,
    area VARCHAR(50) NOT NULL,
    especialidade VARCHAR(255) NOT NULL,
    matricula_funcionario INT,
    FOREIGN KEY matricula_funcionario REFERENCES funcionario(matricula_funcionario)
);

create table atendente(
    id_atendente INT IDENTITY(1,1) PRIMARY KEY,
    matricula_funcionario INT,
    FOREIGN KEY matricula_funcionario REFERENCES funcionario(matricula_funcionario)
);

--REFERENTE A CURSO

--AQUI TEREMOS A ENTIDADE 'CURSO' QUE SERVIRÁ DE MODELO PARA OUTRAS ENTIDADES
create table curso(
    id_curso INT IDENTITY(1,1) PRIMARY KEY, --CHAVE PRIMÁRIA QUE TERÁ AUTO-INCREMENTO
    nome VARCHAR(100) NOT NULL,
    area VARCHAR(50) NOT NULL,              --'AREA' SE REFERE A AREA DO CURSO EX: SAÚDE.
    coordenador VARCHAR(50) NOT NULL,
    carga_horaria INT NOT NULL,             
    qtde_vagas INT NOT NULL,                -- QUANTIDADE DE VAGAS QUE O CURSO DISPONIBILIZA
    turno VARCHAR(20) NOT NULL,             -- 'TURNO' SE SERÁ MANHÃ(MATUTUINO), TARDE(VESPERTINO) OU NOITE(NOTURNO
    horario_aulas VARCHAR(50) NOT NULL,     -- QUAIS OS DIAS DA SEMANA TERÁ AULA
    tempo_curso VARCHAR(50) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor SMALLMONEY NOT NULL,
);

create table curso_tecnico(
    id_tecnico INT IDENTITY(1,1) PRIMARY KEY, --CHAVE PRIMÁRIA QUE TERÁ AUTO-INCREMENTO
    id_curso INT,                             --COLUNA QUE FARÁ REFERÊNCIA À CHAVE PRIMÁRIA DA TABELA 'CURSO'
    FOREIGN KEY id_curso REFERENCES curso(id_curso) --DEFININDO A COLUNA id_curso COMO CHAVE ESTRANGEIRA
);

create table curso_livre(
    id_cursoLivre INT IDENTITY(1,1) PRIMARY KEY, --CHAVE PRIMÁRIA QUE TERÁ AUTO-INCREMENTO
    id_curso INT,                                --COLUNA QUE FARÁ REFERÊNCIA À CHAVE PRIMÁRIA DA TABELA 'CURSO'
    FOREIGN KEY id_curso REFERENCES curso(id_curso) --DEFININDO A COLUNA id_curso COMO CHAVE ESTRANGEIRA
);

create table idioma(
    id_cursoIdioma INT IDENTITY(1,1) PRIMARY KEY, --CHAVE PRIMÁRIA QUE TERÁ AUTO-INCREMENTO
    publico_alvo VARCHAR(50) NOT NULL,            --QUAL SERÁ O PÚBLICO ALVO DESSE CURSO EX: JOVENS, ADULTOS, CRIANÇAS...
    faixa_etaria VARCHAR(10) NOT NULL,            --QUAL A FAIXA ETÁRIA EX: 10 À 15 ANOS
    id_curso INT,                                 --COLUNA QUE FARÁ REFERÊNCIA À CHAVE PRIMÁRIA DA TABELA 'CURSO'
    FOREIGN KEY id_curso REFERENCES curso(id_curso) --DEFININDO A COLUNA id_curso COMO CHAVE ESTRANGEIRA
);

create table alemao(
    id_cursoAlemao INT IDENTITY(1,1) PRIMARY KEY, 
    id_cursoIdioma INT,
    id_curso INT,
    FOREIGN KEY id_cursoIdioma REFERENCES idioma(id_cursoIdioma),
    FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

create table frances(
    id_cursoFrances INT IDENTITY(1,1) PRIMARY KEY,
    id_cursoIdioma INT,
    id_curso INT,
    FOREIGN KEY id_cursoIdioma REFERENCES idioma(id_cursoIdioma),
    FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

create table italiano(
    id_cursoItaliano INT IDENTITY(1,1) PRIMARY KEY,
    id_cursoIdioma INT,
    id_curso INT,
    FOREIGN KEY id_cursoIdioma REFERENCES idioma(id_cursoIdioma),
    FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

create table espanhol(
    id_cursoEspanhol INT IDENTITY(1,1) PRIMARY KEY,
    id_cursoIdioma INT,
    id_curso INT,
    FOREIGN KEY id_cursoIdioma REFERENCES idioma(id_cursoIdioma),
    FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

create table ingles(
    id_cursoIngles INT IDENTITY(1,1) PRIMARY KEY,
    id_cursoIdioma INT,
    id_curso INT,
    FOREIGN KEY id_cursoIdioma REFERENCES idioma(id_cursoIdioma),
    FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

--REFERENTE A ALUNO
--AQUI TEREMOS A ENTIDADE 'ALUNO' QUE SERVIRÁ DE MODELO PARA OUTRAS ENTIDADES
create table aluno(
    matricula_aluno VARCHAR(20) PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1)				--ARMAZENARÁ APENAS 1 CARACTERE M(MASCULINO) F(FEMININO) P(PERSONALIZADO)
);

create table aluno_psg(
    id_aluno_psg INT IDENTITY(1,1) PRIMARY KEY,
    matricula_aluno INT,
    FOREIGN KEY matricula_aluno REFERENCES aluno(matricula_aluno)
);

create table aluno_comercial(
    id_alunoComercial INT IDENTITY(1,1) PRIMARY KEY,
    matricula_aluno INT,
    FOREIGN KEY matricula_aluno REFERENCES aluno(matricula_aluno)
);

create table aluno_aprediz(
    id_alunoAprediz INT IDENTITY(1,1) PRIMARY KEY,
    matricula_aluno INT,
    FOREIGN KEY matricula_aluno REFERENCES aluno(matricula_aluno)
);

--REFERENTE A INSTITUIÇÃO SENAC

create table senac(
id_instituicao INT IDENTITY(1,1) PRIMARY KEY,
unidade VARCHAR(50) NOT NULL,
cnpj VARCHAR(14) NOT NULL,
id_endereco INT,
id_curso INT,
FOREIGN KEY id_endereco REFERENCES endereco(id_endereco),
FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

--REFERENTE A 'ALUNO' E 'CURSO'

create table matricula(
id_matricula INT IDENTITY(1,1) PRIMARY KEY,
data_mensalidade DATE,
responsavel_pagamento VARCHAR(50), 
matricula_aluno INT,
id_aluno INT,
FOREIGN KEY matricula_aluno REFERENCES aluno(matricula_aluno),
FOREIGN KEY id_curso REFERENCES curso(id_curso)
);

--REFERENTE A 'FUNCIONARIO' E 'SENAC'

create table contrato(
id_contrato INT IDENTITY(1,1) PRIMARY KEY,
matricula_funcionario INT,
id_instituicao INT,
FOREIGN KEY matricula_funcionario REFERENCES funcionario(matricula_funcionario)
FOREIGN KEY id_instituicao REFERENCES senac(id_instituicao)
);
