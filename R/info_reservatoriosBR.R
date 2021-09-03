#' Informações das funções do pacote reservatoriosBR
#'
#' @examples
#' info_reservatoriosBR()

info_reservatoriosBR <- function(){
  dplyr::as_tibble(reservatoriosBR:::info_reservatoriosBR_data)
}
