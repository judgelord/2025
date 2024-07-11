library(tidyverse)
library(here)

# read email from parent directory
email <- readLines("../email")

googlesheets4::gs4_auth(email=email)

# read from google sheet (requires authorization)
agencies_by_section <- googlesheets4::read_sheet("1CezQULP8zcp6VFUnbRidwJGkU0W8sTYgHoeFGVqQCrY")

# save a csv version
agencies_by_section |> write_csv(file = here("data", "agencies_by_section.csv"))

# inspect for duplicates
agencies_by_section |> distinct() |> add_count(section) |> filter(n>1) |> arrange(section)

racialized_terms <- googlesheets4::read_sheet("1l1_9770eQkGarRRQNUthRtPb_KpeH0TMWUDm0glZnQc")

# save a csv version
racialized_terms |> write_csv(file = here("data", "racialized_terms.csv"))

