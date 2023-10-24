# bancodedadosac2
banco de dados FACENS semestre 2

Criando a tabela "Produtos" com os campos especificados, onde:

id_produto é a chave primária (um número único para cada produto).
nome é o nome do produto (uma string não nula).
preço é o preço do produto (um número decimal não nulo).
estoque é a quantidade em estoque do produto (um número inteiro não nulo).
perecível é uma coluna booleana que indica se o produto é perecível (0 para não perecível, 1 para perecível).
marca é o nome da marca do produto (pode ser nulo).
nacionalidade é a nacionalidade do produto (pode ser nulo).
Inserindo cinco produtos na tabela, com valores específicos para cada campo, incluindo id_produto, nome, preço, estoque, perecível, marca e nacionalidade.

Verificando se os dados foram inseridos corretamente ao selecionar todos os registros da tabela "Produtos".


https://prnt.sc/hBeM7m5wxSFB


animais.sql - https://prnt.sc/9CDc_jDXVf4l

BDStored-Procedures

ETAPA 1

-- Crie um banco de dados para armazenar alunos, cursos e professores de uma universidade --

create table alunos ( id_alunos int not null primary key auto_increment, nome_alunos varchar(70) not null, email varchar(70), alunos_cursos int,

Foreign key(alunos_cursos) references cursos(id_cursos)

);

create table professores ( id_professores int not null primary key auto_increment, nome_professores varchar(10.2) not null, disciplina varchar(10.2)not null,

Foreign key (disciplina) references cursos(id_cursos) );

create table cursos ( id_cursos int not null primary key auto_increment, nome varchar(30.2) not null );

alter table alunos add column sobrenome varchar(70);

insert into alunos (id_alunos,nome_alunos, sobrenome, alunos_cursos) values (01,'Lucas','Lucco',1), (02,'Pedro','Sampaio',2);

insert into professores (id_professores,nome_professores, disciplina) values (01,'Tiago','Fisica'), (02,'Gabriel','Vendas'), (03,'Leila','Historia'), (04,'Braian','Biologia');

insert into cursos (id_cursos,nome) values (01,'Engenharia Civil'), (02,'Comercio Exterior'), (03,'Filosofia'), (04,'Biomedicina');

ETAPA 2

-- Faça a modelagem do banco e identifique as entidades, seus atributos e relacionamentos --

imgSQL.

ETAPA 3

-- Utilize Stored Procedures para automatizar a inserção e seleção dos cursos --

DELIMITER //

create procedure insercao_cursos( in nome varchar(70) ) begin insert into cursos (nome) values (nome);

END//

DELIMITER ;

CALL insercao_cursos('Banco de dados');

select * from cursos;

DELIMITER //

create procedure selecao_cursos() begin

SELECT * from cursos;
END//

DELIMITER ;

CALL selecao_cursos();

DELIMITER //

ETAPA 4

-- O aluno possui um email que deve ter seu endereço gerado automaticamente no seguinte formato: nome.sobrenome@dominio.com --

CREATE PROCEDURE email_padrao( in pd_id int ) BEGIN declare v_email varchar(70);

select concat(nome_alunos, '.', sobrenome, '@dominio.com') into v_email from alunos where id_alunos = pd_id;


update alunos set email = v_email where id_alunos = pd_id;
END//

DELIMITER ;

call email_padrao(1); select * from alunos;

ETAPA 5

-- Como fica o email se duas pessoas tiverem o mesmo nome e sobrenome? --

DELIMITER //

CREATE PROCEDURE email_padrao_verificacao() BEGIN UPDATE alunos a JOIN ( SELECT id_alunos, nome_alunos, sobrenome, ROW_NUMBER() OVER (PARTITION BY nome_alunos, sobrenome ORDER BY id) as row_num FROM alunos ) b ON a.id = b.id SET a.email = CONCAT(b.nome, '.', b.sobrenome, CASE WHEN b.row_num > 1 THEN b.row_num ELSE '' END, '@dominio.com'); END//

DELIMITER
