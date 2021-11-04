#' Tabela com dados dos reservatorios brasileiros
#'
#' Um dataset contendo os atributos dos principais reservatorios brasileiros.
#'
#' @source ANA (Antônio Augusto, Diego Pena e Théo Albuquerque), editado por Bruno Mioto. obtido em 2021-08-22
#'
#' @export
#'
#' @format Um dataframe com 805 observacoes e 12 variaveis
#' \describe{
#'   \item{sistema}{sistema o qual o reservatorio pertence segundo o SAR}
#'   \item{codigo}{o codigo do reservatorio segundo o SAR}
#'   \item{reservatorio}{o nome do reservatorio}
#'   \item{res_latitude}{latitude do reservatorio}
#'   \item{res_longitude}{longitude do reservatorio}
#'   \item{municipio}{municipio do reservatorio}
#'   \item{codigo_municipio_ibge}{codigo do municipio na base do ibge}
#'   \item{estado_nome}{estado em forma de nome}
#'   \item{estado_sigla}{estado em forma de sigla}
#'   \item{rio}{nome do rio}
#'   \item{sub_bacia}{sub-bacia do rio}
#'   \item{bacia}{bacia hidrográfica do rio}
#' }
#'
#' @examples tabela_reservatorios()
tabela_reservatorios <- function(){
  readr::read_csv(
    file =
      "https://github.com/brunomioto/reservatoriosBR/raw/v1.1/inst/extdata/tabela_reservatorios_ana.csv",
    locale = readr::locale(
      encoding = "UTF-8",
    ),
    col_types = "cicddciccccc",
    trim_ws = TRUE,
    progress = FALSE
  )
}
