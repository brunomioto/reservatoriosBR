.onAttach <-function(lib,pkg)
{
  ver <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Version")
  ver <- as.character(ver)	
  
  curdate <- read.dcf(file.path(lib, pkg, "DESCRIPTION"), "Date")
  curdate <- as.character(curdate)
  
  packageStartupMessage(paste(
    "\n",
    "*****************************************************************\n",
    "reservatoriosBR: Um pacote de dados de reservatórios brasileiros\n\n",
    "               --- Criado por Bruno Mioto ---\n",
    "  Versão atual do pacote: ",ver," (",curdate,") \n\n",
    "\n",
    "******************************************************************")
  )

}
