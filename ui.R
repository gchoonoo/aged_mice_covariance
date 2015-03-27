library(shiny)
library(heatmap)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  # Application title
  titlePanel("Aged Mice Weight Visualized by Covariance Matrices"),
  
    # Heatmap by Cross
    sidebarPanel(
    	selectInput("variable","Choose a Cross:", 
                  list("All"="All", 
                       "AA"="AA",
                       "AB"="AB",
                       "AC"="AC",
                       "AD"="AD",
                       "AE"="AE",
                       "AF"="AF",
                       "AH"="AH",
                       "BA"="BA",
                       "BB"="BB",
                       "BC"="BC",
                       "BD"="BD",
                       "BF"="BF",
                       "BG"="BG",
                       "BH"="BH",
                       "CA"="CA",
                       "CB"="CB",
                       "CC"="CC",
                       "CE"="CE",
                       "CF"="CF",
                       "CG"="CG",
                       "CH"="CH",
                       "DA"="DA",
                       "DB"="DB",
                       "DC"="DC",
                       "DD"="DD",
                       "DE"="DE",
                       "DF"="DF",
                       "DG"="DG",
                       "DH"="DH",
                       "EA"="EA",
                       "EB"="EB",
                       "EC"="EC",
                       "ED"="ED",
                       "EE"="EE",
                       "EH"="EH",
                       "FB"="FB",
                       "FC"="FC",
                       "FD"="FD",
                       "FE"="FE",
                       "FF"="FF",
                       "FG"="FG",
                       "FH"="FH",
                       "GA"="GA",
                       "GB"="GB",
                       "GC"="GC",
                       "GD"="GD",
                       "GE"="GE",
                       "GF"="GF",
                       "GG"="GG",
                       "GH"="GH",
                       "HA"="HA",
                       "HB"="HB",
                       "HC"="HC",
                       "HD"="HD",
                       "HE"="HE",
                       "HF"="HF",
                       "HG"="HG",
                       "HH"="HH")
                  )),
    
    mainPanel(
    	plotOutput("legend",width=800,height=120),
      heatmapOutput('heatmap')
    )
))