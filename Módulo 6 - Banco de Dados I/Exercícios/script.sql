CREATE TABLE cliente(
	id_cliente int not null PRIMARY KEY,
	nome_cli varchar(40) not null,
	email varchar (40) not null,
	cpf char(11) not null,
	endereco varchar(50) not null,
	cep char(8) null,
	uf char(2) null,
	telefone char(11) null,
	ativo bit null
);

CREATE TABLE editora (
	id_editora int not null PRIMARY KEY,	
	nome_edi varchar(40) not null,
	gerente varchar(40) not null,
	e_mail varchar(40) not null,
	telefone char(11) null,
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

INSERT INTO cliente(id_cliente, nome_cli, email, cpf, endereco, cep, uf, telefone, ativo)
VALUES (1000, 'Renata Barretos', 're1984@hotmail.com', '04445877854', 'Av. Paulista, 1800', '01541258', 'SP', '11998541244', '1' ),
		(1001, 'Nikolas Ferreiras', 'nik123@yahoo.com', '04512454857', 'R. Palmares, 451', '12487455', 'BH', '319887545145', '0' ),
		(1002, 'Vinicius Poite', 'vini34@gmail.com', '07855455412', 'R. Dom Pedro, 54', '06871257', 'RJ', '21987754245', '1' ),
		(1003, 'Roberto Carlos', 'reidasvovo@gmail.com', '0211245412', 'Av. Copacabana, 20', '10215451', 'RJ', '21988054412', '1'),
		(1004, 'Mike Tyson', 'boxer99@fight.com', '01512574548', 'R. das Palmeiras, 90', '35482454', 'PI','2898754214','1');

INSERT INTO editora(id_editora, nome_edi, gerente, e_mail, telefone, estoque)
VALUES (1, 'CPB', 'Manoel Vasconcelos', 'manoel@cpb.org.br', '1130125487', 10),
	   (2, 'Editora Faz', 'Ricardo Bille', 'rica@faz.com.br', '21987784512', 11),
	   (3, 'Manuli', 'Jaime Holtz', 'ja@manuli.com','1130545421', 12),
	   (4, 'Opeti', 'Manoela Carneiro', 'mano@opeti.com', '4530215487', 14),
	   (5, 'Juno', 'Julia Goes', 'ju@juno.com','4430216584', 15);
	   
INSERT INTO estoque(id_estoque, id_editora, titulo, quantidade, editora, isbn)
VALUES (70, 1, 'O Desejado de Todas as Nações', 300, 'CPB', '1845875487234'),
	   (71, 2, 'Código Limpo', 200, 'Editora Faz','1245248745784'),
	   (72, 3, 'Storytelling com Dados', 400, 'Manuli', '1134458775432'),
	   (73, 4, 'Data Science para Negócios', 100, 'Opeti','1245784512984'),
	   (74, 5, '1984', 300, 'Juno', '1745874512365');
	   
INSERT INTO livro(id_livro, id_estoque, titulo, categoria, isbn, autor, editora, ano_publi)
VALUES (100, 70, 'O Desejado de Todas as Nações', 'religião', '1845875487234', 'Ellen White', 'CPB', 1898),
	   (101,71, 'Código Limpo', 'Tecnologia', '1245248745784', 'Robert C. Martin', 'Editora Faz', 2009),
	   (102,72, 'Storytelling com Dados', 'Tecnologia', '1134458775432', 'Cole Knafflic', 'Manuli', 2015),
	   (103,73,'Data Science para Negócios', 'Tecnologia', '1245784512984', 'Tom Faucett', 'Opeti', 2016),
	   (104,74, '1984',  'Tecnologia', '1745874512365', 'George Orwell', 'Juno',  1949);
	   
