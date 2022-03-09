CREATE TABLE cliente(
	id_cliente int not null PRIMARY KEY,
	nome_cli varchar(40) not null,
	email varchar (40) not null,
	cpf char(11) not null,
	endereco varchar(50) not null,
	cep char(8) null,
	uf char(2) null,
	telefone char(13) null,
	ativo bit null
);

CREATE TABLE livro (
	id_livro int not null PRIMARY KEY,
	id_estoque int not null REFERENCES estoque, 
	titulo varchar(40) not null,
	categoria varchar(40) not null,
	isbn char (13) not null,
	autor varchar(40) not null,
	editora varchar(20) not null,
	ano_publi char(4) null
);


CREATE TABLE editora (
	id_editora int not null PRIMARY KEY,	
	nome_edi varchar(40) not null,
	gerente varchar(40) not null,
	e_mail varchar(40) not null,
	telefone char(13) null,
	estoque int not null
);

CREATE TABLE estoque (
	id_estoque int not null PRIMARY KEY,
	id_editora int not null REFERENCES editora,
	titulo varchar(40) not null,
	quantidade int not null,
	editora varchar(40) not null,
	isbn char (13) not null
);
