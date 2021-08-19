
# **reservatoriosBR** <img src="man/figures/logo.png" align="right" width="25%" min-width="120px"/>

Pacote R para obtenção de dados de reservatórios brasileiros a partir da
plataforma [SIN-ANA](https://www.ana.gov.br/sar0/MedicaoSin).

Este pacote baixa e organiza os dados em uma estrutura para uso no R.

## Instalação

Este pacote apenas está disponível para a instalação pelo github usando
o devtools:

``` r
#install.packages("devtools")
devtools::install_github('brunomioto/reservatoriosBR')
```

## Uso

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

  - `data_medicao` Data da medição realizada
  - `codigo_reservatorio` Código do reservatório segundo o SIN-ANA
  - `reservatorio` Nome do reservatório
  - `cota_m` Cota (m³)
  - `afluencia_m3_s` Afluência (m³/s)
  - `defluencia_m3_s` Defluência (m³/s)
  - `vazao_vertida_m3_s` Vazão vertida (m³/s)
  - `vazao_turbinada_m3_s` Vazão turbinada (m³/s)
  - `vazao_natural_m3_s` Vazão natural (m³/s)
  - `volume_util_percent` Volume útil (%) - Retorna apenas NA
  - `vazao_incremental_m3_s` Vazão incremental (m³/s) - Retorna apenas
    NA

As unidades de medida foram mantidas no nome das variáveis para não
haver problemas de interpretação.

Podemos utilizar estes dados históricos para fazer análises e gráficos.
A Afluência(m³/s), por exemplo, mede a quantidade de água que chega nas
represas.

<img src="https://github.com/brunomioto/reservatoriosBR/man/figures/plot1.png" width="100%" style="display: block; margin: auto;" />

## To-do

  - Buscar outras bases de dados de reservatórios brasileiros

  - Confirmar a confiabilidade dos dados extraídos
