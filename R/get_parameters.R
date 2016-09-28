get_parameters<-function(x){
  param_nr<-c(1,2,4,6)
  description<-c("Air temperature (°C) per hour", "Air temperature (°C) per day", "Wind speed (m/s) per hour", "Relative air humidity per hour")
  ans<-matrix(cbind(param_nr, description), ncol=2)
  colnames(ans)<-c("Parameter", "Beskrivning")
  return(ans)
}
