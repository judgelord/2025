###################
# FIND RACIALIZED WORDS

source(here::here("code", "setup.r"))

# Load parsed document
here("data", "body_parsed.rda") %>% load()

d <- body_parsed

# get terms from google sheet via get_keywords.R
racialized_terms <- read_csv(here("data", "racialized_terms.csv"))


# make a regex OR statement
terms <- paste(racialized_terms$racialized_terms, collapse  = "|") %>%
  str_replace("Black", "Black\b") %>%
  str_replace("Illegal", "Illegal Immig") %>%
  str_replace("DACA", "\bDACA\b")
terms

# count the number of times these appear
d %<>% mutate(racialized_term_count = str_ext_all(text, terms) %>% lengths(),
              racialized_terms = str_ext_all(text, terms) %>% paste(sep = ";") #FIXME
)

# take a look #FIXME racialized_terms is not collapsing
d %>% filter(racialized_term_count > 1) %>%
  select(section, racialized_terms, text) %>%
  kablebox()

d %>% filter(racialized_term_count > 1) %>%
  select(section, racialized_terms, text) %>%
  write_csv(file = here("data", "racialized_terms_per_agency.csv"))


# counts by section header
d_section <- d %>%
  group_by(section) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_section

d_acronym <- d %>%
  unnest(acronym) %>% #pull(acronym)
  group_by(acronym) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_acronym

d_department <- d %>%
  unnest(department) %>% #pull(acronym)
  group_by(department) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_department %>% kablebox()



d_section %<>% write_csv(here("data", "racialized_term_counts.csv"))

d_acronym %<>% write_csv(here("data", "racialized_term_counts_acronym.csv"))

d_department %<>% write_csv(here("data", "racialized_term_counts_department.csv"))

