smhi_data <- function(station,parameter){
  if ((station %in% get_station()$ID)&&(parameter %in% get_parameters()[,1])){
    
    require(XML)
    require(lubridate)
    require(stringr)
    
    xmhi<-xmlParse(paste0("http://opendata-download-metobs.smhi.se/api/version/1.0/parameter/",parameter,"/station/",
                          station,"/period/latest-months/data.xml"))
    listmhi<-xmlToList(xmhi)
    
    index <- 10
    while ("value" %in% names(listmhi[[index]]) == FALSE) {
      index <- index +1 
      #print(i)
      if(index > 25){
        break
      }
    }
    
    matrixhi<-matrix(unlist(listmhi[index:length(listmhi)]),ncol=length(listmhi[[index]]),byrow = T)
    datahi<-as.data.frame(matrixhi)
    
    if (any(parameter == c(1,4,6)) | any( parameter == c("1","4","6") ) ){
      
      if (any(nchar(sapply(datahi[1,],as.character))>20)){
        
        isdate          <- which(nchar(sapply(datahi[1,],as.character))>20,arr.ind = T)
        datahi[,isdate] <- sapply(datahi[,isdate],as.character)
        datahi[,isdate] <- sapply(datahi[,isdate],FUN = function(x) V1 = str_replace(x,"T"," "))
        datahi[,isdate] <- sapply(datahi[,isdate],FUN = function(x) V1 = str_replace(x,".000Z",""))
        datahi[,isdate] <- sapply(datahi[,isdate], ymd_hms)
        datahi[,isdate] <- as.POSIXct(datahi[,isdate],origin = "1970-01-01")
        datahi[,2] <- as.numeric(as.character(datahi[,2]))
      }
    }
    
    
    if ( parameter == 2 | parameter == "2" ){
      datahi     <- datahi[,c(3:5)]
      datahi[,1] <- ymd(datahi[,1])
      datahi[,2] <- as.numeric(as.character(datahi[,2]))
    }
    colnames(datahi)<-c("Date", "Value","Quality")
    return(datahi)
  }
  else{
    print("Your input is invalid. Use get_parameters() and get_station() to see the available station ID:s and the available parameters!")
  }}

mindata<-smhi_data(93220,2)
mindata<-smhi_data(93220,3)#Funkar inte. Fint.
mindata<-smhi_data(90,1) #Funkar inte. Fint. 
mindata<-smhi_data(173810,1) #Funkar men bristande datamaterial 
mindata<-smhi_data(159889,1) #Funkar inte. Fint
mindata<-smhi_data(159880,1) #Funkar för ARvidsjaur också. Fan vad FEINT.
mindata<-smhi_data(138240,6) #Humidity funkar med.
