library(tidyverse)
library(ggplot2)

# Read in full community resiliency dataset from the census
url <- 'https://www2.census.gov/programs-surveys/demo/datasets/community-resilience/2022/CRE_22_County.csv'
resiliency_df <- read.csv(url(url))

# Rename columns to lower case
colnames(resiliency_df) <- str_to_lower(colnames(resiliency_df))

# Dataframe summary
glimpse(resiliency_df)

# Subset for California
resiliency_CA <- resiliency_df |> 
  filter(state == 6) 

# Show first 6 rows of data subset  
head(resiliency_CA)

# Histograms of percent of social vulnerabilities across the counties
plot_vul_0 <- hist(resiliency_CA$pred0_pe)
plot_vul_12 <- hist(resiliency_CA$pred12_pe)
plot_vul_3 <- hist(resiliency_CA$pred3_pe)

