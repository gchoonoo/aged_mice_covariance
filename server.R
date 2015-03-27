################################################################

# Shiny Heatmap

################################################################

usePackage <- function(p) {
    if (!is.element(p, installed.packages()[,1]))
        install.packages(p, dep = TRUE)
    require(p, character.only = TRUE)
}
usePackage("shiny")
usePackage("devtools")
devtools::install_github("jcheng5/d3-heatmap")
usePackage("heatmap")

library(shiny)
library(heatmap)
source("heatmapJoe.R")
source("HeatmapU19_DWB_gabby_v2.R")

################################################################

# Shiny Server

################################################################

shinyServer(function(input, output) {
	
################################################################

# Reactive input variable
  
################################################################

  datasetInput <- reactive({
  		input$variable
	})
	
################################################################
	
# Output heatmaps	
  
################################################################

  output$heatmap <- renderHeatmap({
    if(datasetInput() == "All"){
      
      V <- var(dat_v4, na.rm=TRUE) 
      #Log transform
      cov.cor <- cov2cor(V)
      cov.cor.m <- data.matrix(cov.cor)
      cov.cor.m
      
    }else{  
  	
    dat_v4[which(substring(row.names(dat_v4),1,2) == datasetInput()),] -> dat_v4_aa 
    V <- var(dat_v4_aa, na.rm=TRUE)   
    #Log transform
    cov.cor <- cov2cor(V)
    cov.cor.m <- data.matrix(cov.cor)
    cov.cor.m
    
    }
    
  })

##############################################################

# Output legends

############################################################

	output$legend <- renderPlot({
		
		if(datasetInput() == "All"){
		  V <- var(dat_v4, na.rm=TRUE) 
		  #Log transform
		  cov.cor <- cov2cor(V)
		  cov.cor.m <- data.matrix(cov.cor)
		  op <- par(mar = par("mar")/2)
			plot.new()		
			image(as.matrix(1:100), col=topo.colors(256),axes=F)
axis(side=1,at=c(0,.25,.5,.75,1),labels=round(seq(range(cov.cor.m)[1],range(cov.cor.m)[2],length.out=5),3))
      par(op)
  	
  		}else{
  		  dat_v4[which(substring(row.names(dat_v4),1,2) == datasetInput()),] -> dat_v4_aa 
  		  V <- var(dat_v4_aa, na.rm=TRUE)   
  		  #Log transform
  		  cov.cor <- cov2cor(V)
  		  cov.cor.m <- data.matrix(cov.cor)
  		  op <- par(mar = par("mar")/2)
  		  plot.new()		
  		  image(as.matrix(1:100), col=topo.colors(256),axes=F)
  		  axis(side=1,at=c(0,.25,.5,.75,1),labels=round(seq(range(cov.cor.m)[1],range(cov.cor.m)[2],length.out=5),3))
        par(op)
  		}
})
  
}) # Closes Shiny Server function