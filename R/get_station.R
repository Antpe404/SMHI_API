#'Get a list of the stations currently available for use of smhi_data and smhi_plot
#'
#'get_station will prodvide you with a list of weather stations with fresh data. Only stations which are 
#'updated continously will appear, in order to be able to collect the most recent data.
#'To use the smhi_data and smhi_plot functions you need the ID of the station, which is presented along
#'with the stations' name, height, latitude and longitude.
#'
#'
#'@return A dataframe with the ID and some additional info about the available weather stations.
#'
#'@details Uses json to collect the data that's up to date, from SMHI.
#'
#'
#'@references 
#'\url{http://opendata.smhi.se/apidocs/metobs/index.html}
#'
#'@examples
#'##Get the data of the available weather stations
#'get_station()
#'
#'@export
#'
#'
#'


get_station<-function(){
  
  require(jsonlite)
  require(RJSONIO)
  
  json_file <- "http://opendata-download-metobs.smhi.se/api/version/1.0/parameter/1/station.json"
  jsonlist <- fromJSON(json_file)
  
  station_name<-0
  id<-0
  height<-0
  latitude<-0
  longitude<-0
  updated<-0
  for (i in 1:length(jsonlist$station)){
    station_name[i]<-jsonlist$station[[i]]$name
    id[i]<-jsonlist$station[[i]]$id
    height[i]<-jsonlist$station[[i]]$height
    latitude[i]<-jsonlist$station[[i]]$latitude
    longitude[i]<-jsonlist$station[[i]]$longitude
    updated[i]<-jsonlist$station[[i]]$updated
    
    res<-data.frame(station_name, id, height, latitude, longitude, updated)
    available<-res[res$updated==max(res$updated), 1:5]
   
  }
  colnames(available)<-c("Station_name", "ID", "Height", "Latitude", "Longitude")
  
  return(available)
}

#get_station()$ID


#get_station<-function(x){
 # require(jsonlite)
  #require(RJSONIO)
  #json_file <- "http://opendata-download-metobs.smhi.se/api/version/1.0/parameter/1/station.json"
  #jsonlist <- fromJSON(json_file)
  #available<-as.data.frame(jsonlist$station)
  #available<- available[available$updated==max(available$updated), 1:5]
  #colnames(available)<-c("Station_name", "ID", "Height", "Latitude", "Longitude")
  #return(available)
  
  
#}
