library(shiny)
library(colorpicker)

ui <- fluidPage(
  titlePanel("reactR Input Example"),
  colorpickerInput("textInput", type = "sketch"),
  textOutput("textOutput")
)

server <- function(input, output, session) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })
}

shinyApp(ui, server)
