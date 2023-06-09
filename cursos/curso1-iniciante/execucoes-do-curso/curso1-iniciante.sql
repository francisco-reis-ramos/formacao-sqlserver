
-- CONTE�DO ABORDADO NO CURSO:
	-- Opera��es DDL: Cria��o e remo��o de bancos e tabelas;
	-- Inclus�o de dados em tabelas;
	-- Atualiza��o de dados em tabelas;
	-- Exclus�o de dados em tabelas;
	-- Opera��es matem�ticas com dados das tabelas;
	-- Cria��o Primary-Key em uma tabela existente;
	-- Realiza��o de consultas com base em filtros simples;
	-- Utiliza��o de operadores de compara��o para filtar consultas;
	-- Utiliza��o de filtros com base em datas para realizar consultas;
	-- Utiliza��o de operadores l�gicos AND e OR para filtrar consultas.


-- M�DULO 04: CRIANDO TABELAS

-- AULA 03: CRIANDO A TABELA DE CLIENTES
CREATE TABLE [TABELA DE CLIENTES]
([CPF] [VARCHAR] (11),
[NOME] [VARCHAR] (100),
[ENDERECO 1] [VARCHAR] (150),
[ENDERECO 2] [VARCHAR] (150),
[BAIRRO] [VARCHAR] (50),
[CIDADE] [VARCHAR] (50),
[ESTADO] [VARCHAR] (2),
[CEP] [VARCHAR] (8),
[DATA DE NASCIMENTO] [DATE],
[IDADE] [SMALLINT],
[SEXO] [VARCHAR] (1),
[LIMITE DE CREDITO] [MONEY],
[VOLUME DE COMPRA] [FLOAT],
[PRIMEIRA COMPRA] [BIT])


-- M�DULO 05: MANUTEN��O DOS DADOS NA TABELA

-- AULA 02: INSERINDO DADOS NA TABELA DE PRODUTOS 
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO],
[NOME DO PRODUTO],
[EMBAlAGEM],
[TAMANHO],
[SABOR],
[PRE�O DE LISTA])

VALUES
('1040107',
'Light - 350 ml - Mel�ncia',
'Lata',
'350 ml',
'Melancia',
4.56)

-- AULA 03: EXERCICIO - INCLUINDO O PRIMEIRO VENDEDOR:
INSERT INTO [TABELA DE VENDEDORES]
(MATRICULA,
NOME,
[PERCENTUAL COMISSAO])

VALUES
('00235',
'M�rcio Almeida Silva',
0.08)

INSERT INTO [TABELA DE VENDEDORES]
(MATRICULA,
NOME,
[PERCENTUAL COMISSAO])

VALUES
('00236',
'Cl�udia Morais',
0.08)

-- AULA 04 E 05: INCLUINDO VARIOS REGISTROS
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO],
[NOME DO PRODUTO],
EMBALAGEM,
TAMANHO,
SABOR,
[PRE�O DE LISTA])

VALUES
('1037797','Clean - 2 Litros - Laranja', 'PET', '2 Litros', 'Laranja', 16.01),
('1000889',	'Sabor da Montanha - 700 ml - Uva', 'Garrafa','700 ml', 'Uva',	6.31);

-- AULA 08: ALTERANDO REGISTROS
-- VAMOS INSERIR OS REGISTROS QUE SER�O ALTERADOS DEPOIS
INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA])
VALUES
('544931', 'Frescor do Ver�o - 350 ml - Lim�o', 'PET', '350 ml','Lim�o',3.20)

INSERT INTO [TABELA DE PRODUTOS]
([CODIGO DO PRODUTO], [NOME DO PRODUTO], [EMBALAGEM], [TAMANHO], [SABOR], [PRECO DE LISTA])
VALUES
('1078680', 'Frescor do Ver�o - 470 ml - Manga', 'Lata', '470 ml','Manga',5.18)

-- ALTERE A EMBALAGEM DO ITEM 544931 PARA LATA E SEU PRE�O PARA 2.46. AJUSTE TAMBEM A EMEBALAGEM DO ITEM 1078680 PARA GARRAFA.
UPDATE [TABELA DE PRODUTOS]
SET EMBALAGEM = 'Lata',
	[PRECO DE LISTA] = 2.46
