#Q3: Which type of source has seen decreases/increases
#from 1999-2008 in Baltimore?

#select emissions, city (Baltimore), and type for 1999
pmBaltType <- NEI %>%
  select(Emissions, year, fips, type) %>%
  filter(fips == "24510") %>%
  group_by(year, type) %>%
  summarise(Total_Emissions = sum(Emissions, na.rm = T))

#plot pm25 levels for Baltimore 1999-2008 by Type
plot3 <- ggplot(pmBaltType, aes(factor(year),
                                        Total_Emissions, 
                                        fill = type)) +
  geom_bar(stat = "identity") + 
  facet_grid(.~type) + 
  labs(x = "Year", y = "Emissions (Tons)", 
  title = "Baltimore pm2.5 Emissions by Year") 

print(plot3)

#save as png
ggsave("plot3.png")
