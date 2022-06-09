library(tidyverse)
library(readxl)
library(lubridate)

# Load data
cpi = read_excel('./Data/4_1_7_amc_indice_y_variaciones_serie_desde_1950.xls',
                 skip = 8,
                 col_names = c('date', 'cpi', 'percent_change'))

# Data cleaning
cpi = cpi %>%
  mutate(year = str_extract(date, '[0-9]{4}')) %>%
  fill(year) %>%
  filter(!is.na(cpi)) %>%
  mutate(month = case_when(date == 'Enero' ~ 1,
                           date == 'Febrero' ~ 2,
                           date == 'Marzo' ~ 3,
                           date == 'Abril' ~ 4,
                           date == 'Mayo' ~ 5,
                           date == 'Junio' ~ 6,
                           date == 'Julio' ~ 7,
                           date == 'Agosto' ~ 8,
                           date == 'Septiembre' ~ 9,
                           date == 'Octubre' ~ 10,
                           date == 'Noviembre' ~ 11,
                           date == 'Diciembre' ~ 12),
         date = ym(paste(year, month))) %>%
  select(date, cpi)

# Save clean csv
write_csv(cpi, './Data/Monthly CPI 1950-2022 Venezuela.csv')