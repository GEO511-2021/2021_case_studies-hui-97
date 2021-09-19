## Case study 2: My grandfather says summers are getting hotter

# Load packages
library(tidyverse)

# Define the link to the data
dataurl <- "https://data.giss.nasa.gov/tmp/gistemp/STATIONS/tmp_USW00014733_14_0_1/station.txt"

# Download and import the csv file usingd the link
temp <- read_table(dataurl,
                   skip=3, # skip the first 3 lines which has column names
                   na="999.90", # tell R that 999.90 means missing data
                   col_names = c("YEAR","JAN","FEB","MAR", # define column names 
                                 "APR","MAY","JUN","JUL",  
                                 "AUG","SEP","OCT","NOV",  
                                 "DEC","DJF","MAM","JJA",  
                                 "SON","metANN"))

# View the data summary
summary(temp)

# Plot the mean summer temperature with a LOESS prediction
p <- ggplot(data = temp)+aes(x=YEAR, y=JJA)+geom_line(na.rm=TRUE)+labs(subtitle = 'Summer includes June, July, and August \nData from the Global Historical Climate Network \nRed line is a LOESS smooth', x = 'Year', y = 'JJA temperature (deg C)')+
  geom_smooth(formula = y ~ x, method = 'loess', color = 'red', na.rm=TRUE)+ggtitle('Mean Summer Temperature in Buffalo, NY')+
  theme_classic()+theme(plot.title = element_text(size = 15, hjust = 0.5), axis.title = element_text(size = 13), axis.text = element_text(size = 10))+
  scale_x_continuous(breaks = c(seq(1883, 2021, 10), 2021))
print(p)

# Save the plot to the working directory
ggsave('JJA_temp.jpeg')
