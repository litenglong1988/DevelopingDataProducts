library(shiny)

bmifunc <- function(height, weight){
    bmi <- weight/(height/100)^2
    if(bmi < 18.5) "underweight"
    else if(bmi >= 18.5 & bmi < 25) "optimal weight"
    else if(bmi >= 25 & bmi < 30) "overweight"
    else "obese"
}

shinyServer(
    function(input, output){
        output$osex <- renderPrint({input$sex})
        output$oheight <- renderPrint({paste(input$height,"cm",sep="")})
        output$oweight <- renderPrint({paste(input$weight,"kg",sep="")})
        output$diagnostic <- renderPrint({bmifunc(input$height, input$weight)})
    }
    )