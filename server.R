data(mtcars)

mpgpredict <- lm(mpg ~ cyl + hp + gear, data = mtcars)

shinyServer(
        function(input, output) {
                data.frame("cyl" = {input$cyl},
                           "hp" = {input$hp},
                           "gear" = {input$gear})
                mpgpred <- round(predict(mpgpredict, newdata = inputs), 0)
                output$prediction <- renderPrint(mpgpred)
        }
)