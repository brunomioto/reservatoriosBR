#' Dados dos reservatorios brasileiros
#'
#' This function allows you to express your love of cats.
#' @param love Do you love cats? Defaults to TRUE.
#' @keywords water resevoir
#' @export
#' @examples
#' dados_reservatorio()

dados_reservatorio <- function(codigo_reservatorio, data_inicial, data_final){
  url <- glue::glue("https://www.ana.gov.br/sar0/MedicaoSin?dropDownListEstados=&dropDownListReservatorios={codigo_reservatorio}&dataInicial={format.Date(data_inicial, \'%d\')}%2F{format.Date(data_inicial, \'%m\')}%2F{format.Date(data_inicial, \'%Y\')}&dataFinal={format.Date(data_final, \'%d\')}%2F{format.Date(data_final, \'%m\')}%2F{format.Date(data_final, \'%Y\')}&button=Buscar")
  
  nodes_table <- rvest::read_html(url)%>%
    rvest::html_nodes("table")
  
  table_reservoir <- nodes_table[[1]]%>%
    rvest::html_table() %>% 
    janitor::clean_names() %>% 
    dplyr::relocate(dplyr::last_col()) %>% 
    dplyr::rename(afluencia_m3_s = 5,
                  defluencia_m3_s = 6,
                  vazao_vertida_m3_s = 7,
                  vazao_turbinada_m3_s = 8,
                  vazao_natural_m3_s = 9,
                  vazao_incremental_m3_s = 11)
  
  table_reservoir$data_da_medicao <- as.Date(table_reservoir$data_da_medicao, format = "%d/%m/%Y")
  table_reservoir$codigo_do_reservatorio <- as.factor(table_reservoir$codigo_do_reservatorio)
  table_reservoir$reservatorio <- as.factor(table_reservoir$reservatorio)
  table_reservoir$cota_m <- as.numeric(sub(",",".",table_reservoir$cota_m))
  table_reservoir$afluencia_m3_s <- as.numeric(sub(",",".",table_reservoir$afluencia_m3_s))
  table_reservoir$defluencia_m3_s <- as.numeric(sub(",",".",table_reservoir$defluencia_m3_s))
  table_reservoir$vazao_vertida_m3_s <- as.numeric(sub(",",".",table_reservoir$vazao_vertida_m3_s))
  table_reservoir$vazao_turbinada_m3_s <- as.numeric(sub(",",".",table_reservoir$vazao_turbinada_m3_s))
  table_reservoir$vazao_natural_m3_s <- as.numeric(sub(",",".",table_reservoir$vazao_natural_m3_s))
  table_reservoir$volume_util_percent <- as.numeric(table_reservoir$volume_util_percent)
  table_reservoir$vazao_incremental_m3_s <- as.numeric(table_reservoir$vazao_incremental_m3_s)
  
  table_reservoir
  
}
