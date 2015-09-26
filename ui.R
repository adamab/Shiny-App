shinyUI(pageWithSidebar(
        headerPanel("Predicting MPG"),
        sidebarPanel(
                h1("Car Attributes"),
        ),
        radioButtons("cyl", "Number of Cylinders:", 
                     "4" = "4",
                     "6" = "6",
                     "8" = "8", selected = NULL, inline = FALSE),
        numericInput("hp", "Horsepower:", 150, min = 100, max = 300, step = 1),
        
        mainPanel(
                h1("Prediction"),
        )
))