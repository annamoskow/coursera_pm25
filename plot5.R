#Q5: How have motor vehicle emissions changed 1999-2008 
#in Baltimore?

#find code for motor vehicle emissions via SCC
SCC_motor <- SCC %>%
  filter(grepl('[Vv]ehicle', SCC.Level.Two)) %>%
  select(SCC, SCC.Level.Two)

#select emissions, year, Baltimore
pmMotor <- NEI %>%
  filter(fips == 24510) %>%
  select(Emissions, year, fips, SCC) %>%
  inner_join(SCC_motor, by = "SCC") %>%
  group_by(year) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T)) %>%
  select(Total_Emissions, year)

#plot motor levels 1999-2008
plot5 <- ggplot(pmMotor, 
                          aes(factor(year), 
                              Total_Emissions)) + 
  geom_bar(stat = "identity") + 
  labs(x = "Year", y = "Emissions (Tons)", 
       title = "Total Motor Vehicle Related Emissions in Baltimore Over Time")
  
print(plot5)

#save as png
ggsave("plot5.png")