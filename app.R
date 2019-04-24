library(shiny)
library(colorpicker)

ui <- fluidPage(
  titlePanel("colorpicker example"),
  sidebarLayout(
    sidebarPanel(
      selectInput("pickerType", "Picker Type", eval(formals(colorpickerInput)$type))   ,
      textOutput("chosenPicker"),
      textOutput("chosenColor")
    ),
    mainPanel(uiOutput("colorpicker"))
  )
)

server <- function(input, output, session) {
  color <- reactiveVal("#ffffff")
  observeEvent(input$color, color(input$color))

  output$colorpicker <- renderUI({
    colorpickerInput("color", color(), type = input$pickerType)
  })

  output$chosenPicker <- renderText({
    sprintf("Selected picker: %s", input$pickerType)
  })
  output$chosenColor <- renderText({
    sprintf("Selected color: %s", input$color)
  })
}

shinyApp(ui, server)
