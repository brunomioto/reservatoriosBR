#' Informações das funções do pacote reservatoriosBR
#'
#' @export
#'
#' @examples
#' info_reservatoriosBR()

info_reservatoriosBR <- function(){
  readr::read_csv(
    file =
      "https://github.com/brunomioto/reservatoriosBR/raw/v1.1/inst/extdata/info_reservatoriosBR.csv",
    locale = readr::locale(
      encoding = "UTF-8",
    ),
    col_types = "ccccc",
    trim_ws = TRUE,
    progress = FALSE
  )
}
