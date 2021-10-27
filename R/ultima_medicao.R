#' Ultima medicao dos reservatorios brasileiros
#'
#' @export
#' @param codigo_reservatorio Codigo do reservatorio a ser buscado.
#' @examples
#' ultima_medicao(19058)

ultima_medicao <- function(codigo_reservatorio){
  url <- glue::glue("https://www.ana.gov.br/sar/restportal/api/retornaUltimaMedicaoSIN?codigo={codigo_reservatorio}")

  json_reservatorio <- jsonlite::fromJSON(url, simplifyVector = FALSE)

  json_reservatorio_df <- json_reservatorio %>%
    tibble::enframe()

  a <- as.factor(json_reservatorio_df$value[[1]])
  b <- as.Date(json_reservatorio_df$value[[2]], format = "%d/%m/%Y")
  c <- as.numeric(json_reservatorio_df$value[[3]])
  d <- as.numeric(json_reservatorio_df$value[[4]])
  e <- as.numeric(json_reservatorio_df$value[[5]])
  f <- ifelse(is.null(json_reservatorio_df$value[[6]]), NA, as.numeric(json_reservatorio_df$value[[6]]))
  g <- as.numeric(json_reservatorio_df$value[[7]])
  h <- as.numeric(json_reservatorio_df$value[[8]])

  tabela_reservatorio <- cbind.data.frame(a,b,c,d,e,f,g,h)
  colnames(tabela_reservatorio) <- json_reservatorio_df$name

  tabela_reservatorio2 <- tabela_reservatorio %>%
    dplyr::rename(afluencia_m3_s = afluencia,
                  defluencia_m3_s = defluencia,
                  cota_m = cota,
                  vazao_transferida = vazaoTransferida,
                  volume_util_percentual = volumeUtil) %>%
  dplyr::relocate(data)

  if(nrow(tabela_reservatorio2) == 0){
    usethis::ui_oops("Não foi possível obter os dados. Verifique se as variáveis estão corretas ou entre em contato!")
  }else{
    ui_done(motivational_message(3))
    return(tabela_reservatorio2)
  }
}
