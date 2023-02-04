#Q2: have total emission decreased in Baltimore from 1999 to 2008?
#NB: Baltimore has (fips == "24510")

#select emissions, year, and city (Baltimore)
#then summarise by year
pmBalt <- NEI %>%
  select(Emissions, year, fips) %>%
  filter(fips == 24510) %>%
  group_by(year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T))

#plot pm25 levels for Baltimore 1999-2008
plot(pmBalt$year, pmBalt$Total_Emissions, type = "o",
     col = "black", main = "Baltimore pm2.5 Emissions by Year",
     xlab = "Year", ylab = "pm25 Level")

#create png of plot
png("plot2.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(4,4,2,1))

plot(pmBalt$year, pmBalt$Total_Emissions, type = "o",
     col = "black", main = "Baltimore pm2.5 Emissions by Year",
     xlab = "Year", ylab = "pm25 Level")
dev.off()