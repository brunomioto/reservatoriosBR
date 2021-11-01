
# **reservatoriosBR** <img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/>

<!-- badges: start -->

[![pix](https://img.shields.io/badge/Apoie%20com-PIX-brightgreen)](https://www.brunomioto.com.br/pix)
[![License](https://img.shields.io/badge/license-GPL-blueviolet.svg?style=flat)](https://github.com/brunomioto/reservatoriosBR/blob/main/LICENSE.md)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5496237.svg)](https://doi.org/10.5281/zenodo.5496237)
[![Twitter
Follow](https://img.shields.io/twitter/follow/BrunoHMioto?color=%2315202B&label=Seguir%20%40BrunoHMioto&style=social)](https://twitter.com/BrunoHMioto)
[![R-CMD-check](https://github.com/brunomioto/reservatoriosBR/workflows/R-CMD-check/badge.svg)](https://github.com/brunomioto/reservatoriosBR/actions)
[![Codecov test
coverage](https://codecov.io/gh/brunomioto/reservatoriosBR/branch/main/graph/badge.svg)](https://app.codecov.io/gh/brunomioto/reservatoriosBR?branch=main)
<!-- badges: end -->

Pacote R para obtenção de dados dos principais reservatórios brasileiros
a partir da plataforma **[SAR-ANA](https://www.ana.gov.br/sar/)** e da
**[ONS](http://www.ons.org.br/paginas/energia-agora/reservatorios)**.

Este pacote baixa e organiza os dados em uma estrutura para uso no R.

Atualmente estou buscando **voluntários** para testar as funções e
dados. Se puder, [entre em contato](https://twitter.com/BrunoHMioto)!

Se utilizar em algum trabalho, cite ou me avise! Gostaria de saber como
este pacote pode ajudar!

Se você estiver procurando dados sobre os mananciais de abastecimento
público na Região Metropolitana de São Paulo (SP - Brasil), o pacote
[`mananciais`](https://beatrizmilz.github.io/mananciais/) foi feito para
isso!

## Instalação

Este pacote apenas está disponível para a instalação usando o devtools
no R (mas é simples):

``` r
#install.packages("devtools")
devtools::install_github('brunomioto/reservatoriosBR')
library(reservatoriosBR)
```

## Uso

Atualmente o pacote possui **9** funções:

### Funções de datasets

-   `tabela_reservatorios()`
-   `tabela_reservatorios_ONS()`
-   `info_reservatoriosBR()`

### Funções de busca de dados

-   `reservatorio_sin()`
-   `reservatorio_cantareira()`
-   `reservatorio_nordeste_semiarido()`
-   `ultima_medicao()`
-   `ONS_reservatorios()`
-   `ONS_EAR_subsistemas()`

------------------------------------------------------------------------

## As funções de datasets

### A função `tabela_reservatorios()`

Essa função retorna uma tabela com informações sobre os reservatórios
que podem ser utilizadas com as funções de busca de dados. Este são os
reservatórios contabilizados pela ANA.

São **713 reservatórios** (são 804 linhas pois reservatórios em 2
cidades são duplicados) com **12 variáveis**, sendo elas:

<<<<<<< HEAD
-   `sistema` - sistema o qual o reservatório pertence segundo o SAR.
-   `codigo` - **O código do reservatório segundo o SAR. Utilizado nas
    funções desse pacote.**
-   `reservatorio` - O nome do reservatorio.
-   `res_latitude` - Latitude do reservatório
-   `res_longitude` - Longitude do reservatório
-   `municipio` - Município do reservatório
-   `codigo_municipio_ibge` - Código do município na base do IBGE.
-   `estado_nome` - Estado em forma de nome.
-   `estado_sigla` - Estado em forma de sigla.
-   `rio` - Nome do rio.
-   `sub_bacia` - Sub-bacia do rio.
-   `bacia` - Bacia hidrográfica do rio.
=======
`sistema` - sistema o qual o reservatório pertence segundo o SAR.
`codigo` - **O código do reservatório segundo o SAR. Utilizado nas
funções desse pacote.** `reservatorio` - O nome do reservatorio.
`res_latitude` - Latitude do reservatório `res_longitude` - Longitude do
reservatório `municipio` - Município do reservatório
`codigo_municipio_ibge` - Código do município na base do IBGE.
`estado_nome` - Estado em forma de nome. `estado_sigla` - Estado em
forma de sigla. `rio` - Nome do rio. `sub_bacia` - Sub-bacia do rio.
`bacia` - Bacia hidrográfica do rio.
>>>>>>> a23ae538c60bbad9fb1ab24d04b8424e76ae4f35

**Agradeço ao pessoal da ANA, em especial, o coordenador Antônio
Augusto, o especialista Diego Pena e o técnico Théo Albuquerque, que
construíram essa tabela e apoiam essa iniciativa de dados abertos!**

``` r
#library(dplyr)

<<<<<<< HEAD
tabela_reservatorios() #%>% 
#> Error in tabela_reservatorios(): não foi possível encontrar a função "tabela_reservatorios"
  #distinct(codigo, .keep_all = TRUE) #caso queira uma lista sem códigos duplicados
```

    #> Error in ggplot(.): não foi possível encontrar a função "ggplot"
=======
tabela_reservatorios() %>% 
  #distinct(codigo, .keep_all = TRUE) #caso queira uma lista sem códigos duplicados
#> Error: <text>:5:0: unexpected end of input
#> 3: tabela_reservatorios() %>% 
#> 4:   #distinct(codigo, .keep_all = TRUE) #caso queira uma lista sem códigos duplicados
#>   ^
```

    #> Error in tabela_reservatorios() %>% distinct(codigo, .keep_all = TRUE) %>% : não foi possível encontrar a função "%>%"
>>>>>>> a23ae538c60bbad9fb1ab24d04b8424e76ae4f35

### A função `tabela_reservatorios_ONS()`

Essa função retorna uma tabela parecida com a `tabela_reservatorios()`,
mas contendo apenas os reservatórios observados pela **ONS**.

São **39 reservatórios** com **12 variáveis**, sendo elas:

<<<<<<< HEAD
-   `subsistema` - Subsistema-ONS a qual o reservatório pertence.
-   `reservatorio` - O nome do reservatório
-   `codigo` - **O código do reservatório segundo o SAR. Utilizado nas
    funções desse pacote.** código do reservatório segundo o SAR.
-   `res_latitude` - Latitude do reservatório
-   `res_longitude` - Longitude do reservatório
-   `municipio` - Município do reservatório
-   `codigo_municipio_ibge` - Código do município na base do IBGE.
-   `estado_nome` - Estado em forma de nome.
-   `estado_sigla` - Estado em forma de sigla.
-   `rio` - Nome do rio.
-   `sub_bacia` - Sub-bacia do rio.
-   `bacia` - Bacia hidrográfica do rio.
=======
`subsistema` - Subsistema-ONS a qual o reservatório pertence.
`reservatorio` - O nome do reservatório `codigo` - **O código do
reservatório segundo o SAR. Utilizado nas funções desse pacote.** código
do reservatório segundo o SAR. `res_latitude` - Latitude do reservatório
`res_longitude` - Longitude do reservatório `municipio` - Município do
reservatório `codigo_municipio_ibge` - Código do município na base do
IBGE. `estado_nome` - Estado em forma de nome. `estado_sigla` - Estado
em forma de sigla. `rio` - Nome do rio. `sub_bacia` - Sub-bacia do rio.
`bacia` - Bacia hidrográfica do rio.
>>>>>>> a23ae538c60bbad9fb1ab24d04b8424e76ae4f35

``` r
tabela_reservatorios_ONS()
#> Error in tabela_reservatorios_ONS(): não foi possível encontrar a função "tabela_reservatorios_ONS"
```

### A função `info_reservatoriosBR()`

Essa função retorna uma tabela com informações das funções utilizadas
nesse pacote.

As variáveis retornadas são:

-   `Função` - O nome da função.
-   `Ação` - O objetivo da função a ser utilizada.
-   `Nível de detalhamento` - Subsistemas, Reservatórios ou Datasets.
-   `Dados disponíveis` - Informações sobre a disponibilidade dos dados.
-   `Fonte` - A fonte dos dados buscados.

<!-- -->

<<<<<<< HEAD
    #> Error in info_reservatoriosBR(): não foi possível encontrar a função "info_reservatoriosBR"
=======
    #> Error in info_reservatoriosBR() %>% kable(): não foi possível encontrar a função "%>%"
>>>>>>> a23ae538c60bbad9fb1ab24d04b8424e76ae4f35

## As funções de busca de dados

### A função `reservatorio_sin()`

Utilize a função para obter os dados históricos dos principais
reservatórios brasileiros que pertencem ao [SIN - Sistema Interligado
Nacional](https://www.ana.gov.br/sar/sin). A imagem abaixo apresenta as
bacias dos reservatórios contidos no SIN.

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/modelo-principal-mapa-sin.png" width="100%" style="display: block; margin: auto;" />

`reservatorio_sin(codigo_reservatorio, data_inicial, data_final)`

-   `codigo_reservatorio` O código do reservatório de acordo com o SIN
    (você pode consultar a tabela com os códigos chamando
    `tabela_reservatorios`).
-   `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
-   `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_sin(codigo_reservatorio)`

``` r
reservatorio_sin(19058, "2000-01-01", "2019-12-31")
#> Error in reservatorio_sin(19058, "2000-01-01", "2019-12-31"): não foi possível encontrar a função "reservatorio_sin"
```

As variáveis retornadas são:

-   `data_medicao` - Data da medição realizada
-   `codigo_reservatorio` - Código do reservatório segundo o SAR-ANA
-   `reservatorio` - Nome do reservatório
-   `cota_m` - Cota, o nível do reservatório (m)
-   `afluencia_m3_s` - Afluência (m³/s)
-   `defluencia_m3_s` - Defluência (m³/s)
-   `vazao_vertida_m3_s` - Vazão vertida (m³/s)
-   `vazao_turbinada_m3_s` - Vazão turbinada (m³/s)
-   `vazao_natural_m3_s` - Vazão natural (m³/s)
-   `volume_util_percentual` - Volume útil (%) - Alguns reservatórios
    retornam apenas NA
-   `vazao_incremental_m3_s` - Vazão incremental (m³/s) - Retorna apenas
    NA

As unidades de medida foram mantidas no nome das variáveis para não
haver problemas de interpretação.

Podemos utilizar estes dados históricos para fazer análises e gráficos.
A Afluência(m³/s), por exemplo, mede a quantidade de água que chega nas
represas.

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/plot1.png" width="100%" style="display: block; margin: auto;" />

### A função `reservatorio_cantareira()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros que pertencem ao [**sistema
Cantareira**](https://www.ana.gov.br/sar/outros-sistemas-hidricos/cantareira).
A imagem abaixo apresenta as bacias dos reservatórios contidos no
Sistema Cantareira.

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/outros-sistemas-hidricos-cantareira-principal.png" width="100%" style="display: block; margin: auto;" />

`reservatorio_cantareira(codigo_reservatorio, data_inicial, data_final)`

-   `codigo_reservatorio` O código do reservatório de acordo com o SAR
    (são apenas 4 reservatórios).

| Reservatorio    | Codigo |
|:----------------|-------:|
| Jaguari-Jacareí |  29001 |
| Cachoeira       |  29002 |
| Atibainha       |  29003 |
| Paiva Castro    |  29004 |

-   `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
-   `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_cantareira(codigo_reservatorio)`

As variáveis retornadas são:

-   `data_medicao` - Data da medição realizada
-   `codigo_reservatorio` - Código do reservatório segundo o SAR-ANA
-   `reservatorio` - Nome do reservatório
-   `cota_m` - Cota, o nível do reservatório (m)
-   `volume_util_hm3` - Volume útil (hm³)
-   `volume_util_percentual` - Volume útil (%)
-   `afluencia_m3_s` - Afluência (m³/s)
-   `defluencia_m3_s` - Defluência (m³/s)

### A função `reservatorio_nordeste_semiarido()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros que pertencem ao módulo [**Nordeste e
Semiárido**](https://www.ana.gov.br/sar/nordeste-e-semiarido) do SAR. A
imagem abaixo apresenta os estados dos reservatórios contidos no SAR.

-   `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
-   `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_nordeste_semiarido(codigo_reservatorio)`

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/mapa-principal-ns.png" width="100%" style="display: block; margin: auto;" />

### A função `ultima_medicao()`

Essa função retorna a última medição (e somente ela) dos dados de um
reservatório.

Fiz essa função pois ela fornece o **Volume útil** de alguns
reservatórios que não estão inclusos no dataset criado pela função
`dados_reservatorio()`, como é o exemplo de **Itaipu**.

`ultima_medicao(codigo_reservatorio)`

As variáveis retornadas são:

-   `data_medicao` - Data da medição realizada
-   `reservatorio` - Nome do reservatório
-   `afluencia_m3_s` - Afluência (m³/s)
-   `defluencia_m3_s` - Defluência (m³/s)
-   `cota_m` - Cota, o nível do reservatório (m)
-   `vazao_transferida` - Vazão transferida - Acho que sempre retorna
    `NA`
-   `volume_util_porcentagem` - Volume útil (%)
-   `tipo` - Tipo? Ainda preciso descobrir o que isso significa

## As funções `ONS` - Operador Nacional do Sistema Elétrico

### A função `ONS_reservatorios()`

Essa função busca os **dados atuais** dos reservatórios brasileiros
observados pelo [**Operador Nacional do Sistema Elétrico
(ONS)**](http://www.ons.org.br/paginas/energia-agora/reservatorios) e
pode retornar valores em 2 formatos:

-   Tabela

Gera um dataframe com diversas variáveis de 39 reservatórios observados
pela ONS.

``` r
ONS_reservatorios(formato = "tabela")
#> Error in ONS_reservatorios(formato = "tabela"): não foi possível encontrar a função "ONS_reservatorios"
```

-   Resumo

Gera um relatório dos 4 subsistemas da ONS e o percentual atual em cada
um.

``` r
ONS_reservatorios(formato = "resumo")
#> Error in ONS_reservatorios(formato = "resumo"): não foi possível encontrar a função "ONS_reservatorios"
```

### A função `ONS_EAR_subsistemas()`

Essa função tem como objetivo buscar a **série histórica** da Energia
Armazenada (EAR) dos subsistemas observados pela ONS.

`ONS_EAR_subsistemas(ano_inicial, ano_final)`

-   `ano_inicial` O ano inicial dos registros. O padrão é o início da
    série histórica, `ano_inicial = 2000`
-   `ano_final` O ano final dos registros. O padrão é o ano atual, no
    caso, `ano_final = 2021`

Dessa forma, rodando a função `ONS_EAR_subsistemas()` retorna todos os
dados de todos os subsistemas de 2000 até o ano atual.

As variáveis retornadas são:

-   `data_medicao` - Data da medição realizada
-   `subsistema` - Nome do subsistema
-   `ear_max_subsistema_mwmes` - Valor de EAR máxima por subsistema na
    unidade de medida MWmês
-   `ear_verif_subsistema_mwmes` - Valor de EAR verificada no dia por
    subsistema na unidade de medida MWmês
-   `ear_verif_subsistema_percentual` - Valor de EAR verificada no dia
    por subsistema na unidade de medida %

Esses valores são utilizados como referência para o nível dos
reservatórios e quanta energia eles ainda podem produzir.

Com esses dados, podemos observar os resultados da seca nos
reservatórios do subsistema Sudeste / Centro-oeste, por exemplo:

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/plot2.png" width="100%" style="display: block; margin: auto;" />

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5496237.svg)](https://doi.org/10.5281/zenodo.5496237)

## To-do

-   Buscar outras bases de dados de reservatórios brasileiros

-   Confirmar a confiabilidade dos dados extraídos

## Melhorias e sugestões

Tem alguma ideia para o pacote ou sugestão de como posso melhorá-lo?
Crie uma nova
[issue](https://github.com/brunomioto/reservatoriosBR/issues) para que
eu possa ajudar!
