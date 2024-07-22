###################
# FIND RACIALIZED WORDS

source(here::here("code", "setup.r"))

# Load parsed document
load(here("data", "body_parsed.rda"))

d <- body_parsed

# terms <- c("woke")

# make a regex OR statement
terms <- paste(terms, collapse = "|")
terms

# for plots
Terms <- str_replace(terms, "\\|.*", ", etc.")
Terms

# count the number of times these appear per line
d %<>%
  #group_by(text) %>%
  mutate(terms = text %>%
           str_ext_all(terms) ) %>%
  mutate(term_count = terms %>% lengths() )

head(d$term_count)
head(d$terms)

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

d_department_plot <- d_department |>
  filter(n > 0, n != "NA") |>
  drop_na(department) |>
ggplot()+
  aes(x= reorder(department, n), y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" by Department'))

# counts by hand-coded agency
d_agency <- d %>%
  unnest(agency) %>%
  group_by(agency) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_agency %>% kablebox()

d_agency_plot <- d_agency |>
  filter(n > 0, n != "NA") |>
  drop_na(agency) |>
  ggplot()+
  aes(x= reorder(agency, n),
      y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" by Agency'))

# counts by hand-coded subagency
d_subagency_name <- d %>%
  drop_na(subagency_name) %>%
  unnest(subagency_name) %>%
  group_by(subagency_name) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_subagency_name %>% kablebox()

d_subagency_name_plot <- d_subagency_name |>
  drop_na(subagency_name) |>
  filter(n > 0) |>
  ggplot()+
  aes(x= reorder(subagency_name, n),
      y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" by Agency'))
d_subagency_name_plot

# counts by hand-coded subagency
d_subagency_acronym <- d %>%
  drop_na(subagency_acronym) %>%
  unnest(subagency_acronym) %>%
  group_by(subagency_acronym) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_subagency_acronym %>% kablebox()

d_subagency_acronym_plot <-  d_subagency_acronym |>
  drop_na(subagency_acronym) |>
  filter(n > 0) |>
  ggplot()+
  aes(x= reorder(subagency_acronym, n),
      y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" by Agency'))
d_subagency_acronym_plot

# counts by agencies or department acronyms mentioned
d_agencies_mentioned <- d %>%
  unnest(agencies_mentioned) %>%
  group_by(agencies_mentioned) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_agencies_mentioned %>% kablebox()

d_agencies_mentioned_plot <- d_agencies_mentioned |>
  drop_na(agencies_mentioned) |>
  filter(n > 0) |>
  ggplot()+
  aes(x= reorder(agencies_mentioned, n),
      y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" in the Same Paragraph'))
d_agencies_mentioned_plot


# counts by all acronyms mentioned
d_acronym <- d %>%
  unnest(acronyms_mentioned) %>%
  group_by(acronyms_mentioned) %>%
  summarise(n = sum(term_count)) %>%
  arrange(-n)
d_acronym %>% kablebox()


d_acronym_plot <- d_acronym |>
  drop_na(acronyms_mentioned) |>
  filter(n > 0) |>
  ggplot()+
  aes(x= reorder(acronyms_mentioned, n),
      y = n) +
  geom_col() +
  coord_flip() +
  labs(x = "", y = "",
       title = paste('Number of times Project 2025 \nmentions "', Terms,
                     '" in the Same Paragraph'))
d_acronym_plot


if(F){
d_section %<>% write_csv(here("data", "term_counts.csv"))

d_department %<>% write_csv(here("data", "term_counts_department.csv"))

d_agency %<>% write_csv(here("data", "term_counts_agency.csv"))

d_agencies_mentioned %<>% write_csv(here("data", "term_counts_agencies_mentioned.csv"))

d_acronym %<>% write_csv(here("data", "term_counts_acronym.csv"))
}
