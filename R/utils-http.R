#' HTTP utility functions using httr2
#'
#' @keywords internal
#' @importFrom httr2 request req_perform resp_body_string resp_body_json

#' Make HTTP request with httr2 and return content for HTML parsing
#' @param url The URL to request
#' @return HTTP response content suitable for rvest::read_html()
#' @keywords internal
http_get_html <- function(url) {
  resp <- httr2::request(url)
  resp <- httr2::req_perform(resp)
  
  # Return the response body as text for rvest
  httr2::resp_body_string(resp)
}

#' Make HTTP request with httr2 and return JSON content
#' @param url The URL to request
#' @return Parsed JSON content
#' @keywords internal
http_get_json <- function(url) {
  resp <- httr2::request(url)
  resp <- httr2::req_perform(resp)
  
  # Parse JSON directly from response
  httr2::resp_body_json(resp, simplifyVector = FALSE)
}