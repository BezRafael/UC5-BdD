create database minha_biblioteca;

use minha_biblioteca;

create table cliente(
	cod_cliente int primary key,
	nome nchar(50),
	email varchar(50),
	telefone_1 nchar(11),
	telefone_2 nchar(11),
	rua varchar(25),
	bairro varchar(25),
	cidade varchar(25),
	estado varchar(25)
);

create table pessoa_fisica(
	cod_cliente int,
	foreign key(cod_cliente) references cliente(cod_cliente),
	rg varchar(11),
	cpf char(11) primary key
);

create table pessoa_juridica(
	cod_cliente int,
	foreign key(cod_cliente) references cliente(cod_cliente),
	cnpj char(14) primary key,
	ie char(14)
);

create table pedido(
	cod_cliente int,
	cod_pedido int primary key,
	foreign key(cod_cliente) references cliente(cod_cliente),
	valor_pedido smallmoney,
	data_pedido date
);

create table editora(
	cod_editora int primary key,
	telefone_editora nchar(11),
	telefone_secundario nchar(11),
	nome_contato varchar(25),
	email varchar(50)
);

create table  livro(
	cod_editora int,
	cod_livro int primary key,
	foreign key(cod_editora) references editora(cod_editora),
	preco smallmoney,
	ano_publicacao date,
	categoria varchar (255),
	titulo varchar (255),
	autor varchar(50)
);

create table item_pedido(
	cod_pedido int,
	cod_livro int,
	foreign key(cod_pedido) references pedido(cod_pedido),
	foreign key(cod_livro) references livro(cod_livro),
	qtde_pedido int,
	valor_total smallmoney
);

create table estoque(
	cod_editora int,
	cod_livro int,
	foreign key(cod_editora) references editora(cod_editora),
	foreign key(cod_livro) references livro(cod_livro),
	qtde_estoque int
);

insert into cliente(
	cod_cliente,
	nome,
	email,
	telefone_1,
	telefone_2,
	rua,
	bairro,
	cidade,
	estado
)
values(1001, 'João Silva', 'joao.silva@example.com', '(11) 91234-5678', '(11) 99876-5432', 'Rua das Flores', 'Jardim Primavera', 'São Paulo', 'SP');

select * from cliente