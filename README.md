# FIAP - Faculdade de Informática e Administração Paulista

<p align="center">
<a href= "https://www.fiap.com.br/"><img src="assets/logo-fiap.png" alt="FIAP - Faculdade de Informática e Admnistração Paulista" border="0" width=40% height=40%></a>
</p>

<br>

# Nome do projeto
Cap 1 - Um mapa do tesouro

## Nome do grupo
Grupo 42

## 👨‍🎓 Integrantes: 
- <a href="https://www.linkedin.com/in/anacornachi/">Ana Cornachi</a>
- <a href="https://www.linkedin.com/in/carlamaximo/">Carla Máximo</a>
- <a href="https://www.linkedin.com/in/lucas-lins-lima/">Lucas Lins</a> 

## 👩‍🏫 Professores:
### Tutor(a) 
- <a href="https://www.linkedin.com/in/lucas-gomes-moreira-15a8452a/">Lucas Gomes Moreira</a>
### Coordenador(a)
- <a href="https://www.linkedin.com/in/andregodoichiovato/">André Godoi Chiovato</a>


## 📜 Descrição

A **FarmTech Solutions** é uma startup focada em soluções de Agricultura Digital. Este projeto visa desenvolver uma modelagem de banco de dados relacional para armazenar e analisar os dados coletados por sensores utilizados em plantações, com o objetivo de otimizar o uso de água e nutrientes como parte de um sistema inteligente de monitoramento agrícola.

## 🎯 Objetivo

Criar um banco de dados que permita:

- Armazenar dados de sensores em tempo real;
- Registrar as culturas plantadas e suas aplicações;
- Otimizar recursos hídricos e nutricionais;
- Permitir análise histórica de dados para previsões futuras.

---

## 🧱 Entidades e Atributos (MER)

---

### 🌾 1. Produtor

**Descrição:** Representa o responsável pela plantação. Pode cadastrar culturas e receber os relatórios gerados pelo sistema.

| Atributo    | Tipo         | Descrição                        |
|-------------|--------------|----------------------------------|
| id_produtor | INT (PK)     | Identificador único do produtor |
| nome        | VARCHAR(100) | Nome completo do produtor       |
| email       | VARCHAR(100) | E-mail de contato               |
| telefone    | VARCHAR(20)  | Telefone do produtor            |

---

### 🌱 2. Cultura

**Descrição:** Cada plantação gerenciada pelo produtor. Pode possuir sensores e receber aplicações de recursos.

| Atributo    | Tipo         | Descrição                           |
|-------------|--------------|-------------------------------------|
| id_cultura  | INT (PK)     | Identificador da cultura            |
| nome        | VARCHAR(100) | Nome da cultura (ex: milho, soja)   |
| tipo        | VARCHAR(50)  | Tipo (ex: grão, legume, hortaliça)  |
| data_inicio | DATE         | Início do cultivo                   |
| data_fim    | DATE         | Término/colheita (se finalizado)    |
| id_produtor | INT (FK)     | Chave estrangeira (dono da cultura) |

**Relacionamento:**  
- 1 Produtor → N Culturas

---

### 📡 3. Sensor

**Descrição:** Equipamento instalado na plantação para coletar dados em tempo real.

| Atributo    | Tipo         | Descrição                               |
|-------------|--------------|-------------------------------------------|
| id_sensor   | INT (PK)     | Identificador único do sensor             |
| tipo        | VARCHAR(50)  | Tipo do sensor (umidade, pH, NPK)         |
| modelo      | VARCHAR(50)  | Modelo ou fabricante do sensor            |
| localizacao | VARCHAR(100) | Localização exata ou área da plantação    |
| id_cultura  | INT (FK)     | Cultura na qual está instalado            |

**Relacionamento:**  
- 1 Cultura → N Sensores

---

### 📈 4. Leitura_Sensor

**Descrição:** Dados coletados pelos sensores ao longo do tempo.

| Atributo             | Tipo     | Descrição                                  |
|----------------------|----------|----------------------------------------------|
| id_leitura           | INT (PK) | Identificador da leitura                     |
| id_sensor            | INT (FK) | Sensor responsável pela leitura              |
| data_hora            | DATETIME | Data e hora da medição                       |
| valor_umidade        | DOUBLE   | Valor medido de umidade (%)                 |
| valor_ph             | DOUBLE   | Valor do pH do solo                         |
| valor_npk_fosforo    | DOUBLE   | Quantidade de fósforo detectado (mg/kg)    |
| valor_npk_potassio   | DOUBLE   | Quantidade de potássio detectado (mg/kg)   |

