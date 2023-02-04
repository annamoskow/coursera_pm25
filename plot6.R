#Q6: Compare motor vehicle emissions between Baltimore 
#and LA. Which city has had greater changes?
#NB: LA has (fips == "06037")

#find code for motor vehicle emissions via SCC
SCC_motor <- SCC %>%
  filter(grepl('[Vv]ehicle', SCC.Level.Two)) %>%
  select(SCC, SCC.Level.Two)

NEI_motor <- inner_join(NEI, SCC_motor, by = "SCC")

#select emissions, year, Baltimore
pmMotor2 <- NEI_motor %>%
  filter(fips == "24510" | fips == "06037") %>%
  select(Emissions, year, fips) %>%
  group_by(fips, year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T))

#change city IDs to names
pmMotor2$fips <- gsub("24510", "Baltimore City", pmMotor2$fips)
pmMotor2$fips <- gsub("06037", "Los Angeles County", pmMotor2$fips)

#plot motor levels 1999-2008 for two cities
plot6 <- ggplot(pmMotor2, aes(factor(year), 
                               Total_Emissions)) +
  geom_bar(stat = "identity") + 
  facet_grid(.~fips) + 
  labs(x = "Year", y = "pm25 Level", 
       title = "Total Motor Emissions by Year for Baltimore & LA")

print(plot6)

#create png of plot
ggsave("plot6.png")