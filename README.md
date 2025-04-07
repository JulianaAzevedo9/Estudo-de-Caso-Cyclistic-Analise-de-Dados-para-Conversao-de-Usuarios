# Projeto-Ciclístico-Google-Case-Study

## Introdução 
O **Cyclistic Bike Share Case Study** é um projeto de conclusão do **Certificado profissional de análise de dados do Google** no Coursera. Neste estudo de caso, realizarei várias tarefas do mundo real de um analista de dados júnior em uma empresa fictícia chamada Cyclistic. Perguntar, preparar, processar, analisar, compartilhar e agir são os estágios do processo de análise de dados que usarei para resolver os principais problemas de negócios.

## Contexto
Cyclistic é um serviço de partilha de bicicletas que oferece 600 estações de ancoragem e mais de 5.800 bicicletas, incluindo opções únicas como bicicletas de carga, triciclos de mão e bicicletas reclinadas, tornando o serviço acessível a pessoas com deficiência. Embora 8% dos utilizadores utilizem bicicletas assistidas, a maioria opta por bicicletas normais. Mais de 30% dos utilizadores utilizam bicicletas para deslocações pendulares, embora muitos também o façam para lazer.

A estratégia de marketing da Cyclistic centrou-se na notoriedade da marca e na demografia alargada dos consumidores, apoiada por planos de preços flexíveis: passes únicos, passes de um dia inteiro e associações anuais. Os clientes com passes únicos ou de um dia são utilizadores ocasionais, enquanto os assinantes anuais são membros.

Os analistas financeiros observam que os membros são muito mais rentáveis do que os ciclistas ocasionais. Moreno, o diretor de marketing, acredita que a conversão de ciclistas casuais em membros é fundamental para o crescimento futuro, uma vez que estes já reconhecem os benefícios do ciclismo. A equipa de marketing pretende:

* Compreender as diferenças entre os ciclistas casuais e os membros.
* Identificar as razões por detrás das decisões de compra dos ciclistas casuais.
* Avaliar o impacto dos meios digitais nas estratégias de marketing.

Para tal, a equipa irá analisar dados históricos de viagens de bicicleta para descobrir tendências e orientar campanhas de marketing direcionadas.

### Cenário
Na Cyclistic, uma empresa de partilha de bicicletas sediada em Chicago, estou a assumir o papel de analista de dados júnior na equipa de análise de marketing. O sucesso futuro da empresa depende do aumento das adesões anuais, conforme enfatizado pelo diretor de marketing. A minha equipa pretende analisar a forma como os membros anuais e os ciclistas casuais utilizam as bicicletas Cyclistic de forma diferente para desenvolver uma estratégia de marketing direcionada que converta os ciclistas casuais em membros anuais.

No entanto, as nossas recomendações têm primeiro de obter a aprovação dos executivos da Cyclistic, o que significa que têm de ser apoiadas por informações baseadas em dados e visualizações especializadas.

Este projeto segue o processo de análise de dados em seis etapas descrito no certificado do Google Data Analytics:

    Perguntar - Definir o problema da empresa.

    Preparar - Recolher e organizar os dados relevantes.

    Processar - Limpar e validar os dados.

    Analisar - Identificar padrões e tendências.

    Partilhar - Apresentar os resultados através de visualizações e relatórios.

    Agir - Recomendar estratégias com base em informações.

O objetivo é fornecer recomendações acionáveis que ajudem a Cyclistic a aumentar as conversões anuais de membros por meio de decisões de marketing baseadas em dados.

## Abordagem/etapas
### 1. Perguntar
Missão

Criar estratégias de marketing que incentivem os ciclistas casuais a tornarem-se membros anuais.
Questões de análise

A próxima campanha de marketing será guiada por três questões-chave:

* Como é que os membros anuais e os ciclistas casuais usam as bicicletas Cyclistic de forma diferente?
* Porque é que os ciclistas ocasionais comprariam uma assinatura anual?
* Como é que a Cyclistic pode utilizar os meios digitais para influenciar os ciclistas ocasionais a tornarem-se membros?

