#1. LOAD packages
if(!require("dplyr"))install.packages("dplyr")
if(!require("readxl"))install.packages("readxl")

#2 SET WORKING DIRECTORY
setwd('C:/Users/diana/OneDrive/R/TITANIC')

#3 UPLOAD DATA
TITANICCOPY <- read_excel("TITANICCOPY.xls")

#4. HOW MANY ROWS IN THE TITANIC FILE?
ncol(TITANICCOPY)
#14

#5.HOW MANY ROWS IN THE TITIANIC FILE?
nrow(TITANICCOPY)
#1309

#6. WHATARE THE COLUMN HEADINGS TO THIS FILE?
colnames(TITANICCOPY)
# [1] "PASSENGER CLASS"             "SURVIVED"                    "NAME"                        "SEX"                         "AGE"                        
#[6] "SIBILINGS OR SPOUSE ABOARD"  "PATIENTS OR CHILDREN ABROAD" "TICKET"                      "FARE"                        "CABIN"                      
#[11] "EMBARKATION"                 "LIFEBOAT"                    "BODY NUMBER"                 "HOME DESTINATION"


if(!require("janitor"))install.packages("janitor")
if(!require("tidyverse"))install.packages("tidyverse")
if(!require("openxlsx"))install.packages("openxlsx")

#7. VIEW DATA FURTHER TO SEE THE TYPE OF HEADINGSTHEY HAVE
glimpse(TITANICCOPY)

#8 HOW MANY PASSENGERS ON BOARD THE TITANIC
table(TITANICCOPY$`PASSENGER CLASS`, TITANICCOPY$SEX)

#9. TOTAL FEMALE AND MALES ON THE TITANIC
table(TITANICCOPY$SEX)


#10.WHAT ARE THE AGEST OF THOSE ON THE BOAT THATARE MALE AND FEMALE?
table(TITANICCOPY$SEX, TITANICCOPY$AGE)
b

#11 HOW MANY SURVIVED THE TITANIC?
table(TITANICCOPY$SURVIVED)

#12 THEONE DIED OR SURVIVED WERE THEY FEMALE OR MALE?
table(TITANICCOPY$SEX, TITANICCOPY$SURVIVED)

#13 WHAT TYPE OF CABIN AND COST DID THEY STAY IN?
table(TITANICCOPY$FARE, TITANICCOPY$CABIN)


#WHO PAID THE MOST MALES OR FEMALES IN THE CABIN?
table(TITANICCOPY$SEX, TITANICCOPY$FARE)

###ggplot###################################################
library(ggplot2)
library(tidyverse)
glimpse(TITANICCOPY)

names(TITANICCOPY)

TITANICCOPY %>%
  drop_na(SEX) %>% #No. of people on the Titanic by sex
  ggplot(aes(x = SEX))+
  geom_bar(fill = "#FF33F9") +
  #coord_flip()+
  theme_bw()+
  labs(x = "Total By Sex", #place sex on the x axis
       y = NULL,  #No label on the yaxis
       title = "How many people was on the Titanic?") #title
  

ggsave("TITANICCOPY.png")
install.packages("latex2exp")
