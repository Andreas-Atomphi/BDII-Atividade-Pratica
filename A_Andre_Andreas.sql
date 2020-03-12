/*Andreas Luiz de Faria 
  Andre Cypriano Sanches */

create database agencia_bancaria_a
go

use agencia_bancaria_a
go

create table banco 
(
	id_bco integer			NOT NULL	PRIMARY KEY,
	nm_banco varchar(40)	NOT NULL ,
	end_bco varchar(70)		NOT NULL 
)

create table tp_conta
(
	id_tp_con integer		NOT NULL	PRIMARY KEY,
	dsc_tp_con varchar(20)	NOT NULL
)

create table cliente 
(
	id_cliente integer		NOT NULL	PRIMARY KEY,
	nm_cliente varchar(50)	NOT NULL ,
	dt_nasc date			NOT NULL ,
) 

create table agencia 
(
	id_agencia integer		NOT NULL	PRIMARY KEY,
	banco_id_banco integer	NOT NULL,
	nm_agen	varchar(40)		NOT NULL,
	end_agen varchar(70)	NOT NULL,
	constraint id_banco	FOREIGN KEY (banco_id_banco) references banco(id_bco)
)

create table conta
	(id_conta	integer			NOT	NULL	PRIMARY	KEY,
	tpconta_id_tp_con	integer	NOT	NULL,
	cliente_id_clie	integer		NOT	NULL,
	agencia_id_agen	integer		NOT NULL,
	vl_con	numeric(7,2)		NOT	NULL,
	constraint	conta_id_tp_con	FOREIGN	KEY	(tpconta_id_tp_con)	references	tp_conta(id_tp_con),
	constraint	conta_id_clie	FOREIGN	KEY	(cliente_id_clie)	references	cliente(id_cliente),
	constraint	conta_id_agen	FOREIGN	KEY	(agencia_id_agen)	references	agencia(id_agencia))
go

insert into banco (id_bco, nm_banco, end_bco)
	Values ('1',	'Bradesco',	'Cidade de Deus, 25');

insert into agencia (id_agencia,	banco_id_banco,	nm_agen,	end_agen)
	Values	('110',	'1',	'Vl Maria', 'Rua Alcantara, 20'),
			('115',	'1',	'Tatuapé',	'Rua Tuiti, 50'),
			('120',	'1',	'CentroSP',	'Praca da Se');

insert into tp_conta (id_tp_con, dsc_tp_con)
	Values	('10',	'Conta Corrente'),
			('11',	'Conta Poupança'),
			('12',	'Conta Investimento');

insert into cliente (id_cliente, nm_cliente, dt_nasc)
	Values ('111', 'Jose Silva', '1980-01-15'),
	       ('112', 'Marcia Silva Martins',	'1990-05-08'),
		   ('113', 'Mario Andarins',	'1991-02-28'),
		   ('114', 'Giovana Silva Teles',	'1992-01-02');
		   
insert into conta (id_conta,	tpconta_id_tp_con,	cliente_id_clie,	agencia_id_agen,	vl_con)
	Values	('1',	'10',	'114',	'110',	'2500.10'),
			('2',	'10',	'111',	'115',	'0.15'),
			('3',	'12',	'113',	'120',	'1800.00'),
			('4',	'11',	'114',	'120',	'300.20'),
			('5',	'12',	'111',	'110',	'500.00'),
			('6',	'11',	'113',	'110',	'1250.10');
go

select	*	from	tp_conta
go
select	*	from	cliente	where nm_cliente like '%a'
go
select	*	from	cliente where nm_cliente like 'J%'
go

select	vl_con, cliente_id_clie	from	conta
where
vl_con	>=	1200.00	and	vl_con	<= 	1900.00
go