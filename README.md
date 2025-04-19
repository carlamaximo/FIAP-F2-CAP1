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

A **FarmTech Solutions** é uma startup focada em soluções para **Agricultura Digital**. Com o desafio crescente de **otimizar o uso de recursos naturais** e **aumentar a produtividade no campo**, este projeto visa **modelar um banco de dados relacional** capaz de armazenar e analisar dados de sensores de umidade, pH e nutrientes instalados em plantações. Essa estrutura de dados servirá como base para um sistema inteligente de monitoramento, análise histórica e tomada de decisão voltada à irrigação e aplicação eficiente de insumos agrícolas, como parte de um sistema otimizado de monitoramento agrícola.

## 💡 Problema

Produtores rurais enfrentam desafios como desperdício de água, uso inadequado de fertilizantes e falta de dados confiáveis para tomada de decisão. A ausência de um sistema inteligente para acompanhamento em tempo real gera desperdícios e reduz a eficiência produtiva.

## 🎯 Solução

O projeto propõe uma modelagem de banco de dados para:

- Armazenar dados de sensores de **umidade**, **pH** e **nutrientes (P e K)**;
- Registrar **leituras em tempo real** e **aplicações de insumos**;
- Servir como **base para sistemas inteligentes** de análise e previsão.

Essa estrutura permitirá:

- **Ajustar a irrigação e fertilização** de forma precisa;
- **Analisar dados históricos**;
- **Aplicar modelos preditivos** para antecipar demandas da lavoura.

## 📊 Aplicações Futuras

O modelo de dados foi estruturado para permitir análises históricas detalhadas, viabilizando o desenvolvimento de soluções futuras com **inteligência artificial e predição** de comportamento do solo e das culturas:

- Quais culturas precisarão de mais água com base no clima e histórico de solo;
- Quando aplicar nutrientes com mais eficácia;
- Qual será o comportamento do pH do solo em determinadas épocas.

## 🧱 Entidades e Atributos (MER)

---

### 🌾 1. Produtor

**Descrição:** Representa o responsável pela plantação. Pode cadastrar culturas e receber os relatórios gerados pelo sistema.

| Atributo    | Tipo         | Descrição                        |
|-------------|--------------|----------------------------------|
| id_produtor | INT (PK)     | Identificador único do produtor |
| nome        | VARCHAR(200) | Nome completo do produtor       |
| email       | VARCHAR(200) | E-mail de contato               |
| telefone    | VARCHAR(30)  | Telefone do produtor            |

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

![Relational_1](https://github.com/user-attachments/assets/e65ef8bc-a46c-4e25-9a07-932c1d4d9400)



> Os diagramas foram gerados utilizando o [SQL Developer Data Modeler](https://www.oracle.com/br/database/sqldeveloper/technologies/sql-data-modeler/download/).

## 📜 Script SQL (DDL)

Consulte o arquivo [farmtech](https://github.com/carlamaximo/FIAP-F2-CAP1/blob/main/document/farmtech.ddl) para ver a criação das tabelas e seus relacionamentos.

---

## 📁 Estrutura de pastas

Dentre os arquivos e pastas presentes na raiz do projeto, definem-se:

- <b>.github</b>: Contém arquivos de configuração do GitHub, como workflows e ações automatizadas. Pode ser usada futuramente para CI/CD ou verificação automática de entrega.

- <b>assets</b>: Armazena imagens e recursos visuais utilizados na documentação, como o DER exportado em PNG e logo da faculdade.

- <b>config</b>: Espaço reservado para arquivos de configuração do projeto. Pode incluir parâmetros de ambiente ou arquivos .env.example, se necessário em fases futuras.

- <b>document</b>: Contém os documentos formais do projeto, como o briefing inicial, atas de reunião, e o modelo do banco de dados exportado pelo Oracle SQL Developer Data Modeler (.ddl).

farmtech: Subpasta para armazenar arquivos gerados pelo Oracle SQL Developer Data Modeler.

- <b>scripts</b>: Armazena scripts auxiliares.

Contém um README.md explicando que o script SQL foi mencionado no descritivo do projeto, mas foi desconsiderado conforme orientação do professor.

O arquivo script_banco.sql permanece aqui apenas para fins de consulta, sem obrigatoriedade de execução.

- <b>src</b>: Diretório reservado para o código-fonte do projeto. Embora este projeto tenha foco em modelagem de dados, futuras implementações (como APIs ou front-ends para visualização dos dados) poderão ser armazenadas aqui.

<b>README.md</b>: Arquivo principal de documentação do projeto. Serve como guia de entendimento sobre o objetivo, estrutura e funcionamento do repositório.

## 🔧 Como executar o código

Este projeto não possui código executável tradicional, mas apresenta uma modelagem de banco de dados relacional criada com o Oracle SQL Developer Data Modeler. Abaixo estão as instruções para abrir e visualizar o modelo.

✅ Pré-requisitos
Antes de começar, você vai precisar ter instalado:

- Oracle SQL Developer Data Modeler

- Versão utilizada: 23.x (ou mais recente)

- Download: https://www.oracle.com/br/database/sqldeveloper/technologies/sql-data-modeler/download/

📥 Como baixar o repositório
Você pode clonar este repositório em sua máquina local com o seguinte comando:

- git clone git@github.com:carlamaximo/FIAP-F2-CAP1.git (SSH)
  OU:
- git clone https://github.com/carlamaximo/FIAP-F2-CAP1.git (HTTPS)


### 🧪 Exemplo de Query:

-- Média mensal da umidade por cultura
SELECT
    c.nome AS cultura,
    MONTH(ls.data_hora) AS mes,
    AVG(ls.valor_umidade) AS media_umidade
FROM Cultura c
JOIN Sensor s ON c.id_cultura = s.id_cultura
JOIN Leitura_Sensor ls ON s.id_sensor = ls.id_sensor
GROUP BY c.nome, MONTH(ls.data_hora);

---

## 🗃 Histórico de lançamentos

* 0.5.0 - 13/04/2025
    * 
* 0.4.0 - 19/04/2025
    * 
* 0.3.0 - XX/XX/2024
    * 

## 📋 Licença

<img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1"><img style="height:22px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1"><p xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/"><a property="dct:title" rel="cc:attributionURL" href="https://github.com/agodoi/template">MODELO GIT FIAP</a> por <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://fiap.com.br">Fiap</a> está licenciado sobre <a href="http://creativecommons.org/licenses/by/4.0/?ref=chooser-v1" target="_blank" rel="license noopener noreferrer" style="display:inline-block;">Attribution 4.0 International</a>.</p>
