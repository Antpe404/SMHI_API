#'Presents the available parameter IDs and a description of them.
#'
#'get_parameters() will provide you the available parameters for usage of the functions
#'smhi_data and smhi_plot. get_parameters() gives you the ID and a description of each parameter, i.e. 
#'what the different parameters will collect for you.
#'
#'
#'@return A dataframe with the ID and description info about the available parameters.
#'
#'
#'@references 
#'\url{http://opendata.smhi.se/apidocs/metobs/index.html}
#'
#'@examples
#'##Get the description and ID of the available parameters.
#'get_parameters()
#'
#'@export
get_parameters<-function(){
  param_nr<-c(1,2,4,6)
  description<-c("Air temperature (°C) per hour", "Air temperature (°C) per day", "Wind speed (m/s) per hour", "Relative air humidity per hour")
  ans<-matrix(cbind(param_nr, description), ncol=2)
  colnames(ans)<-c("Parameter", "Beskrivning")
  return(ans)
}
