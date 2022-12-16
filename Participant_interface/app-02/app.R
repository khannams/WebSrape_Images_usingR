
library(shiny)
library(shinydashboard)
library(tidyverse)
library(bootstrap)
library(shinydashboardPlus)


df<-read.csv("C:/Users/Mehak Khanna/OneDrive - McGill University/Lesion/Oral-AI/Participant_interface/scenarios.csv",
             header = T,
             quote = '"') #loading data with patient scenarios and image IDs

df<-df[c(1:20), ] 

scene<-slice_sample(df,
             n=5,
             replace = FALSE) #random sampling of 5 patient scenarios


# Define UI for application that draws a histogram
ui <- (
  dashboardPage(
    dashboardHeader(title = "Uncertainity in oral lesion diagnosis - UI 02"), #header of dashboard--------------
    
    dashboardSidebar( #creating 5 tabs in the sidebar menu, will code for each of these tabs
      sidebarMenu(
          menuItem(text = "Scenario 1", #as it appears on the app to the user
                  tabName = "sc_1"),    #name I can use to code the output of choice
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
    
    dashboardBody(        #designing the body of the dashboard-------------
      tabItems(           #The layout of each tab item will be listed here
        
        tabItem(
          tabName = "sc_1",     #for the first tab -----------------------
          
          fluidRow(             #starting the first fluid row
            column(width = 8,   #1st column within the first row is of width 8
                          h4(textOutput("scenario1")),   #the scenario will appear in the column
                          br(),                          # line break
                          br(),
            
                          fluidRow(            #within this column starting a new fluid row.
                            column(width = 4,  #first column within this row
                                          textInput("sc01_text1", "Most probable diagnosis"),
                                          br(),
                                          br(),
                                          textInput("sc01_text2", "Less probable diagnosis"),
                                          br(),
                                          br(),
                                          textInput("sc01_text3", "Least probable diagnosis")
                                          ),
                                   column(width = 4,  #second column within that row
                                          sliderInput(inputId = "sc01_text1_slide", 
                                                      label = "How confident are you of this diagnosis?",
                                                      min = 1, max = 100, value = 25),
                                          sliderInput(inputId = "sc01_text2_slide", 
                                                      label = "How confident are you of this diagnosis?",
                                                      min = 1, max = 100, value = 25),
                                          sliderInput(inputId = "sc01_text1_slide", 
                                                      label = "How confident are you of this diagnosis?",
                                                      min = 1, max = 100, value = 25)
                                          )
                                   )
                         ),
                   
                   column(width = 4,  #Second column within the first fluid row
                          imageOutput(outputId = "image1",
                                      dblclick = "img1_dblclick")
                          )
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
          ),
          fluidRow(
            column(3,
                   actionButton(inputId = "forward",label = "Next", icon = icon(name = "chevron-right")),
                   offset = 10,
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
                 imageOutput("image2",
                             dblclick = "img2_dblclick")
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
          ),
          fluidRow(
            column(3,
                   actionButton(inputId = "forward",label = "Next", icon = icon(name = "chevron-right")),
                   offset = 10,
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
                 imageOutput("image3",
                             dblclick = "img3_dblclick")
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
          ),
          fluidRow(
            column(3,
                   actionButton(inputId = "forward",label = "Next", icon = icon(name = "chevron-right")),
                   offset = 10,
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
                 imageOutput("image4",
                             dblclick = "img4_dblclick")
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
          ),
          fluidRow(
            column(3,
                   actionButton(inputId = "forward",label = "Next", icon = icon(name = "chevron-right")),
                   offset = 10,
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
                 imageOutput("image5",
                             dblclick = "img5_dblclick")
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
          ),
          fluidRow(
            column(3,
                   actionButton(inputId = "forward",label = "Next", icon = icon(name = "chevron-right")),
                   offset = 10,
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
         width = "50%",
         height= "50%")
  },deleteFile = FALSE)
  
observeEvent(input$img1_dblclick, {
  output$image1 <- renderImage({
    filename1<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[1])))
    
    list(src = filename1,
         alt = scene$ImageID[1],
         width = "100%",
         height= "100%")
  },deleteFile = FALSE)
             }) 
  
  
  
  output$sc01_di_01_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc01_text1, "?")
  })
  
  output$sc01_di_02_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc01_text2, "?")
  })
  
  output$sc01_di_03_text<-renderText({
    paste("How many of those cases have you diagnosed as",input$sc01_text3, "?")
  })
  
  #second tab
               
output$scenario2<-renderText({
    paste("2]",scene$Scenario[2])
  })
  
  output$image2<-renderImage({
    filename2<- normalizePath(file.path('./www', 
                                        paste(scene$ImageID[2])))
    
    list(src = filename2,
         alt = scene$ImageID[2],
         width = "50%",
         height= "50%")
  },deleteFile = FALSE)
  
observeEvent(input$img2_dblclick, {
    output$image2 <- renderImage({
      filename2<- normalizePath(file.path('./www', 
                                          paste(scene$ImageID[2])))
      
      list(src = filename2,
           alt = scene$ImageID[2],
           width = "100%",
           height= "100%")
    },deleteFile = FALSE)
  }) 
  
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
         width = "50%",
         height= "50%")
  },deleteFile = FALSE)
  
  observeEvent(input$img3_dblclick, {
    output$image3 <- renderImage({
      filename3<- normalizePath(file.path('./www', 
                                          paste(scene$ImageID[3])))
      
      list(src = filename3,
           alt = scene$ImageID[3],
           width = "100%",
           height= "100%")
    },deleteFile = FALSE)
  }) 
  
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
         width = "50%",
         height= "50%")
  },deleteFile = FALSE)
  
  observeEvent(input$img4_dblclick, {
    output$image4 <- renderImage({
      filename4<- normalizePath(file.path('./www', 
                                          paste(scene$ImageID[4])))
      
      list(src = filename4,
           alt = scene$ImageID[4],
           width = "100%",
           height= "100%")
    },deleteFile = FALSE)
  }) 
  
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
         width = "50%",
         height= "50%")
  },deleteFile = FALSE)
  
  observeEvent(input$img5_dblclick, {
    output$image5 <- renderImage({
      filename5<- normalizePath(file.path('./www', 
                                          paste(scene$ImageID[5])))
      
      list(src = filename5,
           alt = scene$ImageID[5],
           width = "100%",
           height= "100%")
    },deleteFile = FALSE)
  }) 
  
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

#How many cases question at end
#Scenarios from patient charts - from test dataset. 
#next for tabs instead of them missing scenarios
#Look at the CSV file for how many patients are there in multiple categories.


