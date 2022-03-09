CREATE TABLE cliente(
	id_cliente int not null,
	nome_cli varchar(40) not null,
	email varchar (40) not null,
	cpf char(11) not null,
	endereco varchar(50) not null,
	cep char(8) null,
	uf char(2) null,
	telefone char(13) null,
	ativo bit null,
	PRIMARY KEY (id_cliente)
);

CREATE TABLE livro (
	id_livro int not null,
	titulo varchar(40) not null,
	categoria varchar(40) not null,
	isbn char (13) not null,
	autor varchar(40) not null,
	editora varchar(20) not null,
	ano_publi char(4) null,
	PRIMARY KEY (id_livro)
);


CREATE TABLE editora (
	id_editora int not null,	
	nome_edi varchar(40) not null,
	gerente varchar(40) not null,
	e_mail varchar(40) not null,
	telefone char(13) null,
	estoque int not null,
	PRIMARY KEY (id_editora)
);

CREATE TABLE estoque (
	id_estoque int not null,
	titulo varchar(40) not null,
	quantidade int not null,
	editora varchar(40) not null,
	isbn char (13) not null,
	PRIMARY KEY (id_estoque)
);

ALTER TABLE livro
	ADD CONSTRAINT fk_livro_estoque FOREIGN KEY (id_estoque) REFERENCES estoque;

ALTER TABLE estoque
	ADD CONSTRAINT fk_estoque_editora FOREIGN KEY (id_editora) REFERENCES editora;
