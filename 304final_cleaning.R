
library(tidyverse)

covid19_cases <- read_csv("/Users/yaoyao/Documents/University of Toronto/Sta304/Final_Project/COVID19cases.csv")

covid19_cases<-covid19_cases%>%select(Assigned_ID,`Age Group`,
                                      `Neighbourhood Name`,`Source of Infection`,
                                      `Client Gender`,`Ever Hospitalized`)

covid19_cases<-covid19_cases%>%rename(ID=Assigned_ID,
                                      age_group=`Age Group`,
                                      neighbourhood=`Neighbourhood Name`,
                                      source_of_infection=`Source of Infection`,
                                      gender=`Client Gender`,
                                      ever_hospitalized=`Ever Hospitalized`)

covid19_cases<-covid19_cases%>%mutate(ever_in_hospital=ifelse(ever_hospitalized=="Yes",1,0))

covid19_cases<-covid19_cases%>%filter(age_group!='NA')

covid19_cases<-covid19_cases%>%filter(neighbourhood!='NA')

covid19_cases<-covid19_cases%>%filter(source_of_infection!='Unknown/Missing')

covid19_cases<-covid19_cases%>%filter(gender!='UNKNOWN')

write_csv(covid19_cases, "covid19_cases_cleaned.csv")