**Observação:** Dependendo do tipo do sensor, nem todos os campos serão preenchidos.

**Relacionamento:**  
- 1 Sensor → N Leituras

---

### 💧 5. Aplicacao

**Descrição:** Registro de ações aplicadas na lavoura com base nas leituras (ex: irrigação, fertilização).

| Atributo     | Tipo         | Descrição                                   |
|--------------|--------------|---------------------------------------------|
| id_aplicacao | INT (PK)     | Identificador da aplicação                  |
| id_cultura   | INT (FK)     | Cultura que recebeu a aplicação             |
| data_hora    | DATETIME     | Data e hora da aplicação                    |
| tipo         | VARCHAR(50)  | Tipo (água, fertilizante, vitamina etc.)    |
| quantidade   | DOUBLE       | Quantidade aplicada (litros, kg etc.)       |

**Relacionamento:**  
- 1 Cultura → N Aplicações

## 🔁 Relacionamentos

- Um **produtor** pode ter várias **culturas** → (1:N)
- Uma **cultura** pode ter vários **sensores** → (1:N)
- Um **sensor** pode gerar várias **leituras** → (1:N)
- Uma **cultura** pode ter várias **aplicações** → (1:N)

---

## 💾 Tipos de Dados

| Atributo                   | Tipo de dado    |
|----------------------------|-----------------|
| id_*                       | INTEGER (PK/FK) |
| nome, tipo, modelo         | VARCHAR         |
| data_hora                  | TIMESTAMP       |
| data_inicio, data_fim      | DATE            |
| quantidade, valores        | DOUBLE          |

---

## 🗂️ Diagrama Entidade-Relacionamento (DER)

<img src="assets/diagrama.png">


> Os diagramas foram gerados utilizando o [SQL Developer Data Modeler](https://www.oracle.com/br/database/sqldeveloper/technologies/sql-data-modeler/download/).

## 📜 Script SQL (DDL)

Consulte o arquivo [`script_banco.sql`](script_banco.sql) para ver a criação das tabelas e seus relacionamentos.

---

## 📁 Estrutura de pastas

Dentre os arquivos e pastas presentes na raiz do projeto, definem-se:

- <b>.github</b>: Nesta pasta ficarão os arquivos de configuração específicos do GitHub que ajudam a gerenciar e automatizar processos no repositório.

- <b>assets</b>: aqui estão os arquivos relacionados a elementos não-estruturados deste repositório, como imagens.

- <b>config</b>: Posicione aqui arquivos de configuração que são usados para definir parâmetros e ajustes do projeto.

- <b>document</b>: aqui estão todos os documentos do projeto que as atividades poderão pedir. Na subpasta "other", adicione documentos complementares e menos importantes.

- <b>scripts</b>: Posicione aqui scripts auxiliares para tarefas específicas do seu projeto. Exemplo: deploy, migrações de banco de dados, backups.

- <b>src</b>: Todo o código fonte criado para o desenvolvimento do projeto ao longo das 7 fases.

- <b>README.md</b>: arquivo que serve como guia e explicação geral sobre o projeto (o mesmo que você está lendo agora).

## 🔧 Como executar o código

*Acrescentar as informações necessárias sobre pré-requisitos (IDEs, serviços, bibliotecas etc.) e instalação básica do projeto, descrevendo eventuais versões utilizadas. Colocar um passo a passo de como o leitor pode baixar o seu código e executá-lo a partir de sua máquina ou seu repositório. Considere a explicação organizada em fase.*


## 🗃 Histórico de lançamentos

* 0.5.0 - 13/04/2024
    * 
* 0.4.0 - XX/XX/2024
    * 
* 0.3.0 - XX/XX/2024
    * 
* 0.2.0 - XX/XX/2024
    * 
* 0.1.0 - XX/XX/2024
    *

## 📋 Licença

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/agodoi/template">MODELO GIT FIAP</a> por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">Fiap</a> está licenciado sobre <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.</p>
