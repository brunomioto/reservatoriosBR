# reservatoriosBR
Pacote R para obtenção de dados de reservatórios brasileiros a partir da plataforma [SIN-ANA](https://www.ana.gov.br/sar0/MedicaoSin).

Este pacote busca baixar e organizar os dados em uma estrutura para uso no R.

## Instalação

Este pacote apenas está disponível para a instalação pelo github usando o devtools: 

```r
devtools::install_github('brunomioto/reservatoriosBR')
```

## Uso

### A função `dados_reservatorio()`

Utilize a função para obter os dados históricos dos reservatórios brasileiros.

`dados_reservatorio(codigo_reservatorio, data_inicial, data_final)`

- `codigo_reservatorio` O código do reservatório de acordo com o SIN (tabela a ser implementada futuramente).
- `data_inicial` Data inicial do registro. Se for anterior à data de funcionamento, retorna a data de registro mais antiga.
- `data_final` Data final do registro. Pode ser usado Sys.Date() para retornar a data de registro mais recente.

```r
> dados_reservatorio(19058, "2000-01-01", "2019-12-31")
# A tibble: 7,306 x 11
   data_medicao codigo_reservat~ reservatorio cota_m afluencia_m3_s defluencia_m3_s vazao_vertida_m~
   <date>       <fct>            <fct>         <dbl>          <dbl>           <dbl>            <dbl>
 1 2000-01-01   19058            ITAIPU         216.           9761            8101                0
 2 2000-01-02   19058            ITAIPU         216.           9300            8401                0
 3 2000-01-03   19058            ITAIPU         216.           9385            8870                0
 4 2000-01-04   19058            ITAIPU         216.           9450           10351                0
 5 2000-01-05   19058            ITAIPU         216.           8868           10789                0
 6 2000-01-06   19058            ITAIPU         216.           8275           10815                0
 7 2000-01-07   19058            ITAIPU         215.           7963            9854                0
 8 2000-01-08   19058            ITAIPU         215.           8367            8869                0
 9 2000-01-09   19058            ITAIPU         215.           9408            8279                0
10 2000-01-10   19058            ITAIPU         215.           8706            8958                0
# ... with 7,296 more rows, and 4 more variables: vazao_turbinada_m3_s <dbl>,
#   vazao_natural_m3_s <dbl>, volume_util_percent <dbl>, vazao_incremental_m3_s <dbl>
```
