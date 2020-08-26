


#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`




.onLoad <- function(libname, pkgname) {
  op <- options()
  invisible()
}




.onAttach <- function(lib, pkg,...){
  print_message <-  paste("\n",
                          "Welcome to SNA4DS version ", utils::packageDescription("SNA4DS")$Version,
                          "\n",
                          "Type ?SNA4DS to access the package documentation\n\n",
                          "To suppress this message use:\n",
                          "\tsuppressPackageStartupMessages(library(SNA4DS))\n\n",
                          "You can check if you have the latest version with 'check_SNA4DS()'\n",
                          sep = "")
  packageStartupMessage(print_message)
}


