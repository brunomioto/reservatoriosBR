
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

**Agradeço ao pessoal da ANA, em especial, o coordenador Antônio
Augusto, o especialista Diego Pena e o técnico Théo Albuquerque, que
construíram essa tabela e apoiam essa iniciativa de dados abertos!**

``` r
library(reservatoriosBR)

tabela_reservatorios() 
#> # A tibble: 804 x 12
#>    sistema            codigo reservatorio  res_latitude res_longitude municipio 
#>    <chr>               <int> <chr>                <dbl>         <dbl> <chr>     
#>  1 nordeste_semiarido  12001 25 DE MARÇO          -6.11         -38.2 PAU DOS F~
#>  2 nordeste_semiarido  12002 ABÓBORAS             -8.09         -39.4 PARNAMIRIM
#>  3 nordeste_semiarido  12003 ACARAPE DO M~        -4.19         -38.8 REDENÇÃO  
#>  4 nordeste_semiarido  12004 ACARAÚ MIRIM         -3.51         -40.3 MASSAPÊ   
#>  5 nordeste_semiarido  12005 ACAUÃ                -7.44         -35.6 ITATUBA   
#>  6 nordeste_semiarido  12006 ADAUTO BEZER~        -6.04         -38.4 PEREIRO   
#>  7 nordeste_semiarido  12007 ADUSTINA            -10.6          -38.1 ADUSTINA  
#>  8 nordeste_semiarido  12008 ÁGUA FRIA II        -14.9          -40.6 BARRA DO ~
#>  9 nordeste_semiarido  12009 AIPIM               -10.6          -40.3 ANTONIO G~
#> 10 nordeste_semiarido  12010 ALAGADIÇO           -10.5          -37.6 FREI PAULO
#> # ... with 794 more rows, and 6 more variables: codigo_municipio_ibge <int>,
#> #   estado_nome <chr>, estado_sigla <chr>, rio <chr>, sub_bacia <chr>,
#> #   bacia <chr>

#caso queira uma lista sem códigos duplicados
#library(dplyr)
#tabela_reservatorios() %>% 
#  distinct(codigo, .keep_all = TRUE) 
```

Mapa dos reservatórios brasileiros!

``` r
library(tidyverse)

tabela_reservatorios() %>% 
  distinct(codigo, .keep_all = TRUE) %>% 
  ggplot()+
  borders("world", fill = "grey70", colour = "black")+
  theme_minimal()+
  geom_point(aes(x=res_longitude, y=res_latitude),
             colour = "blue",
             size = 2,
             alpha = 0.5) + 
  labs(x = "",
       y = "")+
  coord_fixed(xlim= c(-73,-35), ylim=c(-35,5))
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

### A função `tabela_reservatorios_ONS()`

Essa função retorna uma tabela parecida com a `tabela_reservatorios()`,
mas contendo apenas os reservatórios observados pela **ONS**.

São **39 reservatórios** com **12 variáveis**, sendo elas:

-   `subsistema` - Subsistema-ONS a qual o reservatório pertence.
-   `reservatorio` - O nome do reservatório
-   `codigo` - **O código do reservatório segundo o SAR. Utilizado nas
    funções desse pacote.**
-   `res_latitude` - Latitude do reservatório
-   `res_longitude` - Longitude do reservatório
-   `municipio` - Município do reservatório
-   `codigo_municipio_ibge` - Código do município na base do IBGE.
-   `estado_nome` - Estado em forma de nome.
-   `estado_sigla` - Estado em forma de sigla.
-   `rio` - Nome do rio.
-   `sub_bacia` - Sub-bacia do rio.
-   `bacia` - Bacia hidrográfica do rio.

``` r
tabela_reservatorios_ONS()
#> # A tibble: 39 x 12
#>    subsistema      reservatorio  codigo res_latitude res_longitude municipio    
#>    <chr>           <chr>          <int>        <dbl>         <dbl> <chr>        
#>  1 Nordeste        IRAPE          19115       -16.7          -42.6 GRÃO MOGOL   
#>  2 Nordeste        SOBRADINHO     19121        -9.42         -40.8 CASA NOVA    
#>  3 Nordeste        TRÊS MARIAS    19119       -18.2          -45.3 TRÊS MARIAS  
#>  4 Nordeste        LUIZ GONZAGA   19122        -9.15         -38.3 JATOBÁ       
#>  5 Norte           BALBINA        19141        -1.92         -59.5 PRESIDENTE F~
#>  6 Norte           SERRA DA MESA  19128       -13.8          -48.3 MINAÇU       
#>  7 Norte           TUCURUI        19134        -3.75         -49.7 TUCURUÍ      
#>  8 Sudeste / Cent~ A. VERMELHA    19015       -19.9          -50.4 ITURAMA      
#>  9 Sudeste / Cent~ FURNAS         19004       -20.7          -46.3 ALPINÓPOLIS  
#> 10 Sudeste / Cent~ M. MORAES      19005       -20.3          -47.1 SACRAMENTO   
#> # ... with 29 more rows, and 6 more variables: codigo_municipio_ibge <int>,
#> #   estado_nome <chr>, estado_sigla <chr>, rio <chr>, sub_bacia <chr>,
#> #   bacia <chr>
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

