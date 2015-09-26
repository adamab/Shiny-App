predictmpg <- function(cyl, hp, gear) {
        data(mtcars)
        mtcars$hp <- mtcars$hp/50
        mpgpredict <- lm(mpg ~ cyl + hp + gear, data = mtcars)
        inputs <- data.frame("cyl" = cyl,
                             "hp" = hp,
                             "gear" = gear)
        round(predict(mpgpredict, newdata = inputs), 0)
}

shinyServer(
        function(input, output) {
                # Reactive transformation of horsepower
                hpreact <- reactive({input$hp/50})
                # Ouput for number of cylinders
                output$inputCyl <- renderPrint({
                        paste("Number of Cylinders:",
                              as.numeric(input$cyl))
                        })
                # Output for transformed horsepower
                output$inputHp <- renderPrint({
                        paste("Transformed Horsepower:",
                              hpreact())
                })
                # Output for number of gears
                output$inputGear <- renderPrint({
                        paste("Number of Gears:",
                              as.numeric(input$gear))
                })

                npredict <- eventReactive(input$goButton, {
                        predictmpg(as.numeric(input$cyl),
                                   hpreact(),
                                   as.numeric(input$gear))                        
                })
                output$prediction <- renderPrint({
                        npredict()
                })
        }
)