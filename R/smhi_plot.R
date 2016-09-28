smhi_plot <- function(station,parameter){
  
  require("ggplot2")
  require("grid")
  require("gridExtra")
  
  statnamn<-get_station()$Station_name[get_station()$ID == station]
  paramnamn<-get_parameters()[get_parameters()[,1]==parameter,2]
  mindata<-smhi_data(station,parameter)
  
  p<- ggplot(data= mindata,aes(x=Date,y=Value)) +
    geom_point() + geom_line() +theme_bw() + 
    ylab(paste(paramnamn))+
    ggtitle(paste("The",tolower(paramnamn), "for \n",statnamn,"over the last 4 months")) 
  
  p <-arrangeGrob(p, bottom="Source: SMHI")  
  grid.newpage()
  grid.draw(p)
}

smhi_plot(138240,6)
smhi_plot(138240,4)
smhi_plot(138240,2)
smhi_plot(138240,1)
smhi_plot(86340, 2)
smhi_plot(93220, 2)