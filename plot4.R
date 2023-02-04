#Q4: Have coal combustion emissions changed from 1999 to 2008?
#NB: coal combustion emissions = 

#find code for coal combustion via SCC
SCC_coal <- SCC %>%
  filter(grepl('[Cc]ombustion', SCC.Level.One)) %>%
  filter(grepl('[Cc]oal', SCC.Level.Three)) %>%
  select(SCC, SCC.Level.One, SCC.Level.Three)

NEI_coal <- inner_join(NEI, SCC_coal, by = "SCC")

#select emissions, year
pmCoal <- NEI_coal %>%
  select(Emissions, year) %>%
  group_by(year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T))

#plot coal levels 1999-2008
plot(pmCoal$year, pmCoal$Total_Emissions, 
     type = "o", col = "black", 
     main = "Coal Emissions by Year",
     xlab = "Year", ylab = "pm25 Level")

#create png of plot
png("plot4.png", width = 480, height = 480, units = "px", bg = "white")
par(mar = c(4,4,2,1))

plot(pmCoal$year, pmCoal$Total_Emissions, 
     type = "o", col = "black", 
     main = "Coal Emissions by Year",
     xlab = "Year", ylab = "pm25 Level")
dev.off()