---
output: github_document
---

# **reservatoriosBR** <img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/>

<!-- badges: start -->

[![pix](https://img.shields.io/badge/Apoie%20com-PIX-brightgreen)](https://www.brunomioto.com.br/pix)
[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-stable.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![License](https://img.shields.io/badge/license-GPL-blueviolet.svg?style=flat)](https://github.com/brunomioto/reservatoriosBR/blob/main/LICENSE.md)
[![Twitter Follow](https://img.shields.io/twitter/follow/BrunoHMioto.svg?style=social)](https://twitter.com/BrunoHMioto)

<!-- badges: end -->

Pacote R para obtenção de dados dos principais reservatórios brasileiros a partir da plataforma [SAR-ANA](https://www.ana.gov.br/sar/).

Este pacote baixa e organiza os dados em uma estrutura para uso no R.

Atualmente estou buscando **voluntários** para testar as funções e dados. Se puder, [entre em contato](https://twitter.com/BrunoHMioto)!

Se utilizar em algum trabalho, cite ou me avise! Gostaria de saber como este pacote pode ajudar!

Se você estiver procurando dados sobre os mananciais de abastecimento público na Região Metropolitana de São Paulo (SP - Brasil), o pacote [`mananciais`](https://beatrizmilz.github.io/mananciais/) foi feito para isso!

## Instalação

Este pacote apenas está disponível para a instalação usando o devtools no R (mas é simples): 


```r
#install.packages("devtools")
devtools::install_github('brunomioto/reservatoriosBR@v0.5')
library(reservatoriosBR)
```

## Uso

Atualmente o pacote possui **n** funções:

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

---

### A função `reservatorio_sin()`

Utilize a função para obter os dados históricos dos principais reservatórios brasileiros que pertencem ao [SIN - Sistema Interligado Nacional](https://www.ana.gov.br/sar/sin). A imagem abaixo apresenta as bacias dos reservatórios contidos no SIN.

![Sistema Interligado Nacional](man/figures/modelo-principal-mapa-sin.png)

`reservatorio_sin(codigo_reservatorio, data_inicial, data_final)`

- `codigo_reservatorio` O código do reservatório de acordo com o SIN (você pode consultar a tabela com os códigos chamando `tabela_reservatorios`).
- `data_inicial` Data inicial do registro. Se for anterior à data de funcionamento, retorna a data de registro mais antiga.
- `data_final` Data final do registro. Pode ser usado `Sys.Date()` para retornar a data de registro mais recente.



```r
reservatorio_sin(19058, "2000-01-01", "2019-12-31")
```

```
## # A tibble: 7,306 x 11
##    data_medicao codigo_reservat~ reservatorio cota_m afluencia_m3_s defluencia_m3_s vazao_vertida_m~
##    <date>       <fct>            <fct>         <dbl>          <dbl>           <dbl>            <dbl>
##  1 2000-01-01   19058            ITAIPU         216.           9761            8101                0
##  2 2000-01-02   19058            ITAIPU         216.           9300            8401                0
##  3 2000-01-03   19058            ITAIPU         216.           9385            8870                0
##  4 2000-01-04   19058            ITAIPU         216.           9450           10351                0
##  5 2000-01-05   19058            ITAIPU         216.           8868           10789                0
##  6 2000-01-06   19058            ITAIPU         216.           8275           10815                0
##  7 2000-01-07   19058            ITAIPU         215.           7963            9854                0
##  8 2000-01-08   19058            ITAIPU         215.           8367            8869                0
##  9 2000-01-09   19058            ITAIPU         215.           9408            8279                0
## 10 2000-01-10   19058            ITAIPU         215.           8706            8958                0
## # ... with 7,296 more rows, and 4 more variables: vazao_turbinada_m3_s <dbl>,
## #   vazao_natural_m3_s <dbl>, volume_util_percentual <dbl>, vazao_incremental_m3_s <dbl>
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
- `volume_util_percentual` - Volume útil (%) - Alguns reservatórios retornam apenas NA
- `vazao_incremental_m3_s` - Vazão incremental (m³/s) - Retorna apenas NA

As unidades de medida foram mantidas no nome das variáveis para não haver problemas de interpretação.

Podemos utilizar estes dados históricos para fazer análises e gráficos. A Afluência(m³/s), por exemplo, mede a quantidade de água que chega nas represas.



<img src="man/figures/plot1.png" align="center" width="100%" min-width="120px"/>

### A função `reservatorio_cantareira()`

Utilize a função para obter os dados históricos dos reservatórios brasileiros que pertencem ao [**sistema Cantareira**](https://www.ana.gov.br/sar/outros-sistemas-hidricos/cantareira). A imagem abaixo apresenta as bacias dos reservatórios contidos no Sistema Cantareira.

![Sistema Cantareira](man/figures/outros-sistemas-hidricos-cantareira-principal.png)

`reservatorio_cantareira(codigo_reservatorio, data_inicial, data_final)`

- `codigo_reservatorio` O código do reservatório de acordo com o SAR (são apenas 4 reservatórios).


|Reservatorio    | Codigo|
|:---------------|------:|
|Jaguari-Jacareí |  29001|
|Cachoeira       |  29002|
|Atibainha       |  29003|
|Paiva Castro    |  29004|

- `data_inicial` Data inicial do registro. Se for anterior à data de funcionamento, retorna a data de registro mais antiga.
- `data_final` Data final do registro. Pode ser usado `Sys.Date()` para retornar a data de registro mais recente.

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

Utilize a função para obter os dados históricos dos reservatórios brasileiros que pertencem ao módulo [**Nordeste e Semiárido**](https://www.ana.gov.br/sar/nordeste-e-semiarido) do SAR. A imagem abaixo apresenta os estados dos reservatórios contidos no SAR.

![Sistema Cantareira](man/figures/mapa-principal-ns.png)

### A função `ultima_medicao()`

Essa função retorna a última medição (e somente ela) dos dados de um reservatório.

Fiz essa função pois ela fornece o **Volume útil** de alguns reservatórios que não estão inclusos no dataset criado pela função `dados_reservatorio()`, como é o exemplo de **Itaipu**.

`ultima_medicao(codigo_reservatorio)`

As variáveis retornadas são:

- `data_medicao` - Data da medição realizada
- `reservatorio` - Nome do reservatório
- `afluencia_m3_s` - Afluência (m³/s)
- `defluencia_m3_s` - Defluência (m³/s)
- `cota_m` - Cota, o nível do reservatório (m)
- `vazao_transferida` - Vazão transferida - Acho que sempre retorna `NA`
- `volume_util_porcentagem` - Volume útil (%)
- `tipo` - Tipo? Ainda preciso descobrir o que isso significa

## As funções `ONS` - Operador Nacional do Sistema Elétrico

### A função `ONS_reservatorios()`

Essa função busca os dados dos reservatórios brasileiros observados pelo [**Operador Nacional do Sistema Elétrico (ONS)**](http://www.ons.org.br/paginas/energia-agora/reservatorios) e pode retornar valores em 2 formatos:

- Tabela

Gera um dataframe com diversas variáveis de 39 reservatórios observados pela ONS.


```r
ONS_reservatorios(formato = "tabela")
```

```
## # A tibble: 39 x 19
##    data_medicao subsistema bacia reservatorio reservatorio_max reservatorio_ea~ reservatorio_ea~
##    <date>       <fct>      <fct> <chr>                   <dbl>            <dbl>            <dbl>
##  1 2021-09-05   Norte      AMAZ~ BALBINA                  776.            655.              84.4
##  2 2021-09-05   Norte      TOCA~ TUCURUI                 7686.           6533.              85.0
##  3 2021-09-05   Norte      TOCA~ SERRA DA ME~            6530.           8830.              25.4
##  4 2021-09-05   Nordeste   JEQU~ IRAPE                   1006.            565.              28.5
##  5 2021-09-05   Nordeste   SAO ~ ITAPARICA               3415.           2381.              69.7
##  6 2021-09-05   Nordeste   SAO ~ SOBRADINHO             30048.          13946.              46.4
##  7 2021-09-05   Nordeste   SAO ~ TRÊS MARIAS            16013             974.              41.5
##  8 2021-09-05   Sul        CAPI~ G. P. SOUZA              377.             88.8             23.6
##  9 2021-09-05   Sul        IGUA~ SALTO SANTI~            3403.           1095.              32.2
## 10 2021-09-05   Sul        IGUA~ SANTA CLARA~             378.             83.7             22.1
## # ... with 29 more rows, and 12 more variables: reservatorio_valor_util <dbl>,
## #   reservatorio_porcentagem <dbl>, bacia_max <dbl>, bacia_ear_verificada_mw_mes <dbl>,
## #   bacia_ear_verificada_porcentagem <dbl>, bacia_porcentagem <dbl>, subsistema_max <dbl>,
## #   subsistema_ear_verificada_mw_mes <dbl>, subsistema_valor_util <dbl>, sin_max <dbl>,
## #   sinear_verificada_mw_mes <dbl>, sinear_porcentagem <dbl>
```

- Resumo

Gera um relatório dos 4 subsistemas da ONS e a porcentagem atual em cada um.


```r
ONS_reservatorios(formato = "resumo")
```

```
## # A tibble: 4 x 3
##   data_medicao subsistema             percentual
##   <date>       <chr>                       <dbl>
## 1 2021-09-05   Nordeste                     48.2
## 2 2021-09-05   Norte                        69.1
## 3 2021-09-05   Sudeste / Centro-Oeste       20.4
## 4 2021-09-05   Sul                          26.2
```

### A função `ONS_EAR_subsistemas()`

Essa função tem como objetivo buscar a série histórica da Energia Armazenada (EAR) dos subsistemas observados pela ONS.

Esses valores são utilizados como referência para o nível dos reservatórios e quanta energia eles ainda podem produzir.

Com esses dados, podemos observar os resultados da seca nos reservatórios do subsistema Sudeste / Centro-oeste, por exemplo



<img src=".figures/plot2.png" align="center" width="100%" min-width="120px"/>

### O dataset `tabela_reservatorios`

Esse dataset já vem pré-carregado com o pacote! Nele estão algumas informações sobre os reservatórios que podem ser carregados com as funções acima.

São 708 reservatórios com 5 variáveis, sendo elas:

- `sistema` - Sistema o qual o reservatório pertence.
- `estado_1` - Estado o qual o reservatório pertence.
- `estado_2` - Se o reservatório fica entre dois estados, o segundo estado. A ordem não tem importância.
- `reservatorio` - O nome do reservatório.
- `codigo` - O código do reservatório segundo o SAR. Utilizado nas funções desse pacote.


```r
tabela_exemplo <- tabela_reservatorios()

tabela_exemplo %>% 
  head()
```

```
## # A tibble: 6 x 8
##   sistema            codigo reservatorio    bacia rio   estado_1 estado_2   ano
##   <fct>               <int> <fct>           <fct> <lgl> <fct>    <fct>    <int>
## 1 nordeste_semiarido  12001 25 DE MARÇO     <NA>  NA    RN       <NA>        NA
## 2 nordeste_semiarido  12002 ABÓBORAS        <NA>  NA    PE       <NA>        NA
## 3 nordeste_semiarido  12003 ACARAPE DO MEIO <NA>  NA    CE       <NA>        NA
## 4 nordeste_semiarido  12004 ACARAÚ MIRIM    <NA>  NA    CE       <NA>      1907
## 5 nordeste_semiarido  12005 ACAUÃ           <NA>  NA    PB       <NA>        NA
## 6 nordeste_semiarido  12006 ADAUTO BEZERRA  <NA>  NA    CE       <NA>        NA
```


## To-do

- Buscar outras bases de dados de reservatórios brasileiros

- Confirmar a confiabilidade dos dados extraídos

## Melhorias e sugestões

Tem alguma ideia para o pacote ou sugestão de como posso melhorá-lo? Crie uma nova [issue](https://github.com/brunomioto/reservatoriosBR/issues) para que eu possa ajudar!
