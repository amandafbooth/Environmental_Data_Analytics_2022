library(tidyverse)
library(dplyr)

Scope3 <- read.csv("./Data/Raw/Scope3.csv")

Scope3.exclusions <- Scope3 %>%
  select(X.3:X.26) %>%
filter(row_number() >= 59)

Scope3.exlusions.v2 <- Scope3.exclusions
colnames(Scope3.exlusions.v2) <- Scope3.exclusions[1, ]     

Scope3.exlusions.v2 <- Scope3.exlusions.v2[- 1, ] 

Scope3.calculations <- Scope3 %>%
  select(X.3:X.49)%>%
  filter(row_number() >= 6, row_number() <= 28)

Scope3.calculations.v2 <- Scope3.calculations
colnames(Scope3.calculations.v2) <- Scope3.calculations[1, ]     

Scope3.calculations.v2 <- Scope3.calculations.v2[- 1, ] 
Scope3.calculations.v2 <- Scope3.calculations.v2[- 2, ] 
Scope3.calculations.v2 <- Scope3.calculations.v2[- 1, ]
Scope3.calculations.v2 <- Scope3.calculations.v2[- 1, ]

write.csv(Scope3.calculations.v2,
          row.names = FALSE,
          file = "./Data/Processed/Scope3.calculations.v2.csv")

write.csv(Scope3.exlusions.v2,
          row.names = FALSE,
          file = "./Data/Processed/Scope3.exlusions.v2.csv")


