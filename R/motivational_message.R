#' motivational messages
#'
#' @keywords internal
#' @param msg codigo para qual message quer mostrar.

motivational_message <- function(msg){

  if(msg == 1){
    message <- dplyr::case_when(weekdays(Sys.Date()) == "segunda-feira" ~ sample(c("Calma que hoje é segunda ZzZzZz...",
                                                                        "Bora trabalhar!",
                                                                        "Eita, isso não vai demorar (tanto) ...",
                                                                        "Wait for it...",
                                                                        "Coletando (muitos) dados...",
                                                                        "Enchendo um reservatório de informações ..."),1),
                     weekdays(Sys.Date()) == "sexta-feira" ~ sample(c("SEXTOU! Mas vamos trabalhar né...",
                                                                      "SEXTOU! Ué, as pessoas trabalham na sexta??",
                                                                      "Eita, isso não vai demorar (tanto) ...",
                                                                      "Wait for it...",
                                                                      "Coletando (muitos) dados...",
                                                                      "Enchendo um reservatório de informações ..."),1),
                     TRUE ~ sample(c("Eita, isso não vai demorar (tanto) ...",
                                     "Wait for it...",
                                     "Coletando (muitos) dados...",
                                     "Enchendo um reservatório de informações ..."),
                                   size=1))
  }

  if(msg == 2){
    message <- sample(c("Quase lá, só ajeitar essa tabela agora...",
                        "Tô quase acabando!",
                        "Deixa só eu deixar essa tabela mais bonita?",
                        "Esses dados estão uma zona... Vou arrumar aqui",
                        "Você já regou as plantas hoje? ",
                        "Você lembrou de trancar a porta?",
                        glue::glue("Calma, {Sys.info()[['effective_user']]}, já to acabando!"),
                        glue::glue("{Sys.info()[['effective_user']]}, isso vai ficar incrível!")),1)
  }

  if(msg == 3){
    message <- sample(c("Prontinho!",
                        "Tá na mão!",
                        "Voilà",
                        "Agora sim!",
                        "O que achou?",
                        "Ficou uma graça!"
                        ),1)
  }

  return(message)

}
