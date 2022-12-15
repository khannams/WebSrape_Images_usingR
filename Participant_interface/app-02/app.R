
library(shiny)
library(shinydashboard)
library(tidyverse)

df<-read.csv("C:/Users/Mehak Khanna/OneDrive - McGill University/Lesion/Oral-AI/Participant_interface/scenarios.csv",
             header = T,
             quote = '"')

df<-df[c(1:20), ]

scene<-slice_sample(df,
             n=5,
             replace = FALSE)


# Define UI for application that draws a histogram
ui <- (
  dashboardPage(
    dashboardHeader(title = "Uncertainity in oral lesion diagnosis - UI 02"),
    
    dashboardSidebar(
      sidebarMenu(
          menuItem(text = "Scenario 1",
                  tabName = "sc_1"),
          menuItem(text = "Scenario 2",
                   tabName = "sc_2"),
          menuItem(text = "Scenario 3",
                   tabName = "sc_3"),
          menuItem(text = "Scenario 4",
                   tabName = "sc_4"),
          menuItem(text = "Scenario 5",
                   tabName = "sc_5")
       
      )
      ),
    dashboardBody(
      tabItems(
        
        tabItem(
          tabName = "sc_1",
          
          column(width = 4,
                 h4(textOutput("scenario1")),
                 br(),
                 br(),
                 h4(helpText("How many such cases do you see in a year?")),
                 numericInput("sc_ov_01", "No.", width = 75, value = 0, min = 0),
                 textInput("sc01_text1", "Most probable diagnosis"),
                 textInput("sc01_text2", "Less probable diagnosis"),
                 textInput("sc01_text3", "Least probable diagnosis")
                 ),
          column(width = 5,
                 imageOutput("image1")
                 ),
          fluidRow(
           column(6,
                h4(textOutput("sc01_di_01_text")),
                numericInput("sc01_di_01", "No.", width = 50, value = 0, min = 0),
                h4(textOutput("sc01_di_02_text")),
                numericInput("sc01_di_02", "No.", width = 50, value = 0, min = 0),
                h4(textOutput("sc01_di_03_text")),
                numericInput("sc01_di_03", "No.", width = 50, value = 0, min = 0)
                ) 
          )
        ),
        tabItem(
          tabName = "sc_2",
          
          column(width = 4,
                 h4(textOutput("scenario2")),
                 br(),
                 br(),
                 h4(helpText("How many such cases do you see in a year?")),
                 numericInput("sc_ov_01", "No.", width = 75, value = 0, min = 0),
                 textInput("sc02_text1", "Most probable diagnosis"),
                 textInput("sc02_text2", "Less probable diagnosis"),
                 textInput("sc02_text3", "Least probable diagnosis")
          ),
          column(width = 5,
                 imageOutput("image2")
          ),
          fluidRow(
            column(6,
                   h4(textOutput("sc02_di_01_text")),
                   numericInput("sc02_di_02", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc02_di_02_text")),
                   numericInput("sc02_di_02", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc02_di_03_text")),
                   numericInput("sc02_di_03", "No.", width = 50, value = 0, min = 0)
            ) 
          )
          
        ),
        tabItem(
          tabName = "sc_3",
          
          column(width = 4,
                 h4(textOutput("scenario3")),
                 br(),
                 br(),
                 h4(helpText("How many such cases do you see in a year?")),
                 numericInput("sc_ov_03", "No.", width = 75, value = 0, min = 0),
                 textInput("sc03_text1", "Most probable diagnosis"),
                 textInput("sc03_text2", "Less probable diagnosis"),
                 textInput("sc03_text3", "Least probable diagnosis")
          ),
          column(width = 5,
                 imageOutput("image3")
          ),
          fluidRow(
            column(6,
                   h4(textOutput("sc03_di_01_text")),
                   numericInput("sc03_di_01", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc03_di_02_text")),
                   numericInput("sc03_di_02", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc03_di_03_text")),
                   numericInput("sc03_di_03", "No.", width = 50, value = 0, min = 0)
            ) 
          )
        ),
        tabItem(
          tabName = "sc_4",
          
          column(width = 4,
                 h4(textOutput("scenario4")),
                 br(),
                 br(),
                 h4(helpText("How many such cases do you see in a year?")),
                 numericInput("sc_ov_04", "No.", width = 75, value = 0, min = 0),
                 textInput("sc04_text1", "Most probable diagnosis"),
                 textInput("sc04_text2", "Less probable diagnosis"),
                 textInput("sc04_text3", "Least probable diagnosis")
          ),
          column(width = 5,
                 imageOutput("image4")
          ),
          fluidRow(
            column(6,
                   h4(textOutput("sc04_di_01_text")),
                   numericInput("sc04_di_01", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc04_di_02_text")),
                   numericInput("sc04_di_02", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc04_di_03_text")),
                   numericInput("sc04_di_03", "No.", width = 50, value = 0, min = 0)
            ) 
          )
        ),
        tabItem(
          tabName = "sc_5",
          
          column(width = 4,
                 h4(textOutput("scenario5")),
                 br(),
                 br(),
                 h4(helpText("How many such cases do you see in a year?")),
                 numericInput("sc_ov_05", "No.", width = 75, value = 0, min = 0),
                 textInput("sc05_text1", "Most probable diagnosis"),
                 textInput("sc05_text2", "Less probable diagnosis"),
                 textInput("sc05_text3", "Least probable diagnosis")
          ),
          column(width = 5,
                 imageOutput("image5")
          ),
          fluidRow(
            column(6,
                   h4(textOutput("sc05_di_01_text")),
                   numericInput("sc05_di_01", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc05_di_02_text")),
                   numericInput("sc05_di_02", "No.", width = 50, value = 0, min = 0),
                   h4(textOutput("sc05_di_03_text")),
                   numericInput("sc05_di_03", "No.", width = 50, value = 0, min = 0)
            ) 
          )
        )
      )
    )
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  
  #first tab
  output$scenario1<- renderText({
    paste("1]",scene$Scenario[1])
  })
  
  output$image1 <- renderImage({
    filename1<- normalizePath(file.path('./www', 
                                       paste(scene$ImageID[1])))
    
    list(src = filename1,
         alt = scene$ImageID[1],
         width = 600,
         height= 380)
  },deleteFile = FALSE)
  
  output$sc01_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc01_text1)
  })
  
  output$sc01_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc01_text2)
  })
  
  output$sc01_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc_01text3)
  })
  
  
  
  #second tab
  output$scenario2<- renderText({
    paste("2]",scene$Scenario[2])
  })
  
  output$image2 <- renderImage({
    filename2<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[2])))
    
    list(src = filename2,
         alt = scene$ImageID[2],
         width = 600,
         height= 380)
  },deleteFile = FALSE)
  
  output$sc02_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc02_text1)
  })
  
  output$sc02_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc02_text2)
  })
  
  output$sc02_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc02_text3)
  })

  
  #third tab  
  output$scenario3<- renderText({
    paste("3]",scene$Scenario[3])
  })
  
  output$image3 <- renderImage({
    filename3<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[3])))
    
    list(src = filename3,
         alt = scene$ImageID[3],
         width = 600,
         height= 380)
  },deleteFile = FALSE)
  
  output$sc03_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc03_text1)
  })
  
  output$sc03_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc03_text2)
  })
  
  output$sc03_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc03_text3)
  })
  
  
  #Fourth tab
  output$scenario4<- renderText({
    paste("4]",scene$Scenario[4])
  })
  
  output$image4 <- renderImage({
    filename4<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[4])))
    
    list(src = filename4,
         alt = scene$ImageID[4],
         width = 600,
         height= 380)
  },deleteFile = FALSE)
  
  output$sc04_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc04_text1)
  })
  
  output$sc04_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc04_text2)
  })
  
  output$sc04_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc04_text3)
  })
  
  
  #fifth tab
  output$scenario5<- renderText({
    paste("5]",scene$Scenario[5])
  })
  
  output$image5 <- renderImage({
    filename5<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[5])))
    
    list(src = filename5,
         alt = scene$ImageID[5],
         width = 600,
         height= 380)
  },deleteFile = FALSE)
  
  output$sc05_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc05_text1)
  })
  
  output$sc05_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc05_text2)
  })
  
  output$sc05_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc05_text3)
  })
  
}


# Run the application 
shinyApp(ui = ui, server = server)

#Lab meeting with sreenath 13th December 2022
#probability sliders
#zoom into image
#How many cases question at end
#Scenarios from patient charts - from test dataset. 
#next for tabs instead of them missing scenarios
#Look at the CSV file for how many patients are there in multiple categories.


