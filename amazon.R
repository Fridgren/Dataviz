#===============
# LOAD PACKAGES
#===============

library(readr)
library(tidyverse)
library(stringr)

#==========
# READ DATA
#==========

stock_amzn <- read_csv("AMZN_stock.csv")

#========
# INSPECT
#========

stock_amzn %>% names()
stock_amzn %>% head()

#=========================================================
# CHANGE COLUMN NAMES: lower case
# - in the raw form (as read in) the first letter of 
#   each variable is capitalized. 
# - This makes them harder to type!  Not ideal.
# - we'll use stringr::str_to_lower() to change the column
#   names to lower case 
#=========================================================

colnames(stock_amzn) <- colnames(stock_amzn) %>% str_to_lower()

# inspect
stock_amzn %>% names()


#======
# PLOT 
#======

#--------------------------------------
# FIRST ITERATION
# - this is the quick-and-dirty version
#--------------------------------------

ggplot(data = stock_amzn, aes(x = date, y = close)) +
  geom_line()


#--------------------------------------
# POLISHED VERSION
# - this is the 'finalized' version
# - we arrive at this after a lot of
#   itteration ....
#--------------------------------------

ggplot(stock_amzn, aes(x = date, close)) +
  geom_line(color = 'cyan') +
  geom_area(fill = 'cyan', alpha = .1) +
  labs(x = 'Date'
       , y = 'Closing\nPrice'
       , title = "Amazon's stock price has increased dramatically\nover the last 20 years") +
  theme(text = element_text(family = 'Gill Sans', color = "#444444")
        ,panel.background = element_rect(fill = '#444B5A')
        ,panel.grid.minor = element_line(color = '#4d5566')
        ,panel.grid.major = element_line(color = '#586174')
        ,plot.title = element_text(size = 28)
        ,axis.title = element_text(size = 18, color = '#555555')
        ,axis.title.y = element_text(vjust = 1, angle = 0)
        ,axis.title.x = element_text(hjust = 0)
  ) 
