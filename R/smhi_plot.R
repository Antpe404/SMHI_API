#'Plot data from the SMHI API
#'
#'Plots the latest avalible data from a station of your choosing. The function returns 
#'a timeseries-plot generated by ggplot2. Data is collected from active stations form the SMHI API. 
#' 
#'@param station    an ID for a weather station managed by SMHI. 
#'Available stations can be found by typing get_station()
#'
#'@param parameter   an ID for the type of data to collect. There are four different 
#'types available, which can be found by typing get_parameters()
#'
#'@return Generates and draws a timeseries-plot
#'
#'@details The function uses the smhi_data function together with the get_station and get_parameters
#'to generate the data for the plot. The plot function used is ggplot2 together with the grid and 
#'gridExtra-packages for generating a publication-ready graph. 
#'
#'@references 
#'\url{http://opendata.smhi.se/apidocs/metobs/index.html}
#'
#'@examples
#'##Plot the air temperature hourwise (parameter=1) in Arvidsjaur(station=159880) the latest four months
#'smhi_data(159880,1)
#'
#'@export


smhi_plot <- function(station,parameter){
  
  require("ggplot2")
  
  statnamn<-get_station()$Station_name[get_station()$ID == station]
  paramnamn<-get_parameters()[get_parameters()[,1]==parameter,2]
  mindata<-smhi_data(station,parameter)
  
  p<- ggplot(data= mindata,aes(x=Date,y=Value)) +
    geom_point() + geom_line() +theme_bw() + 
    ylab(paste(paramnamn))+ xlab("Date \n \n Source: SMHI") +
    ggtitle(paste("The",tolower(paramnamn), "for \n",statnamn,"over the last 4 months")) 
  
  return(p)
}

#smhi_plot(138240,6)
#smhi_plot(138240,4)
#smhi_plot(138240,2)
#smhi_plot(138240,1)
#smhi_plot(86340, 2)
#smhi_plot(93220, 2)