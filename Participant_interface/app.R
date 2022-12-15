
library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Uncertainity in diagnosis of Oral lesions - UI 01"),
    
      column(width = 3,
             navlistPanel(
               "Other questions",
               "Clinical scenarios",
               tabPanel ("Scenario 01",id = "scenario_01"),
               tabPanel ("Scenario 02",id = "scenario_02"),
               tabPanel ("Scenario 03" ,id = "scenario_03"),
               tabPanel ("Scenario 04",id = "scenario_04"),
               tabPanel ("Scenario 05",id = "scenario_05"),
               tabPanel ("Scenario 06",id = "scenario_06"),
               tabPanel ("Scenario 07",id = "scenario_07"),
               tabPanel ("Scenario 08",id = "scenario_08"),
               tabPanel ("Scenario 09",id = "scenario_09"),
               tabPanel ("Scenario 10",id = "scenario_10"),
               widths = c(10,1))
             ),
      column(width = 4,
             h4(textOutput("scenario")),
             br(),
             br(),
             textInput("text1", "Most probable diagnosis"),
             textInput("text2", "Less probable diagnosis"),
             textInput("text3", "Least probable diagnosis")
             ),
      column(width = 5,
             imageOutput("image"))

)

# Define server logic required to draw a histogram
server <- function(input, output) {
  df<-read.csv("scenarios.csv",
               header = T,
               quote = '"')
  
    output$scenario<- renderText({
      paste("1]",df$Scenario[1])
    })

    output$image <- renderImage({
      filename<- normalizePath(file.path('./www', 
                                         paste(df$ImageID[1])))
      
      list(src = filename,
           alt = df$ImageID,
           width = 600,
           height= 380)
    },deleteFile = FALSE)
    
  
}

# Run the application 
shinyApp(ui = ui, server = server)
