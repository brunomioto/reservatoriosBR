
# **reservatoriosBR** <img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/>

<!-- badges: start -->

[![pix](https://img.shields.io/badge/Apoie%20com-PIX-brightgreen)](https://www.brunomioto.com.br/pix)
[![License](https://img.shields.io/badge/license-GPL-blueviolet.svg?style=flat)](https://github.com/brunomioto/reservatoriosBR/blob/main/LICENSE.md)
[![Twitter
Follow](https://img.shields.io/twitter/follow/BrunoHMioto?color=%2315202B&label=Seguir%20%40BrunoHMioto&style=social)](https://twitter.com/BrunoHMioto)

<!-- badges: end -->

Pacote R para obtenção de dados dos principais reservatórios brasileiros
a partir da plataforma **[SAR-ANA](https://www.ana.gov.br/sar/)** e da
**[ONS](http://www.ons.org.br/paginas/energia-agora/reservatorios)**.

Este pacote baixa e organiza os dados em uma estrutura para uso no R.

Atualmente estou buscando **voluntários** para testar as funções e
dados. Se puder, [entre em contato](https://twitter.com/BrunoHMioto)\!

Se utilizar em algum trabalho, cite ou me avise\! Gostaria de saber como
este pacote pode ajudar\!

Se você estiver procurando dados sobre os mananciais de abastecimento
público na Região Metropolitana de São Paulo (SP - Brasil), o pacote
[`mananciais`](https://beatrizmilz.github.io/mananciais/) foi feito para
isso\!

## Instalação

Este pacote apenas está disponível para a instalação usando o devtools
no R (mas é simples):

``` r
#install.packages("devtools")
devtools::install_github('brunomioto/reservatoriosBR@v1.0')
library(reservatoriosBR)
```

## Uso

Atualmente o pacote possui **9** funções:

### Funções de busca de dados

  - `reservatorio_sin()`
  - `reservatorio_cantareira()`
  - `reservatorio_nordeste_semiarido()`
  - `ultima_medicao()`
  - `ONS_reservatorios()`
  - `ONS_EAR_subsistemas()`

### Funções de datasets

  - `tabela_reservatorios()`
  - `tabela_reservatorios_ONS()`
  - `info_reservatoriosBR()`

-----

### A função `reservatorio_sin()`

Utilize a função para obter os dados históricos dos principais
reservatórios brasileiros que pertencem ao [SIN - Sistema Interligado
Nacional](https://www.ana.gov.br/sar/sin). A imagem abaixo apresenta as
bacias dos reservatórios contidos no SIN.

<img src="https://github.com/brunomioto/reservatoriosBR/blob/main/man/figures/modelo-principal-mapa-sin.png" width="100%" style="display: block; margin: auto;" />

`reservatorio_sin(codigo_reservatorio, data_inicial, data_final)`

  - `codigo_reservatorio` O código do reservatório de acordo com o SIN
    (você pode consultar a tabela com os códigos chamando
    `tabela_reservatorios`).
  - `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
  - `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_sin(codigo_reservatorio)`

``` r
reservatorio_sin(19058, "2000-01-01", "2019-12-31")
#> # A tibble: 7,306 x 11
#>    data_medicao codigo_reservat~ reservatorio cota_m afluencia_m3_s
#>    <date>       <fct>            <fct>         <dbl>          <dbl>
#>  1 2000-01-01   19058            ITAIPU         216.           9761
#>  2 2000-01-02   19058            ITAIPU         216.           9300
#>  3 2000-01-03   19058            ITAIPU         216.           9385
#>  4 2000-01-04   19058            ITAIPU         216.           9450
#>  5 2000-01-05   19058            ITAIPU         216.           8868
#>  6 2000-01-06   19058            ITAIPU         216.           8275
#>  7 2000-01-07   19058            ITAIPU         215.           7963
#>  8 2000-01-08   19058            ITAIPU         215.           8367
#>  9 2000-01-09   19058            ITAIPU         215.           9408
#> 10 2000-01-10   19058            ITAIPU         215.           8706
#> # ... with 7,296 more rows, and 6 more variables: defluencia_m3_s <dbl>,
#> #   vazao_vertida_m3_s <dbl>, vazao_turbinada_m3_s <dbl>,
#> #   vazao_natural_m3_s <dbl>, volume_util_percentual <dbl>,
#> #   vazao_incremental_m3_s <dbl>
```

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `codigo_reservatorio` - Código do reservatório segundo o SAR-ANA
  - `reservatorio` - Nome do reservatório
  - `cota_m` - Cota, o nível do reservatório (m)
  - `afluencia_m3_s` - Afluência (m³/s)
  - `defluencia_m3_s` - Defluência (m³/s)
  - `vazao_vertida_m3_s` - Vazão vertida (m³/s)
  - `vazao_turbinada_m3_s` - Vazão turbinada (m³/s)
  - `vazao_natural_m3_s` - Vazão natural (m³/s)
  - `volume_util_percentual` - Volume útil (%) - Alguns reservatórios
    retornam apenas NA
  - `vazao_incremental_m3_s` - Vazão incremental (m³/s) - Retorna apenas
    NA

As unidades de medida foram mantidas no nome das variáveis para não
haver problemas de interpretação.

Podemos utilizar estes dados históricos para fazer análises e gráficos.
A Afluência(m³/s), por exemplo, mede a quantidade de água que chega nas
represas.

<img src="https://github.com/brunomioto/reservatoriosBR/blob/main/man/figures/plot1.png" width="100%" style="display: block; margin: auto;" />

### A função `reservatorio_cantareira()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros que pertencem ao [**sistema
Cantareira**](https://www.ana.gov.br/sar/outros-sistemas-hidricos/cantareira).
A imagem abaixo apresenta as bacias dos reservatórios contidos no
Sistema Cantareira.

<img src="https://github.com/brunomioto/reservatoriosBR/blob/main/man/figures/outros-sistemas-hidricos-cantareira-principal.png" width="100%" style="display: block; margin: auto;" />

`reservatorio_cantareira(codigo_reservatorio, data_inicial, data_final)`

  - `codigo_reservatorio` O código do reservatório de acordo com o SAR
    (são apenas 4 reservatórios).

| Reservatorio    | Codigo |
| :-------------- | -----: |
| Jaguari-Jacareí |  29001 |
| Cachoeira       |  29002 |
| Atibainha       |  29003 |
| Paiva Castro    |  29004 |

  - `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
  - `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_cantareira(codigo_reservatorio)`

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `codigo_reservatorio` - Código do reservatório segundo o SAR-ANA
  - `reservatorio` - Nome do reservatório
  - `cota_m` - Cota, o nível do reservatório (m)
  - `volume_util_hm3` - Volume útil (hm³)
  - `volume_util_percentual` - Volume útil (%)
  - `afluencia_m3_s` - Afluência (m³/s)
  - `defluencia_m3_s` - Defluência (m³/s)

### A função `reservatorio_nordeste_semiarido()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros que pertencem ao módulo [**Nordeste e
Semiárido**](https://www.ana.gov.br/sar/nordeste-e-semiarido) do SAR. A
imagem abaixo apresenta os estados dos reservatórios contidos no SAR.

  - `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga. O padrão é
    `data_inicial = "1980-01-01"`
  - `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente. O padrão é
    `data_final = Sys.Date()`

Dessa forma, a função funciona utilizando apenas:
`reservatorio_nordeste_semiarido(codigo_reservatorio)`

<img src="https://github.com/brunomioto/reservatoriosBR/blob/main/man/figures/mapa-principal-ns.png" width="100%" style="display: block; margin: auto;" />

### A função `ultima_medicao()`

Essa função retorna a última medição (e somente ela) dos dados de um
reservatório.

Fiz essa função pois ela fornece o **Volume útil** de alguns
reservatórios que não estão inclusos no dataset criado pela função
`dados_reservatorio()`, como é o exemplo de **Itaipu**.

`ultima_medicao(codigo_reservatorio)`

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `reservatorio` - Nome do reservatório
  - `afluencia_m3_s` - Afluência (m³/s)
  - `defluencia_m3_s` - Defluência (m³/s)
  - `cota_m` - Cota, o nível do reservatório (m)
  - `vazao_transferida` - Vazão transferida - Acho que sempre retorna
    `NA`
  - `volume_util_porcentagem` - Volume útil (%)
  - `tipo` - Tipo? Ainda preciso descobrir o que isso significa

## As funções `ONS` - Operador Nacional do Sistema Elétrico

### A função `ONS_reservatorios()`

Essa função busca os **dados atuais** dos reservatórios brasileiros
observados pelo [**Operador Nacional do Sistema Elétrico
(ONS)**](http://www.ons.org.br/paginas/energia-agora/reservatorios) e
pode retornar valores em 2 formatos:

  - Tabela

Gera um dataframe com diversas variáveis de 39 reservatórios observados
pela ONS.

``` r
ONS_reservatorios(formato = "tabela")
#> # A tibble: 39 x 19
#>    data_medicao subsistema bacia reservatorio reservatorio_max reservatorio_ea~
#>    <date>       <fct>      <fct> <chr>                   <dbl>            <dbl>
#>  1 2021-09-06   Norte      AMAZ~ BALBINA                  776.            652. 
#>  2 2021-09-06   Norte      TOCA~ TUCURUI                 7686.           6521. 
#>  3 2021-09-06   Norte      TOCA~ SERRA DA ME~            6530.           8769. 
#>  4 2021-09-06   Nordeste   JEQU~ IRAPE                   1006.            564. 
#>  5 2021-09-06   Nordeste   SAO ~ ITAPARICA               3415.           2375. 
#>  6 2021-09-06   Nordeste   SAO ~ SOBRADINHO             30048.          13862. 
#>  7 2021-09-06   Nordeste   SAO ~ TRÊS MARIAS            16013             967. 
#>  8 2021-09-06   Sul        CAPI~ G. P. SOUZA              377.             89.3
#>  9 2021-09-06   Sul        IGUA~ SALTO SANTI~            3403.           1080. 
#> 10 2021-09-06   Sul        IGUA~ SANTA CLARA~             378.             85.7
#> # ... with 29 more rows, and 13 more variables:
#> #   reservatorio_ear_verificada_porcentagem <dbl>,
#> #   reservatorio_valor_util <dbl>, reservatorio_porcentagem <dbl>,
#> #   bacia_max <dbl>, bacia_ear_verificada_mw_mes <dbl>,
#> #   bacia_ear_verificada_porcentagem <dbl>, bacia_porcentagem <dbl>,
#> #   subsistema_max <dbl>, subsistema_ear_verificada_mw_mes <dbl>,
#> #   subsistema_valor_util <dbl>, sin_max <dbl>, sinear_verificada_mw_mes <dbl>,
#> #   sinear_porcentagem <dbl>
```

  - Resumo

Gera um relatório dos 4 subsistemas da ONS e o percentual atual em cada
um.

``` r
ONS_reservatorios(formato = "resumo")
#> # A tibble: 4 x 3
#>   data_medicao subsistema             percentual
#>   <date>       <chr>                       <dbl>
#> 1 2021-09-06   Nordeste                     47.9
#> 2 2021-09-06   Norte                        68.8
#> 3 2021-09-06   Sudeste / Centro-Oeste       20.1
#> 4 2021-09-06   Sul                          25.9
```

### A função `ONS_EAR_subsistemas()`

Essa função tem como objetivo buscar a **série histórica** da Energia
Armazenada (EAR) dos subsistemas observados pela ONS.

`ONS_EAR_subsistemas(ano_inicial, ano_final)`

  - `ano_inicial` O ano inicial dos registros. O padrão é o início da
    série histórica, `ano_inicial = 2000`
  - `ano_final` O ano final dos registros. O padrão é o ano atual, no
    caso, `ano_final = 2021`

Dessa forma, rodando a função `ONS_EAR_subsistemas()` retorna todos os
dados de todos os subsistemas de 2000 até o ano atual.

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `subsistema` - Nome do subsistema
  - `ear_max_subsistema_mwmes` - Valor de EAR máxima por subsistema na
    unidade de medida MWmês
  - `ear_verif_subsistema_mwmes` - Valor de EAR verificada no dia por
    subsistema na unidade de medida MWmês
  - `ear_verif_subsistema_percentual` - Valor de EAR verificada no dia
    por subsistema na unidade de medida %

Esses valores são utilizados como referência para o nível dos
reservatórios e quanta energia eles ainda podem produzir.

Com esses dados, podemos observar os resultados da seca nos
reservatórios do subsistema Sudeste / Centro-oeste, por exemplo:

<img src="https://github.com/brunomioto/reservatoriosBR/blob/main/man/figures/plot2.png" width="100%" style="display: block; margin: auto;" />

## As funções de datasets

### A função `tabela_reservatorios()`

Essa função retorna uma tabela com informações sobre os reservatórios
que podem ser utilizadas com as funções acima.

São **708 reservatórios** com **5 variáveis**, sendo elas:

  - `sistema` - Sistema o qual o reservatório pertence.
  - `codigo` - **O código do reservatório segundo o SAR. Utilizado nas
    funções desse pacote.**
  - `reservatorio` - O nome do reservatório.
  - `bacia` - A bacia a qual o reservatório pertence (se disponível).
  - `rio` - O rio o qual o reservatório pertence (se disponível).
  - `estado_1` - Estado o qual o reservatório pertence.
  - `estado_2` - Se o reservatório fica entre dois estados, o segundo
    estado. A ordem não tem importância.
  - `ano` - Ano de funcionamento do reservatório (se disponível).

<!-- end list -->

``` r
tabela_reservatorios() %>% 
  head()
#> # A tibble: 6 x 8
#>   sistema            codigo reservatorio    bacia rio   estado_1 estado_2   ano
#>   <fct>               <int> <fct>           <fct> <lgl> <fct>    <fct>    <int>
#> 1 nordeste_semiarido  12001 25 DE MARÇO     <NA>  NA    RN       <NA>        NA
#> 2 nordeste_semiarido  12002 ABÓBORAS        <NA>  NA    PE       <NA>        NA
#> 3 nordeste_semiarido  12003 ACARAPE DO MEIO <NA>  NA    CE       <NA>        NA
#> 4 nordeste_semiarido  12004 ACARAÚ MIRIM    <NA>  NA    CE       <NA>      1907
#> 5 nordeste_semiarido  12005 ACAUÃ           <NA>  NA    PB       <NA>        NA
#> 6 nordeste_semiarido  12006 ADAUTO BEZERRA  <NA>  NA    CE       <NA>        NA
```

### A função `tabela_reservatorios_ONS()`

Essa função retorna uma tabela parecida com a `tabela_reservatorios()`,
mas contendo apenas os reservatórios observados pela **ONS**.

São **39 reservatórios** com **6 variáveis**, sendo elas:

  - `subsistema` - Nome do subsistema.
  - `reservatorio` - O nome do reservatório.
  - `codigo` - **O código do reservatório segundo o SAR. Utilizado nas
    funções desse pacote.**
  - `bacia` - A bacia a qual o reservatório pertence
  - `rio` - O rio o qual o reservatório pertence (se disponível).
  - `estado_1` - Estado o qual o reservatório pertence.
  - `estado_2` - Se o reservatório fica entre dois estados, o segundo
    estado. A ordem não tem importância.

<!-- end list -->

``` r
tabela_reservatorios_ONS() %>% 
  head()
#> # A tibble: 6 x 6
#>   subsistema reservatorio           codigo bacia         estado_1 estado_2
#>   <fct>      <fct>                   <int> <fct>         <fct>    <fct>   
#> 1 Nordeste   IRAPE                   19115 JEQUITINHONHA MG       <NA>    
#> 2 Nordeste   SOBRADINHO              19121 SAO FRANCISCO BA       <NA>    
#> 3 Nordeste   TRES MARIAS             19119 SAO FRANCISCO MG       <NA>    
#> 4 Nordeste   LUIZ GONZAGA/ITAPARICA  19122 SAO FRANCISCO BA       PE      
#> 5 Norte      BALBINA                 19141 AMAZONAS      AM       <NA>    
#> 6 Norte      SERRA DA MESA           19128 TOCANTINS     GO       <NA>
```

### A função `info_reservatoriosBR()`

Essa função retorna uma tabela com informações das funções utilizadas
nesse pacote.

As variáveis retornadas são:

  - `Função` - O nome da função.
  - `Ação` - O objetivo da função a ser utilizada.
  - `Nível de detalhamento` - Subsistemas, Reservatórios ou Datasets.
  - `Dados disponíveis` - Informações sobre a disponibilidade dos dados.
  - `Fonte` - A fonte dos dados buscados.

| Função                              | Ação                                                         | Nível.de.detalhamento | Dados.disponíveis | Fonte   |
| :---------------------------------- | :----------------------------------------------------------- | :-------------------- | :---------------- | :------ |
| ONS\_EAR\_subsistemas()             | Dados históricos da EAR de subsistemas                       | Subsistemas           | A partir de 2000  | ONS     |
| ONS\_reservatorios()                | Dados atuais da EAR dos reservatórios segundo a ONS          | Reservatórios         | Última data       | ONS     |
| reservatorio\_sin()                 | Dados históricos de reservatórios do SIN                     | Reservatórios         | \-                | SAR-ANA |
| reservatorio\_cantareira()          | Dados históricos de reservatórios do Sist. Cantareira        | Reservatórios         | A partir de 2000  | SAR-ANA |
| reservatorio\_nordeste\_semiarido() | Dados históricos de reservatórios do Mód. Nordeste-Semiárido | Reservatórios         | \-                | SAR-ANA |
| ultima\_medicao()                   | Dados atuais dos reservatórios segundo o SAR                 | Reservatórios         | Última data       | SAR-ANA |
| tabela\_reservatorios()             | Dataset dos reservatórios do SAR disponíveis para busca      | Reservatórios         | Dataset           | SAR-ANA |
| tabela\_reservatorios\_ONS()        | Dataset dos reservatórios da ONS disponíveis para busca      | Reservatórios         | Dataset           | ONS     |
| info\_reservatoriosBR()             | Lista todas as funções do pacote reservatoriosBR             | \-                    | \-                | \-      |

## To-do

  - Buscar outras bases de dados de reservatórios brasileiros

  - Confirmar a confiabilidade dos dados extraídos

## Melhorias e sugestões

Tem alguma ideia para o pacote ou sugestão de como posso melhorá-lo?
Crie uma nova
[issue](https://github.com/brunomioto/reservatoriosBR/issues) para que
eu possa ajudar\!
