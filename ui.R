#library(rCharts)
library(shiny)
library(datasets)
#library(ISOcodes)
#data(ISO_3166_1)
shinyUI(pageWithSidebar(
    headerPanel("Body Mass Index and Basal Metabolic Rate Calculation"),
    sidebarPanel(
        numericInput(inputId="heightM", label=h5("Your height in cm"), value = 160, min=1),
        numericInput(inputId="weightM", label=h5("Your weight in kg"), value = 55, min=1),
        
        uiOutput("newBox"),
        actionButton(inputId="btnCalculate", "Calculate")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel('BMI results',
                     h5('Your BMI is'),
                     verbatimTextOutput("BMI"),
                     verbatimTextOutput("BMIclass"),
                     br(),br(),
                     p("Source: ", a("Classification of obesity",href = "https://en.wikipedia.org/wiki/Classification_of_obesity")),
                     p("Body mass index or BMI is a simple and widely used method for estimating body fat mass.[8] BMI was developed in the 19th century by the Belgian statistician and anthropometrist Adolphe Quetelet.[9] BMI is an accurate reflection of body fat percentage in the majority of the adult population. It however is less accurate in people such as body builders and pregnant women.[10] A formula combining BMI, age, and gender can be used to estimate a person's body fat percentage to an accuracy of 4%.[11] An alternative method, body volume index (BVI), is being developed in an effort to better take into account different body shapes.[12]

                       BMI	Classification
                       < 18.5	underweight
                       18.5–24.9	normal weight
                       25.0–29.9	overweight
                       30.0–34.9	class I obesity
                       35.0–39.9	class II obesity
                       ≥ 40.0	  class III obesity  
                       BMI is calculated by dividing the subject's mass by the square of his or her height, typically expressed either in metric or US \"Customary\" units:")
            ),
            tabPanel('BMR results',
                     h5('Your BMR is '),
                     verbatimTextOutput("BMR"),
                     p("Please click [", span("Calculate", style="font-weight:bold"), "] button to get the result"),
                     br(),br(),
                     p("Source: ", a("Basal metabolic rate",href = "https://en.wikipedia.org/wiki/Basal_metabolic_rate")),
                     p("Basal metabolic rate (BMR) is the minimal rate of energy expenditure per unit time by endothermic animals at rest. (McNab, B. K. 1997). On the Utility of Uniformity in the Definition of Basal Rate of Metabolism. Physiol. Zool. Vol.70; Metabolism refers to the processes that the body needs to function. Basal Metabolic Rate is the amount of energy expressed in calories that a person needs to keep the body functioning at rest. Some of those processes are breathing, blood circulation, controlling body temperature, cell growth, brain and nerve function, and contraction of muscles. Basal metabolic rate (BMR) affects the rate that a person burns calories and ultimately whether you maintain, gain, or lose weight. Your basal metabolic rate accounts for about 60 to 75% of the calories you burn every day. It is influenced by several factors.")
                     
            ),
            tabPanel('Calories needed',
                     h5('Today, how many calorie you need is : '),
                     verbatimTextOutput("cal"),
                     p("Please click [", span("Calculate", style="font-weight:bold"), "] button to get the result"),
                     br(),br(),
                     p("Source: ", a("Calorie",href = "https://en.wikipedia.org/wiki/Basal_metabolic_rate")),
                     p("Basal metabolic rate (BMR) is the minimal rate of energy expenditure per unit time by endothermic animals at rest. (McNab, B. K. 1997). On the Utility of Uniformity in the Definition of Basal Rate of Metabolism. Physiol. Zool. Vol.70; Metabolism refers to the processes that the body needs to function. Basal Metabolic Rate is the amount of energy expressed in calories that a person needs to keep the body functioning at rest. Some of those processes are breathing, blood circulation, controlling body temperature, cell growth, brain and nerve function, and contraction of muscles. Basal metabolic rate (BMR) affects the rate that a person burns calories and ultimately whether you maintain, gain, or lose weight. Your basal metabolic rate accounts for about 60 to 75% of the calories you burn every day. It is influenced by several factors.")
                     
            ),
            id = "tab"
        ),
        br(),
        p(strong("Any question, please don't hesitate to contact me mhelmi<dot>r<at>gmail<dot>com"))
    )
)
)