# load data
library(tidyverse)
library(psych)
library(knitr)

stressEcho.data <- read.csv('https://raw.githubusercontent.com/niteen11/MSDS/master/DATA606/ProjectProposal/dataset/stressEcho.csv')

#Research Question 2
rq1.heartRate <- select(stressEcho.data,maxhr,newMI,newPTCA,newCABG,death)

#Research Question 2
rq2.stressEcho <- select(stressEcho.data,X,posSE,newMI,newPTCA,newCABG,death)
rq2.stressEcho <- rename(rq2.stressEcho,id=X)
#per data file: posse   stress echocardiogram was positive (1  = yes)
stress.positive <- filter(rq2.stressEcho,posSE==1)
stress.negative <- filter(rq2.stressEcho,posSE==0)

#Research Question 3
rq3.restWMA<- select(stressEcho.data,X,restwma,newMI,newPTCA,newCABG,death)
rq3.restWMA <- rename(rq3.restWMA,id=X)
#per data file: restwma cardiologist sees wall motion anamoly on echocardiogram (1 = yes)
restWMA.positive <- filter(rq3.restWMA,restwma==1)
restWMA.negative <- filter(rq3.restWMA,restwma==0)

#Research Question 4
rq4.age.ecg<- select(stressEcho.data,age,ecg,newMI,newPTCA,newCABG,death)
# there are 3 categories of ecw diagnosis: equivocal, MI and Normal
ecg.equivocal <- filter(rq4.age.ecg,ecg=='equivocal')
ecg.MI <- filter(rq4.age.ecg,ecg=='MI')
ecg.normal <- filter(rq4.age.ecg,ecg=='normal')
