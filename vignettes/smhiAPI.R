## ---- echo=TRUE, message = FALSE, warning = FALSE------------------------
library(smhiAPI)
head(get_station()) #show the first six stations


## ---- echo=TRUE, message = FALSE, warning = FALSE------------------------
get_parameters()

## ---- echo=TRUE, message = FALSE, warning = FALSE------------------------
mydata<-smhi_data(station=159880,parameter=2)


## ---- echo=TRUE, message = FALSE, warning = FALSE, fig.height=7, fig.width=7----
smhi_plot(station=159880,parameter=2)

