library(tidyverse)
library(here)

# read email from parent directory
email <- readLines("../email")

googlesheets4::gs4_auth(email=email)

# read from google sheet (requires authorization)
racialized_terms <- googlesheets4::read_sheet("1l1_9770eQkGarRRQNUthRtPb_KpeH0TMWUDm0glZnQc")

# save a csv version as a backup
racialized_terms |> write_csv(file = here("data", "racialized_terms.csv"))
