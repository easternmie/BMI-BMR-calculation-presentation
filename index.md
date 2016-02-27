---
title       : BMI and BMR Calculation 
subtitle    : Shiny App
author      : Mohd Helmi
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Intro

This Body Mass Index (BMI) and Basal Metabolic Rate (BMR) Calculation is an app to guide user know their BMI and BMR. The information is useful to guide user plan their daily diet.

BMI, or body mass index, is a statistical measurement of a person’s body weight that is based on both weight and height. It is used to determine what a person’s ideal weight is.

BMR refers to a person’s Basal Metabolic Rate, or the number of calories a person would burn in a day even if he or she did nothing but sit or lie in one place.

--- .class #id 

## Shiny App

    <table>
    <tr><td><img src="assets/img/bmibmrcalculation.png" height="60%" width="60%"></td></tr>
    <tr><td><a target="_blank" href="http://easternmie.shinyapps.io/BMI-BMR-calculation">http://easternmie.shinyapps.io/BMI-BMR-calculation</a></td></tr>
    </table>

---

## ui.R

- This UI deivided into two layout :
1. sidebarPanel
2. mainPanel

- sidebarPanel contains all user input control which is controled by tab. Every tab has different input control.
- mainPanel contain tabsetPanels. 3 tab separated to display result BMI, result BMR and Calories needed by user.
---

## server.R

- process the user input every time Calculate button pressed.
- server.R have 4 unique function which is :
    - funcBMI (), accepting two variable which is height and weight.
    - funcClassBMI (), accepting only one variable which is BMI.
    - funcBMR (), accepting 4 variable which is height, weight, age and gender.
    - funcCal (), accepting two variable which is BMR and daily active rate.
---

## Features

Calories calculated in "Calorie needed" is to guide user to have their daily meal. For example, if calorie need is 1698.6, he/she cannot eat "PECAN PIE 1 PIE" and many more. Refer http://www.myfoodbuddy.com/foodCalorieTable.htm
