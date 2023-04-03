library(tidyverse)
library(waffle)
library(ggplot2)
library(ggtext)


dat <- read_csv("./Day 1 - Part-to-whole/Fatalities.csv")

glimpse(dat)

dat2 <- dat %>% select(state, year, fatal) %>%
  filter(state == "ca" |  state == "fl" | state == "ny") %>%
  group_by(state) %>%
  summarise(death = sum(fatal))


#Create a vector data
parts <- c(`CA` = 35315, `FL` = 19732, `NY` = 15015)

waffle_chart <-  waffle(parts/355, rows=8, size=1, colors=c("#c7d4b6", "#a3aabd", "#a0d0de"), 
       title="Total Fatalities in Three Most Populated States during the 80s ", 
       xlab="One square == 355 ppl",
       legend_pos = "bottom") 

waffle_chart

 CA <- 35315/(35315+19732+15015)
FL <- 19732/(35315+19732+15015)
FL
NY <- 15015/(35315+19732+15015)
NY

### Create a data frame for plot labels
labels = data.frame(text = c("50.4% Fatalities"
                             ,
                             # "between 1982-1988",
                             
                             "28.2% Fatalities"
                             ,
                             # "between 1982-1988",
                             
                             "21.4% is Fatalities in NY"
                             # "between 1982-1988")
                             ),
                    
                    x = c(3.5
                          # , 3.5
                          ,
                          3.5
                          ,
                          # 2.6,
                          3.5
                          # , 3.6
                          ),
                    
                    y = c( 4.2
                           # , 6.9
                           ,
                          4.2
                          # , 7.2
                          ,
                          4.2
                          # , 10.9
                          ),
                    
                    h = c(.25
                          # , .25
                          ,
                          -1.5
                          ,
                           -1.8
                           # ,
                          # 0, 0
                          ))


waffle_chart <- waffle_chart + geom_richtext(data = labels,
                             aes(x = x, y = y , 
                                 label = text,
                                 hjust = h ),
                             size = c(2
                                      , 2
                                      ,
                                      2
                                      # , 2,
                                      # 2, 2
                                      )) 


                             

waffle_chart 




# ,
# 
# 
# 


waffle_chart <-  waffle(parts/355, rows=8, size=1, colors=c("#c7d4b6", "#a3aabd", "#a0d0de"))

, 
                        title="Total Fatalities in Three Most Populated States during the 80s ", 
                        xlab="One square == 355 ppl",
                        legend_pos = "bottom"
                        ) 

waffle_chart 


################################################
# ##CREATE INFOGRAPHICS WITH R
# # devtools::install_github("JohnCoene/echarts4r.assets")
# library(echarts4r.assets)
# 
# #Use Icon in Waffle
# ### USE ICON IN WAFFLE ###
# ###DOWNLOAD AND INSTALL FONTAWESOME FROM THIS URL:
# ###https://github.com/FortAwesome/Font-Awesome/tree/master/webfonts. 
# ###You need to download these 3 files - fa-solid-900.ttf, fa-regular-400.ttf and 
# ###fa-brands-400.ttf
# ###
# library(extrafont)
# 
# ###Import downloaded fontawesome font by using this command. Make sure to specify your 
# ###folder location containing fontawesome.
# extrafont::font_import (path="C:\\Users\\Zoey Lu\\Downloads", pattern = "fa-", prompt =  FALSE)
# 
# ###Load fonts 
# loadfonts(device = "win")
# 
# ###Check whether font awesome is installed successfully by running this command
# extrafont::fonttable() %>% 
#   dplyr::as_tibble() %>% 
#   dplyr::filter(grepl("Awesome", FamilyName)) %>% 
#   select(FamilyName, FontName, fontfile)
# 
# 
# ###add new font families to 'sysfonts'
# library(showtext)
# 
# font_add(family = "FontAwesome6Brands-Regular", regular = "C:\\Users\\Zoey Lu\\Downloads\\fa-brands-400.ttf")
# font_add(family = "FontAwesomev4Compatibility-Regular", regular = "C:\\Users\\Zoey Lu\\Downloads\\fa-v4compatibility.ttf")
# font_add(family = "FontAwesome6Free-Solid", regular = "C:\\Users\\Zoey Lu\\Downloads\\fa-solid-900.ttf")
# showtext_auto()
# 
# fonts()[grep("Awesome", fonts())]
# 
# ### The option use_glyph= refers to icon you want to show in the chart and
# ### glyph_size= refers to size of the icon.
# 
# 
# 
# waffle(
#   c(`Poor=10` =10, `Average=18` = 18, `Excellent=7` =7), rows = 5, colors = c("#FD6F6F", "#93FB98", "#D5D9DD"),
#   use_glyph = "child" ,title = 'Girls Performance', legend_pos="bottom")
# 
# 
# load.fontawesome(font = "fontawesome-webfont.ttf")
# 
# waffle(parts/355, rows = 8, colors = c("#FD6F6F", "#93FB98", "#D5D9DD"),
#        use_glyph = "female", glyph_size = 12 )
# 
#        )
# ,
#   
#   
#  ,
#   title="Total Fatalities in Three Most Populated States during the 80s ", 
#   xlab="One square == 355 ppl",
#   legend_pos = "bottom")
# 
# 
# waffle::fa_grep("male")
