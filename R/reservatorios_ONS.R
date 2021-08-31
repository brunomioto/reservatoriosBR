#' Dados dos reservatorios brasileiros observados pela ONS
#'
#' @export
#' @param formato Formato do dados a serem apresentados.
#'
#' @examples
#' reservatorios_ONS(formato="tabela")
#' reservatorios_ONS(formato="resumo")

reservatorios_ONS <- function(formato="tabela") {
  if (formato == "tabela" | formato == "resumo") {
    json_ONS <-
      fromJSON(
        "http://tr.ons.org.br/Content/Get/SituacaoDosReservatorios",
        simplifyVector = FALSE
      )
    
    tabela_ONS <- json_ONS %>%
      tibble::enframe() %>%
      tidyr::unnest_wider(value) %>%
      janitor::clean_names()
    
    if (formato == "tabela") {
      
      tabela_ONS <- dplyr::select(tabela_ONS, -name)
      tabela_ONS$data <- as.Date(tabela_ONS$data)
      tabela_ONS$subsistema <- as.factor(tabela_ONS$subsistema)
      tabela_ONS$bacia <- as.factor(tabela_ONS$bacia)
      
      return(tabela_ONS)
      
    } else{
      
      resumo_ONS <- tabela_ONS %>%
        dplyr::group_by(data, subsistema) %>%
        dplyr::summarise(porcentagem = max(subsistema_valor_util))
      
      return(resumo_ONS)
    }
    
  } else{
    message(
      "Você deve escolher formato=\"tabela\" ou formato=\"resumo\" na função.\n\"tabela\" gera um dataframe com diversas variáveis de 39 reservatórios observados pela ONS.\n\"resumo\" gera um relatório dos 4 subsistemas da ONS e a % atual em cada um."
    )
  }
}
