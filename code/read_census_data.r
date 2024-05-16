library(tidyverse)

# Read in full community resiliency dataset from the census
url <- 'https://www2.census.gov/programs-surveys/demo/datasets/community-resilience/2022/CRE_22_County.csv'
resiliency_df_2022 <- read.csv(url(url))

url <- 'https://www2.census.gov/programs-surveys/demo/datasets/community-resilience/2021/CRE_21_County.csv'
resiliency_df_2021 <- read.csv(url(url))

url <- 'https://www2.census.gov/programs-surveys/demo/datasets/community-resilience/2019/CRE_19_County.csv'
resiliency_df_2019 <- read.csv(url(url))

# Dataframe summary
glimpse(resiliency_df_2022)

# Subset data for california
resiliency_CA_merge <- resiliency_df_2019 |>
  left_join(resiliency_df_2021, by = "GEO_ID") |>
  left_join(resiliency_df_2022, by = "GEO_ID") |>
  filter(STATE.x == 6) %>%
  select(GEO_ID, STATE, COUNTY, NAME, POPUNI.x, PRED0_PE.x, PRED12_PE.x, PRED3_PE.x, 
        POPUNI.y, PRED0_PE.y, PRED12_PE.y, PRED3_PE.y,
        POPUNI, PRED0_PE, PRED12_PE, PRED3_PE)
  
colnames(resiliency_CA_merge) <- str_to_lower(colnames(resiliency_CA_merge))

colnames(resiliency_CA_merge) <- c('geo_id', 'state', 'county',  'name', 
                                   'popuni_2019', 'pred0_pe_2019', 'pred12_pe_2019',
                                   'pred3_pe_2019', 'popuni_2021', 'pred0_pe_2021', 
                                   'pred12_pe_2021', 'pred3_pe_2021', 'popuni_2022', 
                                   'pred0_pe_2022', 'pred12_pe_2022', 'pred3_pe_2022')

# View final DF
View(resiliency_CA_merge)

# Final DF Info
str(resiliency_CA_merge)

# Show first 6 rows of final dataset
head(resiliency_CA_merge)
