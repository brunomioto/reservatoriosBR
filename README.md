
# **reservatoriosBR** <img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/>

<!-- badges: start -->

[![Twitter
Follow](https://img.shields.io/twitter/follow/BrunoHMioto.svg?style=social)](https://twitter.com/BrunoHMioto)

<!-- badges: end -->

Pacote R para obtenção de dados de reservatórios brasileiros a partir da
plataforma [SIN-ANA](https://www.ana.gov.br/sar0/MedicaoSin).

Este pacote baixa e organiza os dados em uma estrutura para uso no R.

Se utilizar em algum trabalho, cite ou me avise\! Gostaria de saber como
este pacote pode ajudar\!

## Instalação

Este pacote apenas está disponível para a instalação pelo github usando
o devtools:

``` r
#install.packages("devtools")
devtools::install_github('brunomioto/reservatoriosBR')
```

## Uso

Atualmente o pacote possui 3 funções:

  - `dados_reservatorio()`
  - `dados_reservatorio_cantareira()`
  - `ultima_medicao()`

### A função `dados_reservatorio()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros.

`dados_reservatorio(codigo_reservatorio, data_inicial, data_final)`

  - `codigo_reservatorio` O código do reservatório de acordo com o SIN
    (tabela a ser implementada futuramente).
  - `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga.
  - `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente.

<!-- end list -->

``` r
library(reservatoriosBR)
dados_reservatorio(19058, "2000-01-01", "2019-12-31")
```

    ## # A tibble: 7,306 x 11
    ##    data_medicao codigo_reservat~ reservatorio cota_m afluencia_m3_s
    ##    <date>       <fct>            <fct>         <dbl>          <dbl>
    ##  1 2000-01-01   19058            ITAIPU         216.           9761
    ##  2 2000-01-02   19058            ITAIPU         216.           9300
    ##  3 2000-01-03   19058            ITAIPU         216.           9385
    ##  4 2000-01-04   19058            ITAIPU         216.           9450
    ##  5 2000-01-05   19058            ITAIPU         216.           8868
    ##  6 2000-01-06   19058            ITAIPU         216.           8275
    ##  7 2000-01-07   19058            ITAIPU         215.           7963
    ##  8 2000-01-08   19058            ITAIPU         215.           8367
    ##  9 2000-01-09   19058            ITAIPU         215.           9408
    ## 10 2000-01-10   19058            ITAIPU         215.           8706
    ## # ... with 7,296 more rows, and 6 more variables: defluencia_m3_s <dbl>,
    ## #   vazao_vertida_m3_s <dbl>, vazao_turbinada_m3_s <dbl>,
    ## #   vazao_natural_m3_s <dbl>, volume_util_percent <dbl>,
    ## #   vazao_incremental_m3_s <dbl>

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `codigo_reservatorio` - Código do reservatório segundo o SIN-ANA
  - `reservatorio` - Nome do reservatório
  - `cota_m` - Cota, o nível do reservatório (m)
  - `afluencia_m3_s` - Afluência (m³/s)
  - `defluencia_m3_s` - Defluência (m³/s)
  - `vazao_vertida_m3_s` - Vazão vertida (m³/s)
  - `vazao_turbinada_m3_s` - Vazão turbinada (m³/s)
  - `vazao_natural_m3_s` - Vazão natural (m³/s)
  - `volume_util_percent` - Volume útil (%) - Alguns reservatórios
    retornam apenas NA
  - `vazao_incremental_m3_s` - Vazão incremental (m³/s) - Retorna apenas
    NA

As unidades de medida foram mantidas no nome das variáveis para não
haver problemas de interpretação.

Podemos utilizar estes dados históricos para fazer análises e gráficos.
A Afluência(m³/s), por exemplo, mede a quantidade de água que chega nas
represas.

<img src="man/figures/plot1.png" align="center" width="100%" min-width="120px"/>

### A função `dados_reservatorio_cantareira()`

Utilize a função para obter os dados históricos dos reservatórios
brasileiros do **sistema Cantareira**.

`dados_reservatorio_cantareira(codigo_reservatorio, data_inicial,
data_final)`

  - `codigo_reservatorio` O código do reservatório de acordo com o SIN
    (são apenas 4 reservatórios).

| Reservatorio    | Codigo |
| :-------------- | -----: |
| Jaguari-Jacareí |  29001 |
| Cachoeira       |  29002 |
| Atibainha       |  29003 |
| Paiva Castro    |  29004 |

  - `data_inicial` Data inicial do registro. Se for anterior à data de
    funcionamento, retorna a data de registro mais antiga.
  - `data_final` Data final do registro. Pode ser usado `Sys.Date()`
    para retornar a data de registro mais recente.

As variáveis retornadas são:

  - `data_medicao` - Data da medição realizada
  - `codigo_reservatorio` - Código do reservatório segundo o SIN-ANA
  - `reservatorio` - Nome do reservatório
  - `cota_m` - Cota, o nível do reservatório (m)
  - `volume_util_hm3` - Volume útil (hm³)
  - `volume_util_percent` - Volume útil (%)
  - `afluencia_m3_s` - Afluência (m³/s)
  - `defluencia_m3_s` - Defluência (m³/s)

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
  - `volume_util_percent` - Volume útil (%)
  - `tipo` - Tipo? Ainda preciso descobrir o que isso significa

## To-do

  - Buscar outras bases de dados de reservatórios brasileiros

  - Confirmar a confiabilidade dos dados extraídos
