capitalize <- function(s) {
  gsub("^(.)", perl = TRUE, replacement = '\\U\\1', s)
}

#' <Add Title>
#'
#' <Add Description>
#'
#' @importFrom shiny restoreInput
#' @importFrom reactR createReactShinyInput
#' @importFrom htmltools htmlDependency tags
#'
#' @export
colorpickerInput <- function(inputId,
                             defaultColor = "#fff",
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
  color <- restoreInput(id = inputId, default = defaultColor)
  type <- paste0(capitalize(match.arg(type)), "Picker")
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
    color,
    list(type = type),
    tags$div
  )
}
