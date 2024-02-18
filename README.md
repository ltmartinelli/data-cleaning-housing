# Data Cleaning - Imóveis

Projeto criado para estudar análise de dados e data cleaning com SQL.

O arquivo .csv utilizado está disponível neste repositório. Importei os arquivos dentro do PostgreSQL para criação da base de dados. Os scripts para criação das tabelas onde devem ser importados os arquivos também estão disponibilizados aqui.

O arquivo queries.sql contém as queries realizadas para exploração de dados.

Os procedimentos realizados para tratamento dos dados foram:
-  Popular as entradas vazias na coluna de Endereço da Propriedade utilizando como referência linhas com o mesmo valor na coluna "ParcelID", mas que tinham o endereço preenchido.
-  Dividir os atributo compostos de endereço em atributos mais atomizados através de novas colunas com as funções SUBSTRING e SPLIT_PART.
-  Padronizar os valores da coluna "Sold as Vacant", pois algumas entradas utilizavam Y/N, enquanto outras utilizavam Yes/No