Moreno atribuiu-me a primeira pergunta para responder:
“Como é que os membros anuais e os utilizadores casuaus usam as bicicletas da Cyclistic de forma diferente?”

### 2. Preparar
Utilizarei os dados de viagem do Divvy, um valioso conjunto de dados históricos fornecidos pela Motivate International Inc. sob licença, para analisar as tendências na utilização de bicicletas ciclísticas de janeiro a dezembro de 2022.

**Fonte de dados:** [divvy-tripdata](https://divvy-tripdata.s3.amazonaws.com/index.html) <br>
[Note-se que os dados foram disponibilizados pela Motivate International Inc. ao abrigo desta [<ins>licença</ins>](https://www.divvybikes.com/data-license-agreement)].

**Ferramentas:** <br>
- Limpeza e tratamento de dados - SQL em PostgreSQL
- Visualização de dados - Microsoft Power BI

### 3. Processo
A base para esta análise são os dados **2022** e os passos para o processamento dos dados são os seguintes:

![Combinação de dados](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Combining%20Months%20Data%20Cyclistic%20.sql)

![Exploração de dados](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Data%20Exploration.sql)

![Limpeza de dados](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Data%20Cleaning.sql)

![Análise de dados](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Analysis%20Cyclistic.sql)

#### Combinação de dados
Após a importação das tabelas para o PostgreSQL, o passo seguinte consiste na fusão das doze tabelas mensais numa única tabela consolidada para o ano de 2022. Esta consolidação permite uma análise mais eficiente e integrada dos dados para esse período.

Como todas as tabelas tinham a mesma estrutura de colunas e tipos de dados, utilizámos a operação UNION ALL para as combinar. A tabela resultante, denominada cyclistic_2022, contém um total de 5.733.451 linhas.

#### Exploração de dados
Antes de limpar os dados, um dos primeiros passos que dei foi familiarizar-me com a estrutura da tabela e os seus dados para identificar potenciais inconsistências.

A tabela seguinte lista todos os nomes das colunas e os respectivos tipos de dados. Em particular, a coluna ride_id foi definida como chave primária, garantindo a exclusividade de cada registo na tabela.

| **No.**| **Variable**       | **Description** |**Type**.       |**Null** |
|--------|------------------ | --------------------------------------------------------|----------------|---------|
| 1 | ride_id | ID único atribuído a cada viagem | Chave primária | Não |
| 2 | rideable_type | clássico, acoplado ou elétrico | Mediumtext | Sim |
| 3 | started_at | Data e hora do início da viagem | Datetime | Sim |
| 4 | ended_at | Data e hora no final da viagem | Datetime | Sim |
| 5 | nome_da_estacao_inicial  | Nome da estação de onde a viagem começou | MediumText | Sim |
| 6 | start_station_id | ID da estação onde a viagem começou | MediumText | Sim |
| 7 | end_station_name | Nome da estação onde a viagem terminou | MediumText | Sim |
| 8 | end_station_id | ID da estação em que a viagem terminou | MediumText | Sim |
| 9 | start_lat | Latitude da estação de partida | Duplo | Sim |
| 10 | start_lng | Longitude da estação de partida | Duplo | Sim |
| 11 | end_lat | Latitude da estação final | Duplo | Sim |
| 12 | end_lng | Longitude da estação final | Duplo | Sim |                     
| 13 | member_casual | Tipo de inscrição de cada piloto | MediumText | Sim |

#### Limpeza de dados

Remoção de valores em falta - Todas as linhas com entradas vazias ou nulas foram eliminadas.
Novas colunas adicionadas - Foram criadas três novas colunas:

* ride_length (duração da viagem)
* dia_da_semana
* mês

Viagens inválidas filtradas - Excluídas as viagens com duração inferior a 1 minuto ou superior a 1 dia.
Total de linhas removidas: 1,400,282

### 4. Analisar

Análise de dados
A questão da análise é: 
> Como é que os membros anuais e os utilizadores ocasionais utilizam as bicicletas Cyclistic de forma diferente?

Os dados limpos são importados para o Microsoft Power BI para serem analisados e os valores apresentados são os seguintes.

### Total de viagens e utilização de tipos de bicicletas em 2022

A comparação inicial centra-se nas "Preferências de tipo de bicicleta entre membros e utilizadores ocasionais".

A figura abaixo mostra o **número total de passeios e a utilização do tipo de bicicleta em 2022** efectuados pelos membros da Cyclistic e pelos ciclistas ocasionais em **2022**. 

![Tipos de afiliação](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Tipos%20de%20Membro%20pie%20chart.png)

* Os membros representam 59,74% do total de utilizadores, enquanto os utilizadores ocasionais representam 40,3%.
* A análise da utilização do tipo de bicicleta mostra:
    * As bicicletas "clássicas" são as mais populares.
    * As bicicletas "eléctricas" vêm em segundo lugar.
    * As bicicletas "docadas" são as menos utilizadas e exclusivas para os utilizadores ocasionais.

### Total de viagens de bicicleta por mês, semana e dia

De seguida, examinamos a distribuição das viagens por mês, dia da semana e hora do dia.

![Total de viagens de bicicleta por mês](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Total%20de%20viagens%20meses%20coluna%20chart.png)

![Total de viagens de bicicleta por semana](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Total%20de%20viagens%20na%20semana%20coluna%20chart.png)

![Total de viagens de bicicleta por hora](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Total%20de%20viagens%20por%20hora%20coluna%20chart.png)

Análise da hora do dia
* Membros: O pico de utilização ocorre durante a manhã (6-8h) e à noite (4-8h), sugerindo um comportamento pendular.
* Casual Riders: A utilização aumenta gradualmente ao longo do dia, atingindo o seu pico no final da tarde antes de diminuir.

Análise do dia da semana
* Os utilizadores ocasionais fazem mais viagens aos fins-de-semana, provavelmente por lazer.
* Os membros revelam uma maior utilização durante a semana, com uma diminuição aos fins-de-semana - o que apoia ainda mais as deslocações relacionadas com o trabalho.

Tendências mensais
* Ambos os grupos apresentam uma maior utilização na primavera/verão e uma menor utilização no inverno.
* A menor diferença entre a utilização ocasional e a dos membros ocorre em julho (pico do verão).

Principais informações
* Os membros utilizam principalmente bicicletas para deslocações profissionais (dias de semana, horas de ponta).
* Os utilizadores ocasionais privilegiam as viagens de lazer (fins-de-semana, durante o dia).
* Influência sazonal: Ambos os grupos andam mais nos meses quentes, mas os ciclistas casuais apresentam padrões mais fortes aos fins-de-semana.

### Duração média das deslocações de bicicleta por mês, semana e dia

Foi efectuada uma análise da duração das viagens para comparar os padrões de utilização entre os utilizadores ocasionais e os membros anuais.

![Viagens médias](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Media%20da%20duracao%20das%20viagens%20em%202022.png)

Duração média da viagem
* Os utilizadores ocasionais têm uma duração de viagem significativamente mais longa (≈2x) do que os membros.
* Os membros mantêm uma duração de viagem consistente durante todo o ano, sem flutuações notáveis por estação, dia ou hora.

Tendências do Casual Rider
* Sazonal: Passeios mais longos na primavera/verão, mais curtos no inverno.
* Semanal: Picos de duração nos fins-de-semana (utilização de lazer).
* Diariamente: Viagens mais longas entre as 10h00 e as 14h00; mais curtas entre as 5h00 e as 8h00 (horas de menos movimento).

Visão comportamental
* Os utilizadores ocasionais dão prioridade a viagens mais longas e menos frequentes, em linha com a utilização recreativa.
* As deslocações mais curtas e constantes dos membros reforçam as deslocações utilitárias (por exemplo, rotinas de trabalho).

Principais informações
Os dados sublinham uma clara divisão - os utilizadores casuais preferem viagens longas e orientadas para o lazer, enquanto os membros optam por viagens eficientes e habituais. Os padrões sazonais e de hora do dia realçam ainda mais esta distinção.

### Locais de início e fim da viagem de bicicleta

Para compreender melhor as diferenças entre os utilizadores ocasionais e os membros, analisamos a localização das estações de início e fim das viagens. Seleccionamos as estações com o maior volume de viagens, aplicando filtros para obter as seguintes informações

![Bike Trip End LOcations](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Locais%20de%20Partida.png)
![Locais de fim de viagem de bicicleta](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Locais%20d%20partida.png)

Casual:
* Iniciar viagens principalmente perto de destinos turísticos e de lazer, incluindo: Museus, Parques, Praias, Marinas (pontos de atracagem) e Aquários

Membro:
* Iniciar as viagens com maior frequência perto de locais práticos e de utilização diária, tais como: Universidades, zonas residenciais, restaurantes, hospitais, supermercados, teatros, escolas, bancos, fábricas, estações de comboio, parques e praças

Principais informações:
* Os utilizadores casuais preferem locais recreativos e paisagísticos, o que sugere uma utilização baseada no lazer.
* Os membros mostram padrões orientados para o trabalho pendular, com viagens que começam perto de serviços essenciais, locais de trabalho e centros de trânsito.

![Locais de início da viagem de bicicleta](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/chegada.png)
![Locais de início da viagem de bicicleta](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/LOcais%20de%20chagada.png)

Casual:
* Viagens finais predominantemente perto de áreas de lazer e recreação, incluindo: Parques, Museus e Atracções Turísticas

Membro:
* Viagens finais mais frequentes perto de destinos de uso diário, tais como: Universidades, Bairros residenciais e Distritos comerciais.

Principais informações:
Os dados reforçam uma clara divisão comportamental:
* Os utilizadores ocasionais utilizam as bicicletas principalmente para lazer e turismo, com viagens concentradas em torno de locais de recreio.
* Os membros confiam nas bicicletas para deslocações de rotina e recados práticos, com viagens ligadas ao trabalho, educação e serviços essenciais.

### 5. Partilhar

![DashBoard](https://github.com/JulianaAzevedo9/Estudo-de-Caso-Cyclistic-Analise-de-Dados-para-Conversao-de-Usuarios/blob/main/Dashboard%20Cyclistic%20portugues.png)


* Viajam duas vezes mais, mas com menos frequência do que os membros.
* Começam e terminam as suas viagens perto de parques, museus, zonas costeiras e outros espaços de lazer.
* Preferem utilizar a bicicleta durante o dia, sobretudo aos fins-de-semana, no verão e na primavera, para actividades de lazer.

Membros
* Viajam com mais frequência, mas em trajectos mais curtos (cerca de metade da duração dos trajectos dos ciclistas ocasionais).
* Começam e terminam as suas viagens perto de universidades, zonas residenciais e comerciais.
* Preferem andar de bicicleta durante a semana nas horas de ponta (8h/5h) na primavera e no verão.

### 6. Atuar

Após identificar as diferenças entre ciclistas casuais e ciclistas membros, podem ser desenvolvidas estratégias de marketing para converter ciclistas casuais em membros. São sugeridas as seguintes recomendações:
1. Lançar campanhas de marketing durante a primavera e o verão em zonas turísticas e recreativas que sejam populares entre os ciclistas ocasionais.
2. Oferecer associações sazonais ou apenas ao fim de semana, tendo em conta que os ciclistas ocasionais são mais activos durante esses períodos.
3. Proporcionar descontos para passeios mais longos, uma vez que os ciclistas ocasionais tendem a utilizar as bicicletas durante mais tempo do que os membros.

## 🔮 Conclusão
Esta análise oferece informações importantes sobre os diferentes comportamentos e preferências dos membros da Cyclistic e dos utilizadores ocasionais. Ao adaptar as estratégias a estas diferenças, a empresa pode encorajar mais eficazmente os utilizadores casuais a tornarem-se potenciais membros.