| Função                            | Ação                                                         | Nível.de.detalhamento | Dados.disponíveis | Fonte   |
|:----------------------------------|:-------------------------------------------------------------|:----------------------|:------------------|:--------|
| ONS_EAR_subsistemas()             | Dados históricos da EAR de subsistemas                       | Subsistemas           | A partir de 2000  | ONS     |
| ONS_reservatorios()               | Dados atuais da EAR dos reservatórios segundo a ONS          | Reservatórios         | Última data       | ONS     |
| reservatorio_sin()                | Dados históricos de reservatórios do SIN                     | Reservatórios         | \-                | SAR-ANA |
| reservatorio_cantareira()         | Dados históricos de reservatórios do Sist. Cantareira        | Reservatórios         | A partir de 2000  | SAR-ANA |
| reservatorio_nordeste_semiarido() | Dados históricos de reservatórios do Mód. Nordeste-Semiárido | Reservatórios         | \-                | SAR-ANA |
| ultima_medicao()                  | Dados atuais dos reservatórios segundo o SAR                 | Reservatórios         | Última data       | SAR-ANA |
| tabela_reservatorios()            | Dataset dos reservatórios do SAR disponíveis para busca      | Reservatórios         | Dataset           | SAR-ANA |
| tabela_reservatorios_ONS()        | Dataset dos reservatórios da ONS disponíveis para busca      | Reservatórios         | Dataset           | ONS     |
| info_reservatoriosBR()            | Lista todas as funções do pacote reservatoriosBR             | \-                    | \-                | \-      |

## As funções de busca de dados

### A função `reservatorio_sin()`

Utilize a função para obter os dados históricos dos principais
reservatórios brasileiros que pertencem ao [SIN - Sistema Interligado
Nacional](https://www.ana.gov.br/sar/sin). A imagem abaixo apresenta as
bacias dos reservatórios contidos no SIN.

<img src="https://raw.githubusercontent.com/brunomioto/reservatoriosBR/main/man/figures/modelo-principal-mapa-sin.png" width="100%" style="display: block; margin: auto;" />

`reservatorio_sin(codigo_reservatorio, data_inicial, data_final)`

-   `codigo_reservatorio` O código do reservatório de acordo com o SIN
    (você pode consultar a tabela com os códigos chamando a função
    `tabela_reservatorios()`).
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
#> # A tibble: 7,306 x 11
#>    data       codigo_reservatorio reservatorio cota_m afluencia_m3_s
#>    <date>     <fct>               <fct>         <dbl>          <dbl>
#>  1 2000-01-01 19058               ITAIPU         216.           9761
#>  2 2000-01-02 19058               ITAIPU         216.           9300
#>  3 2000-01-03 19058               ITAIPU         216.           9385
#>  4 2000-01-04 19058               ITAIPU         216.           9450
#>  5 2000-01-05 19058               ITAIPU         216.           8868
#>  6 2000-01-06 19058               ITAIPU         216.           8275
#>  7 2000-01-07 19058               ITAIPU         215.           7963
#>  8 2000-01-08 19058               ITAIPU         215.           8367
#>  9 2000-01-09 19058               ITAIPU         215.           9408
#> 10 2000-01-10 19058               ITAIPU         215.           8706
#> # ... with 7,296 more rows, and 6 more variables: defluencia_m3_s <dbl>,
#> #   vazao_vertida_m3_s <dbl>, vazao_turbinada_m3_s <dbl>,
#> #   vazao_natural_m3_s <dbl>, volume_util_percentual <dbl>,
#> #   vazao_incremental_m3_s <dbl>
```

As variáveis retornadas são:

-   `data` - Data da medição realizada
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

-   `data` - Data da medição realizada
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
`reservatorio_sin()`, como é o exemplo de **Itaipu**.

`ultima_medicao(codigo_reservatorio)`

As variáveis retornadas são:

-   `data` - Data da medição realizada
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
#> # A tibble: 39 x 19
#>    data       subsistema bacia  reservatorio  reservatorio_max reservatorio_ear~
#>    <date>     <fct>      <fct>  <chr>                    <dbl>             <dbl>
#>  1 2021-11-01 Norte      AMAZO~ BALBINA                   776.              477.
#>  2 2021-11-01 Norte      TOCAN~ TUCURUI                  7686.             3916.
#>  3 2021-11-01 Norte      TOCAN~ SERRA DA MESA            6530.             7238.
#>  4 2021-11-01 Nordeste   JEQUI~ IRAPE                    1006.              361.
#>  5 2021-11-01 Nordeste   SAO F~ ITAPARICA                3415.             2812.
#>  6 2021-11-01 Nordeste   SAO F~ SOBRADINHO              30048.             9808.
#>  7 2021-11-01 Nordeste   SAO F~ TRÊS MARIAS             16013               674.
#>  8 2021-11-01 Sul        CAPIV~ G. P. SOUZA               377.              137.
#>  9 2021-11-01 Sul        IGUACU SANTA CLARA-~             378.              322.
#> 10 2021-11-01 Sul        IGUACU G. B. MUNHOZ             5934.             3222.
#> # ... with 29 more rows, and 13 more variables:
#> #   reservatorio_ear_verificada_porcentagem <dbl>,
#> #   reservatorio_valor_util <dbl>, reservatorio_porcentagem <dbl>,
#> #   bacia_max <dbl>, bacia_ear_verificada_mw_mes <dbl>,
#> #   bacia_ear_verificada_porcentagem <dbl>, bacia_porcentagem <dbl>,
#> #   subsistema_max <dbl>, subsistema_ear_verificada_mw_mes <dbl>,
#> #   subsistema_valor_util <dbl>, sin_max <dbl>, ...
```

-   Resumo

Gera um relatório dos 4 subsistemas da ONS e o percentual atual em cada
um.

``` r
ONS_reservatorios(formato = "resumo")
#> # A tibble: 4 x 3
#>   data       subsistema             percentual
#>   <date>     <chr>                       <dbl>
#> 1 2021-11-01 Nordeste                     36.4
#> 2 2021-11-01 Norte                        46.1
#> 3 2021-11-01 Sudeste / Centro-Oeste       18.4
#> 4 2021-11-01 Sul                          52.5
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

-   `data` - Data da medição realizada
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
