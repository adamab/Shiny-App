shinyUI(pageWithSidebar(
        # Title of the application
        headerPanel("Predicting MPG"),
        
        sidebarPanel(
                h3("Car Attributes"),
                
                # Explanation of the app
                p("This application uses the below attributes of a 
                  car to predict what the mpg will be for it. The 
                  model is a simple linear model using the mtcars 
                  dataset in R. The horsepower attribute is divided 
                  by 50 to align with the model. The values for the 
                  attributes will appear in the main panel for you 
                  to review prior to running the prediction."),
                # Input for cylinders
                radioButtons("cyl", "Number of Cylinders:", 
                             c(4, 6, 8)),
                p("Click on the radio button to choose the
                   number of cylinders in your car."),
                # Input for horsepower
                sliderInput("hp", "How much Horsepower:",
                             150, min = 100, max = 300, step = 5),
                p("Slide the slider to the amount of horsepower 
                  in your car."),
                # Input for gears
                selectInput("gear", "How many Gears:", 4:8),
                p("Select the number of gears in your car between 
                  4 and 8."),
                # Initiate prediction button
                actionButton("goButton", "Submit"),
                p("Once you are satisfied with all of the attribute 
                  values, please click the submit button to receive 
                  your prediction.")
        ),
        
        mainPanel(
                h3("Prediction"),
                h4("Your car is detailed by"),
                verbatimTextOutput("inputCyl"),
                verbatimTextOutput("inputHp"),
                verbatimTextOutput("inputGear"),
                h4("Your expected MPG is"),
                verbatimTextOutput("prediction")
                
        )
))