###################
# FIND RACIALIZED WORDS

source(here::here("code", "setup.r"))

# Load parsed document
here("data", "body_parsed.rda") %>% load()

d <- body_parsed

terms <- c("woke")

# make a regex OR statement
terms <- paste(terms, sep = "|")
terms

# count the number of times these appear per line
d %<>% mutate(term_count = str_ext_all(text, terms) %>% lengths(),
              terms = str_ext_all(text, terms)
)

d$terms  %<>% map(str_to_lower) %>% map(unique)


# take a look #FIXME terms is not collapsing
d_select <- d %>% filter(term_count > 0) %>%
  select(section, department, agency, subagency_name, subagency_acronym, acronyms_mentioned, agencies_mentioned, terms, text)

d_select %>% kablebox()

# save rdata version with lists
terms_per_section <- d_select
save(terms_per_section, file = here("data", "terms_per_section.rda"))

# I should stop pushing versions of this to github; it is getting large
d_select %>% group_by(text) %>% mutate_all(paste) %>%
  write_csv(file = here("data", "terms_per_agency.csv"))


# counts by section header
d_section <- d %>%
  group_by(section) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_section

# counts by hand-coded department
d_department <- d %>%
  unnest(department) %>%
  group_by(department) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_department %>% kablebox()

d_department |>
  filter(n > 0, n != "NA") |>
  drop_na(department) |>
ggplot()+
  aes(x= department, y = n) +
  geom_col() +
  coord_flip() +
  labs(title = paste('Number of times Project 2025 mentions\n"', terms, '" by Department'))

# counts by hand-coded department
d_agency <- d %>%
  unnest(agency) %>%
  group_by(agency) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_agency %>% kablebox()

# counts by agencies or department acronyms mentioned
d_agencies_mentioned <- d %>%
  unnest(agencies_mentioned) %>%
  group_by(agencies_mentioned) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_agencies_mentioned %>% kablebox()

# counts by all acronyms mentioned
d_acronym <- d %>%
  unnest(acronyms_mentioned) %>%
  group_by(acronyms_mentioned) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_acronym %>% kablebox()



d_section %<>% write_csv(here("data", "term_counts.csv"))

d_department %<>% write_csv(here("data", "term_counts_department.csv"))

d_agency %<>% write_csv(here("data", "term_counts_agency.csv"))

d_agencies_mentioned %<>% write_csv(here("data", "term_counts_agencies_mentioned.csv"))

d_acronym %<>% write_csv(here("data", "term_counts_acronym.csv"))

