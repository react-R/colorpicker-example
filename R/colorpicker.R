capitalize <- function(s) {
  gsub("^(.)", perl = TRUE, replacement = '\\U\\1', s)
}

# Converts an "R color" as defined by col2rgb() to a named list with r, g, b,
# and a keys. The 'a'
as_react_color <- function(r_color) {
  rgba <- col2rgb(r_color, alpha = TRUE)
  row.names(rgba) <- substr(row.names(rgba), 1, 1)
  rgba <- as.list(t(rgba)[1,])
  # Convert alpha from 0-255 (R format) to 0-1 (react-color format)
  rgba$a <- (1/255)*rgba$a
  rgba
}

as_r_color <- function(react_color) {
  # Convert alpha from 0-1 (react-color format) to 0-25 (R format)
  alpha <- (255/1)*react_color$a
  rgb(react_color$r, react_color$g, react_color$b, alpha, maxColorValue = 255)
}

#' Create a color picker input
#'
#' Creates a color picker input powered by the
#' \href{https://github.com/casesandberg/react-color}{react-color} JavaScript
#' library. There are 13 available types of picker, each with a different
#' appearance and behavior. The picker type is determined by the value of the
#' \code{type} argument.
#'
#' @param inputId The \code{input} slot that will be used to access the chosen
#'   color value. The color value is a hexadecimal string of the form
#'   \code{"#rrggbb"} or \code{"#rrggbbaa"}.
#' @param defaultColor An R color as accepted by
#'   \code{\link[grDevices]{col2rgb}} to serve as the initial value of the
#'   input. Defaults to \code{"#ffffff"} (white).
#' @param type The lower-case name of the react-color picker type; defaults to
#'   \code{"sketch"}. The following types are available:
#'   \itemize{
#'     \item \code{"sketch"}
#'     \item \code{"alpha"}
#'     \item \code{"block"}
#'     \item \code{"chrome"}
#'     \item \code{"circle"}
#'     \item \code{"compact"}
#'     \item \code{"github"}
#'     \item \code{"hue"}
#'     \item \code{"material"}
#'     \item \code{"photoshop"}
#'     \item \code{"slider"}
#'     \item \code{"swatches"}
#'     \item \code{"twitter"}
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
    as_react_color(defaultColor),
    list(type = paste0(capitalize(match.arg(type)), "Picker")),
    tags$div
  )
}

.onLoad <- function(...) {
  shiny::registerInputHandler("reactR.colorpicker", function(data, ...) {
    as_r_color(data)
  })
}