WHERE [CODIGO DO PRODUTO] = '544931'

UPDATE [TABELA DE PRODUTOS]
SET EMBALAGEM = 'Garrafa'
WHERE [CODIGO DO PRODUTO] = '1078680'

-- AULA 09 - EXERCICIO: ALTERANDO INFORMA��ES SOBRE OS VENDEDORES
-- ALTERE O A COMISS�O DE 00235 PARA 11% E O NOME ADICIONE O SOBRENOME SOUSA AO NOME DO VENDEDOR 00236.
UPDATE [TABELA DE VENDEDORES]
SET [PERCENTUAL COMISSAO] = 0.11
WHERE MATRICULA = '00235'

UPDATE [TABELA DE VENDEDORES]
SET NOME = 'Claudia Morais Sousa'
WHERE MATRICULA = '00236'

-- AULAS 10 E 11: EXCLUINDO REGISTROS
-- VAMOS EXCLUIR UM DOS REGISTROS DA TABELA DE PRODUTOS.
DELETE FROM [TABELA DE PRODUTOS]
WHERE [CODIGO DO PRODUTO]='1078680'

DELETE FROM [TABELA DE VENDEDORES]
WHERE MATRICULA = '00235'


-- M�DULO 06: ORDEM DOS CAMPOS E CHAVE PRIMARIA

-- AULAS 03 E 04: CHAVE PRIMARIA E CAMPOS NULOS
-- PARA TRANSFORMAR UM CAMPO EM PK � NECESS�RIO QUE ELE N�O ACEITE VALORES NULOS. 
-- VAMOS TORNAR O CAMPO 'MATRICULA', DA TABELA DE VENDEDORES, "N�O ANUL�VEL" E DEPOIS VAMOS TORN�-LO A PK.

-- PASSO 1) PARA QUE N�O SEJA ACEITA A INSER��O DE VALORES NULO NO CAMPO:
ALTER TABLE [TABELA DE VENDEDORES]
ALTER COLUMN [MATRICULA]
VARCHAR(5) NOT NULL

-- PASSO 2) PARA TORNAR O CAMPO 'MATRICULA' A PK:
ALTER TABLE [TABELA DE VENDEDORES]
ADD CONSTRAINT PK_TABELA_DE_VENDEDORES
PRIMARY KEY CLUSTERED (MATRICULA)

-- AULA 09: MANIPULANDO TABELAS E CAMPOS L�GICOS
-- VAMOS FAZER INSERIR UM REGISTRO NA TABELA DE CLIENTES COM A AJUDA DO  ASSISTENTE. FA�A O SEGUINTE:
-- BOT�O DIREITO DO MOUSE > 'SCRIPT DE TABELA COMO' > 'INSERT PARA' > '�REA DE TRANSFER�NCIA' > 
-- > COPIE ABAIXO O C�DIGO QUE EST� NA SUA �REA DE TRANSFER�NCIA > EM 'VALUES' FA�A A SUBSTITUI��O DO TEXTO INSERINDO OS VALORES.
USE [SUCOS_VENDAS_REV2023]
GO

INSERT INTO [dbo].[TABELA DE CLIENTES]
           ([CPF]
           ,[NOME]
           ,[ENDERECO 1]
           ,[ENDERECO 2]
           ,[BAIRRO]
           ,[CIDADE]
           ,[ESTADO]
           ,[CEP]
           ,[DATA DE NASCIMENTO]
           ,[IDADE]
           ,[SEXO]
           ,[LIMITE DE CREDITO]
           ,[VOLUME DE COMPRA]
           ,[PRIMEIRA COMPRA])
     VALUES
           ('00383454802'
           ,'Jo�o da Silva'
           ,'Rua Projetada A'
           ,'Numero 233'
           ,'Copacabana'
           ,'Rio de Janeiro'
           ,'RJ'
           ,'20000000'
           ,'1965-03-21'  
           ,55
           ,'M'
           ,20000.00
           ,3000.23
           ,1)
GO


-- M�DULO 07: CONSULTANDO DADOS DAS TABELAS

-- AULA 02: LISTANDO DADOS DA TABELA
-- VAMOS VER ALGUMAS FORMAS DE LISTAR CAMPOS DAS TABELAS:

