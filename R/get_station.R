get_station<-function(x){
  require(jsonlite)
  require(RJSONIO)
  json_file <- "http://opendata-download-metobs.smhi.se/api/version/1.0/parameter/1/station.json"
  jsonlist <- fromJSON(json_file)
  available<-as.data.frame(jsonlist$station)
  available<- ustation[ustation$updated==max(ustation$updated), 1:5]
  colnames(available)<-c("Station_name", "ID", "Height", "Latitude", "Longitude")
  return(available)
}