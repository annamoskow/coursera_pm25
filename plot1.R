#Q1: have total emissions decreased in US from 1999 to 2008?

#select emissions and year, summarise by year
pmUSA <- NEI %>% 
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T))

#plot pm25 levels for USA over selected years
plot(pmUSA$year, pmUSA$Total_Emissions, type = "o", 
     col = "black", main = "Total US pm2.5 Emissions by Year", 
     xlab = "Year", ylab = "pm25 Level")

#create png of plot
png("plot1.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(4,4,2,1))

plot(pmUSA$year, pmUSA$Total_Emissions, type = "o", 
     col = "black", main = "Total US pm2.5 Emissions by Year", 
     xlab = "Year", ylab = "pm25 Level")
dev.off()