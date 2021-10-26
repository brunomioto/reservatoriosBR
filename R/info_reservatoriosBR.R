#' Informações das funções do pacote reservatoriosBR
#'
#' @export
#'
#' @examples
#' info_reservatoriosBR()

info_reservatoriosBR <- function(){
  readr::read_delim(
    file =
      "https://github.com/brunomioto/reservatoriosBR/raw/v1.1/inst/extdata/info_reservatoriosBR.csv",
    locale = readr::locale(
      encoding = "UTF-8",
    ),
    col_types = "ccccc",
    delim = ",",
    escape_double = FALSE,
    trim_ws = TRUE,
    progress = FALSE
  )
}
