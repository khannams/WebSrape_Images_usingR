
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel(h1(strong("Get four connected sliders"))),

        # Show a plot of the generated distribution
        mainPanel(
          sliderInput("s1", h4("Is this a malignant lesion?", align = "left"), min = 0, max = 100, value = 0, step = 5),
          sliderInput("s2", h4("Is this a pre-malignant lesion?", align = "left"), min = 0, max = 100, value = 0, step = 5),
          sliderInput("s3", h4("Is this a benign lesion?", align = "left"), min = 0, max = 100, value = 0, step = 5),
          sliderInput("s4",h4("Is this appearance of patients normal mucosa", align = "left"), min = 0, max =100, value = 0, step = 5 )
      
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  # when s1 changes, adjust other two to fill the remainder with the same ratio as they currently have
  observeEvent(input$s1, {
    remaining <- 100 - input$s1
    p_remaining_s2 <- input$s2/(input$s2 + input$s3 + input$s4)
    p_remaining_s3 <- input$s3/(input$s2 + input$s3 + input$s4)
    p_remaining_s4 <- input$s4/(input$s2 + input$s3 + input$s4)
    updateSliderInput(inputId = "s2", value = remaining * p_remaining_s2)
    updateSliderInput(inputId = "s3", value = remaining * p_remaining_s3)
    updateSliderInput(inputId = "s4", value = remaining * p_remaining_s4)
  })
  
  # when s2 changes, do the same
  observeEvent(input$s2, {
    remaining <- 100 - input$s2
    p_remaining_s1 <- input$s1/(input$s1 + input$s3 + input$s4)
    p_remaining_s3 <- input$s3/(input$s1 + input$s3 + input$s4)
    p_remaining_s4 <- input$s4/(input$s1 + input$s3 + input$s4)
    updateSliderInput(inputId = "s1", value = remaining * p_remaining_s1)
    updateSliderInput(inputId = "s3", value = remaining * p_remaining_s3)
    updateSliderInput(inputId = "s4", value = remaining * p_remaining_s4)
  })
  
  # when s3 changes, do the same
  observeEvent(input$s3, {
    remaining <- 100 - input$s3
    p_remaining_s1 <- input$s1/(input$s1 + input$s2 + input$s4)
    p_remaining_s2 <- input$s2/(input$s1 + input$s2 + input$s4)
    p_remaining_s4 <- input$s4/(input$s1 + input$s2 + input$s4)
    updateSliderInput(inputId = "s1", value = remaining * p_remaining_s1)
    updateSliderInput(inputId = "s2", value = remaining * p_remaining_s2)
    updateSliderInput(inputId = "s4", value = remaining * p_remaining_s4)
  })
  
  # when s4 changes, do the same
  observeEvent(input$s4, {
    remaining <- 100 - input$s4
    p_remaining_s1 <- input$s1/(input$s1 + input$s2 + input$s3)
    p_remaining_s2 <- input$s2/(input$s1 + input$s2 + input$s3)
    p_remaining_s3 <- input$s3/(input$s1 + input$s2 + input$s3)
    updateSliderInput(inputId = "s1", value = remaining * p_remaining_s1)
    updateSliderInput(inputId = "s2", value = remaining * p_remaining_s2)
    updateSliderInput(inputId = "s3", value = remaining * p_remaining_s3)
  })
  
  renderTable({
    data.frame(
      Slider = c("1", "2", "3", "4", "sum"), 
      Value = c(input$s1, input$s2, input$s3, input$s4 ,input$s1 + input$s2 + input$s3+input$s4)
    )
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
