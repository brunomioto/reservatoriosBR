#' Tabela com dados dos reservatorios brasileiros apresentados pela ONS
#'
#' Um dataset contendo os atributos dos principais reservatorios brasileiros apresentados pela ONS.
#'
#' @source <http://www.ons.org.br/paginas/energia-agora/reservatorios>. obtido em 2021-08-30
#'
#' @format Um dataframe com 39 observacoes e 6 variaveis
#' \describe{
#'
#'   \item{reservatorio}{o nome do reservatorio}
#'   \item{bacia}{bacia hidrológica a qual o reservatorio pertence}
#'   \item{subsistema}{subsistema-ONS a qual o reservatorio pertence}
#'   \item{estado_1}{estado o qual o reservatorio pertence}
#'   \item{estado_2}{se o reservatorio fica entre estados, o segundo estado}
#'   \item{codigo}{o codigo do reservatorio segundo o SAR}
#' }
#'
#' @examples
#' tabela_reservatorios_ONS()

tabela_reservatorios_ONS <- function(){
  dplyr::as_tibble(reservatoriosBR:::tabela_reservatorios_ONS_data)
}