-- 1) LISTANDO TODOS OS CAMPOS
SELECT [CPF]
      ,[NOME]
      ,[ENDERECO1]
      ,[ENDERECO2]
      ,[BAIRRO]
      ,[CIDADE]
      ,[ESTADO]
      ,[CEP]
      ,[DATA DE NASCIMENTO]
      ,[IDADE]
      ,[SEXO]
      ,[LIMITE DE CREDITO]
      ,[VOLUME DE COMPRA]
      ,[PRIMEIRA COMPRA]
  FROM [TABELA DE CLIENTES]

-- 2) LISTANDO TODOS OS CAMPOS USANDO *
SELECT * FROM [TABELA DE CLIENTES]

-- 3) LISTANDO CAMPOS ESPEC�FICOS
SELECT CPF, ENDERECO1
FROM [TABELA DE CLIENTES]

-- AULA 04: FILTRANDO REGISTRO
-- AS SELE��ES DO QUE DEVE SER EXIBIDO N�O SE LIMITAM APENAS �S COLUNAS. PODEMOS INSERIR CONDI��ES BASEADAS NO VALOR DOS CAMPOS.
SELECT * FROM [TABELA DE PRODUTOS]
WHERE SABOR = 'Lim�o'

-- SELECIONADOS OS PRODUTOS DE SABOR LIM�O, VAMOS AUMENTAR O PRE�O DELES EM 10%.
UPDATE [TABELA DE PRODUTOS]
SET [PRECO DE LISTA] = 1.1 * [PRECO DE LISTA]
WHERE SABOR = 'Lim�o'

-- AULA 06: FILTRANDO USANDO MAIOR, MENOR E DIFERENTE
-- FA�A UMA SELE��O DOS PRODUTOS QUE TENHAM VALOR MAIOR OU IGUAL A R$ 10,00.
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] >= 10.0

-- FA�A UMA SELE��O SEMELHANTE A ANTERIOR MAS DESSA VEZ OS CAMPOS EXIBIDOS DEVEM SER APENAS 'CODIGO DO PRODUTO' E 'PRECO DE LISTA'.
SELECT [CODIGO DO PRODUTO] AS 'SKU', [PRECO DE LISTA] AS 'PRE�O' FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] >= 10.0

-- AGORA FILTRE APENAS OS PRODUTOS COM PRE�O MENOR QUE R$ 9,00
SELECT * FROM [TABELA DE PRODUTOS] WHERE [PRECO DE LISTA] < 9.00

-- AULA 08: FILTRANDO POR DATAS
-- FA�A UMA SELE��O DOS CLIENTES QUE NASCERAM A PARTIR DE 1995.
SELECT * FROM [TABELA DE CLIENTES] WHERE [DATA DE NASCIMENTO] >= '1995-01-01'

-- FA�A UMA SELE��O DOS CLIENTES QUE NASCERAM NO ANO DE 1995.
SELECT * FROM [TABELA DE CLIENTES] WHERE YEAR([DATA DE NASCIMENTO]) = 1995

-- AGORA FILTRE OS CLIENTES QUE NASCERAM NO M�S DE SETEMBRO, INDEPENDENTEMENTE DO ANO.
SELECT * FROM [TABELA DE CLIENTES] WHERE MONTH([DATA DE NASCIMENTO]) = 9

-- AULA 10: FILTROS COMPOSTOS
-- SELECIONE OS CLIENTES DA CIDADE DO RIO DE JANEIRO QUE TENHAM MAIS DE 22 ANOS. A EXIBI��O DEVE INCLUIR APENAS NOME, CIDADE E IDADE.
SELECT [NOME], [CIDADE], [IDADE] FROM [TABELA DE CLIENTES] WHERE [CIDADE] = 'Rio de Janeiro' and [IDADE] > 22

-- AGORA FA�A UMA SELE��O QUE EXIBA PESSOAS QUE SEJAM DO SEXO FEMININO OU TENHAM NASCIDO NO ANO DE 2000.
SELECT * FROM [TABELA DE CLIENTES] WHERE [SEXO] = 'F' OR YEAR([DATA DE NASCIMENTO]) = 2000
