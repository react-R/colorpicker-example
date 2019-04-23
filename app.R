library(shiny)
library(colorpicker)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  colorpickerInput("color", type = "twitter"),
  textOutput("textOutput")
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", capture.output(dput(input$color)))
  })
}

shinyApp(ui, server)
