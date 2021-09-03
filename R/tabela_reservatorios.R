#' Tabela com dados dos reservatorios brasileiros
#'
#' Um dataset contendo os atributos dos principais reservatorios brasileiros.
#'
#' @source <https://www.ana.gov.br/sar0/>. obtido em 2021-08-22
#'
#' @format Um dataframe com 708 observacoes e 5 variaveis
#' \describe{
#'   \item{sistema}{sistema o qual o reservatorio pertence}
#'   \item{estado_1}{estado o qual o reservatorio pertence}
#'   \item{estado_2}{se o reservatorio fica entre estados, o segundo estado}
#'   \item{reservatorio}{o nome do reservatorio}
#'   \item{codigo}{o codigo do reservatorio segundo o SAR}
#' }
#'
#' @examples
#' tabela_reservatorios()
#'
tabela_reservatorios <- function(){
  dplyr::as_tibble(reservatoriosBR:::tabela_reservatorios_data)
}
