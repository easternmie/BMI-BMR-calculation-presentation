funcCal<-function(bmr,activity) {
    if (activity=="Little or no exercise") return(bmr * 1.2) 
    else if (activity=="Light exercise/sports 1-3 days/week") return(bmr * 1.375)
    else if (activity=="Moderate exercise/sports 3-5 days/week") return(bmr * 1.55)
    else if (activity=="Hard exercise/sports 6-7 days a week") return(bmr * 1.725)
    else if (activity=="Very hard exercise/sports & physical job") return(bmr * 1.9)
}
funcBMR<-function(weight,height,gender,age) {
    if (gender=="Female") return(655 + ( 9.6 * weight ) + ( 1.8 * height ) - ( 4.7 * age )) 
    else  return(66 + ( 13.7 * weight ) + ( 5 * height) - ( 6.8 * age))
}
funcBMI<-function(wght,hght) {
    if (wght==0 | hght==0) return(NA) 
    else  return(round(wght/(hght/100)^2,1))
}
funcClassBMI<-function(bmi) {
    if (is.na(bmi)) return ("")
    else {
        if (bmi<18.5) return("Your BMI is less than [18.5] you are considered UNDERWEIGHT") 
        if (bmi>=18.5 & bmi<=24.9) return("Your BMI is in range [18.5] to [24.9] you are in HEALTHY WEIGHT RANGE")
        if (bmi>=25 & bmi<=29.9) return("Your BMI is in range [25] to [29.9] you are OVERWEIGHT")
        if (bmi>=30 & bmi <=34.9) return("Your BMI is in range [30] to [34.9] you are CLASS 1 OBESITY")
        if (bmi>=35 & bmi <=39.9) return("Your BMI is in range [35] to [39.9] you are CLASS 2 OBESITY")
        if (bmi>=40) return("Your BMI is higher than [40] you are CLASS 3 OBESITY")
    }
}

library(shiny)
shinyServer(
    function(input, output) {
        
        output$oiweight <- renderPrint({input$weight})
        output$oiheight <- renderPrint({input$height})
        output$BMI <- renderPrint({
            input$btnCalculate
            isolate(funcBMI(input$weight,input$height))
        })
        output$BMIclass<-renderText({
            input$btnCalculate
            isolate(funcClassBMI(funcBMI(input$weight,input$height)))
        })
        output$oigender <- renderText({
            input$btnCalculate
            isolate(input$gender)
        })
        output$BMR <- renderText({
            input$btnCalculate
            if(input$tab == "BMR results")
                isolate(funcBMR(input$weight,input$height,input$gender,input$age))
            else if (input$tab == "Calories needed")
                isolate(funcBMR(input$weight,input$height,input$gender1,input$age1))
        })
        output$cal <- renderText({
            input$btnCalculate
            isolate(funcCal(funcBMR(input$weight,input$height,input$gender1,input$age1),input$activity))
        })
        
        ################################ tab based controls
        output$newBox <- renderUI({
            switch(input$tab,
                   "BMR results" = bmrTab,
                   "Calories needed" = calTab
            )
        })
        
        ################################ BMR tab
        bmrTab <- div(
            radioButtons(inputId="gender", label=h5("Gender"), choices=c("Male","Female")),
            sliderInput(inputId="age", label = h5("Age"),min = 1, max = 150, value = 30)
        )
        
        
        ################################ Cal tab
        calTab <- div(
            radioButtons(inputId="gender1", label=h5("Gender"), choices=c("Male","Female")),
            sliderInput(inputId="age1", label = h5("Age"),min = 1, max = 150, value = 30),
            selectInput("activity", 
                        label = h5("Choose your daily activity"),
                        choices = c("Little or no exercise", 
                                    "Light exercise/sports 1-3 days/week",
                                    "Moderate exercise/sports 3-5 days/week", 
                                    "Hard exercise/sports 6-7 days a week",
                                    "Very hard exercise/sports & physical job"))
        )

    }) 