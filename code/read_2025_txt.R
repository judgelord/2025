source("code/setup.r")

# read project 2025
text <- here::here("data", "body.txt") %>%
  readLines()

d <- tibble(text = text)

d %<>% mutate(text = str_squish(text)) %>%
  filter(nchar(text)>2)

# save a smaller file
save(d, file = here("data", "body.rda"))
