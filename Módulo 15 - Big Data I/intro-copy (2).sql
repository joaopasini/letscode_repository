-- Databricks notebook source
-- MAGIC %md
-- MAGIC 
-- MAGIC # Introdução a big data
-- MAGIC 
-- MAGIC * Big data hoje é um ambiente que possui um conjunto de ferramentas capazes de lidar com um grande volume e variedade de dados de forma otimizada
-- MAGIC * Temos diferentes formas de fazer um ambiente big data, uma delas é com o Hadoop
-- MAGIC * Hadoop cria um ambiente tolerante a falhas, tendo como base: HDFS, MapReduce e YARN 
-- MAGIC   * HDFS é o sistema de gerenciamento de dados do hadoop, é onde armazenamos nossos dados
-- MAGIC   * MapReduce faz um mapeamento de tarefas entre clusters e uma redução para unir todos esses processamentos e gerar uma saída
-- MAGIC   * YARN gerencia os recursos do ambiente de forma a monitorar se os clusters estão passando por algum problema de processamento 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC # HDFS no Databricks
-- MAGIC 
-- MAGIC * No databricks utilizamos o DBFS 
-- MAGIC * Semelhante ao HDFS só para o databricks
-- MAGIC * Podemos criar arquivos, salvar em memória, definir duplicatas, mover arquivos
-- MAGIC * Uso da função dbutils para este gerenciamento

-- COMMAND ----------

-- MAGIC %python
-- MAGIC 
-- MAGIC dbutils.fs.help()

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.ls('databricks-datasets/bikeSharing/data-001')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.mkdirs('ada_alunos')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.mkdirs('ada_alunos/datasets')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.ls('.')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.cp('databricks-datasets/bikeSharing','ada_alunos/datasets', recurse=True)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.ls('ada_alunos/datasets')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.mkdirs('ada_alunos/datasets/bikeSharing')
-- MAGIC dbutils.fs.mv('ada_alunos/datasets/data-001', 'ada_alunos/datasets/bikeSharing', recurse=True)
-- MAGIC dbutils.fs.mv('ada_alunos/datasets/README.md', 'ada_alunos/datasets/bikeSharing')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.ls('ada_alunos/datasets')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.put('ada_alunos/datasets/hello.txt', 'Hello! Esta é a pasta de datasets dos alunos da ada')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.rm('ada_alunos/datasets/hello.txt')

-- COMMAND ----------

-- MAGIC %md
-- MAGIC 
-- MAGIC # Hive
-- MAGIC 
-- MAGIC * Interpreta instruções SQL para MapReduce
-- MAGIC * Estruturas salvas no HDFS

-- COMMAND ----------

show databases

-- COMMAND ----------

create database if not exists ada

-- COMMAND ----------

show databases

-- COMMAND ----------

use ada

-- COMMAND ----------

show tables

-- COMMAND ----------

create table usuarios(
  idade int,
  estado string,
  salario float
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile
partitioned by (ano int)
location 'ada_alunos/tabelas/usuarios'

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC SET hive.exec.dynamic.partition = true;
-- MAGIC SET hive.exec.dynamic.partition.mode = nonstrict;

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC alter table usuarios add partition(ano=2022)

-- COMMAND ----------

insert into usuarios values(20, 'sp', 3400, 2022)

-- COMMAND ----------

insert into usuarios values(22, 'rj', 3400, 2022)

-- COMMAND ----------

-- MAGIC %sql
-- MAGIC alter table usuarios add partition(ano=2021)

-- COMMAND ----------

insert into usuarios values(30, 'rj', 7400, 2021)

-- COMMAND ----------

select * from usuarios where ano=2022

-- COMMAND ----------

-- MAGIC %python
-- MAGIC #dbutils.fs.mkdirs('ada_alunos/tabelas')
-- MAGIC dbutils.fs.ls('ada_alunos/datasets/bikeSharing')

-- COMMAND ----------

create table bikesharing_alunos(
  instant int,
  dteday string,
  season string,
  yr string,
  mnth string,
  hr string,
  holiday string,
  weekday string,
  workingday string,
  weathersit string,
  temp float,
  atemp float,
  hum float,
  windspeed float,
  casual float,
  registered float,
  cnt int
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile
tblproperties("skip.header.line.count"="1")
location 'ada_alunos/tabelas/bikesharing_alunos'

-- COMMAND ----------

select * from bikesharing_alunos

-- COMMAND ----------

load data inpath '/ada_alunos/datasets/bikeSharing/day.csv' overwrite into table bikesharing_alunos

-- COMMAND ----------

select * from bikesharing_alunos 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC ## Atividade DBFS e Hive
-- MAGIC * Criem um cluster e notebook para a atividade
-- MAGIC * Façam a leitura de arquivos dentro do DBFS
-- MAGIC * Escolham um dataset dentro da pasta databricks-datasets
-- MAGIC * Criem uma pasta própria para vocês com o nome ada_nome_do_aluno
-- MAGIC * Copiem os arquivos da pasta escolhida do dataset para a pasta própria criada no passo anterior
-- MAGIC * Criem um database no hive
-- MAGIC * Escolham o database criado no passo anterior
-- MAGIC * Criem uma tabela hive com os atributos do dataset escolhido
-- MAGIC * Populem a tabela com os dados do arquivo .csv
-- MAGIC * Façam consultas sql nesta tabela (select, consultas com where, contagem, etc)

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.ls('ada_alunos/datasets/bikeSharing/hour.csv')

-- COMMAND ----------

-- MAGIC %python
-- MAGIC dbutils.fs.head('/ada_alunos/datasets/bikeSharing/hour.csv')

-- COMMAND ----------


