###################
# FIND RACIALIZED WORDS

source(here::here("code", "setup.r"))

# Load parsed document
here("data", "body_parsed.rda") %>% load()

d <- body_parsed

# get terms from google sheet via get_keywords.R
racialized_terms <- read_csv(here("data", "racialized_terms.csv"))


# make a regex OR statement
terms <- paste(racialized_terms$racialized_terms, collapse  = "\\b|\\b") %>%
  str_replace("Illegal\\\\b", "Illegal Immig")
terms

# count the number of times these appear per line
d %<>% mutate(racialized_term_count = str_ext_all(text, terms) %>% lengths(),
              racialized_terms = str_ext_all(text, terms)
)

d$racialized_terms  %<>% map(str_to_lower) %>% map(unique)


# take a look #FIXME racialized_terms is not collapsing
d_select <- d %>% filter(racialized_term_count > 1) %>%
  select(section, department, agency, subagency_name, subagency_acronym, acronyms_mentioned, agencies_mentioned, racialized_terms, text)

d_select %>% kablebox()

# save rdata version with lists
racialized_terms_per_section <- d_select
save(racialized_terms_per_section, file = here("data", "racialized_terms_per_section.rda"))

# I should stop pushing versions of this to github; it is getting large
d_select %>% group_by(text) %>% mutate_all(paste) %>%
  write_csv(file = here("data", "racialized_terms_per_agency.csv"))


# counts by section header
d_section <- d %>%
  group_by(section) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_section


d_department <- d %>%
  unnest(department) %>% #pull(acronym)
  group_by(department) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_department %>% kablebox()


d_agency <- d %>%
  unnest(agency) %>% #pull(acronym)
  group_by(agency) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_agency %>% kablebox()

d_agencies_mentioned <- d %>%
  unnest(agencies_mentioned) %>% #pull(acronym)
  group_by(agencies_mentioned) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_agencies_mentioned %>% kablebox()


d_acronym <- d %>%
  unnest(acronyms_mentioned) %>% #pull(acronym)
  group_by(acronym) %>%
  summarise(n = sum(racialized_term_count)) %>%
  arrange(-n)
d_acronym %>% kablebox()



d_section %<>% write_csv(here("data", "racialized_term_counts.csv"))

d_department %<>% write_csv(here("data", "racialized_term_counts_department.csv"))

d_agency %<>% write_csv(here("data", "racialized_term_counts_agency.csv"))

d_agencies_mentioned %<>% write_csv(here("data", "racialized_term_counts_agencies_mentioned.csv"))

d_acronym %<>% write_csv(here("data", "racialized_term_counts_acronym.csv"))

