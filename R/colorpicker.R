capitalize <- function(s) {
  gsub("^(.)", perl = TRUE, replacement = '\\U\\1', s)
}

as_react_color_rgba <- function(r_color) {
  rgba <- col2rgb(r_color, alpha = TRUE)
  row.names(rgba) <- substr(row.names(rgba), 1, 1)
  rgba
}

#' Create a color picker input
#'
#' Creates a color picker input powered by the
#' \href{https://github.com/casesandberg/react-color}{react-color} JavaScript
#' library. There are 13 available types of picker, each with a different look
#' and behavior. The picker type is determined by the value of the \code{type}
#' argument.
#'
#' @param inputId The \code{input} slot that will be used to access the chosen
#'   color, represented as an \link[=grDevices::col2rgb]{R color} like
#'   \code{"#00ff00"}.
#' @param defaultColor The color value to initialize the picker with; defaults
#'   to \code{"#ffffff"} (white).
#' @param type The lower-case name of the react-color picker type; defaults to
#'   \code{"sketch"}. The following types are available:
#'   \describe{
#'     \item{sketch}{TODO}
#'     \item{alpha}{TODO}
#'     \item{block}{TODO}
#'     \item{chrome}{TODO}
#'     \item{circle}{TODO}
#'     \item{compact}{TODO}
#'     \item{github}{TODO}
#'     \item{hue}{TODO}
#'     \item{material}{TODO}
#'     \item{photoshop}{TODO}
#'     \item{slider}{TODO}
#'     \item{swatches}{TODO}
#'     \item{twitter}{TODO}
#'   }
#'
#'
#' @return A color picker widget suitable for inclusion in a Shiny UI.
#'
#' @importFrom shiny restoreInput
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
colorpickerInput <- function(inputId,
                             defaultColor = "#ffffff",
                             type = c(
                               "sketch",
                               "alpha",
                               "block",
                               "chrome",
                               "circle",
                               "compact",
                               "github",
                               "hue",
                               "material",
                               "photoshop",
                               "slider",
                               "swatches",
                               "twitter"
                             )) {
  createReactShinyInput(
    inputId,
    "colorpicker",
    htmlDependency(
      name = "colorpicker-input",
      version = "1.0.0",
      src = "www/colorpicker/colorpicker",
      package = "colorpicker",
      script = "colorpicker.js"
    ),
    # TODO Decide what the color interface should be here.
    list(rgb = as_react_color_rgba(defaultColor)),
    list(type = paste0(capitalize(match.arg(type)), "Picker")),
    tags$div
  )
}
