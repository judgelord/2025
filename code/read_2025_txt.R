source("code/setup.r")

# read project 2025
text <- here::here("data", "body.txt") %>%
  readLines()

d <- tibble(text = text)

d %<>% mutate(text =
                str_squish(text) %>%
                # fix words broken over line breaks
                str_replace_all("- |", "") %>%
                # fix first words missingh their first letter
                str_replace("^he ", "The ") %>%
                # remove page headers and footers
                str_remove("^2025 Presidential Transition Project$") %>%
                str_remove("Mandate for Leadership: The Conservative Promise$") %>%
                # remove page numbers
                str_remove("^[0-9]*$") %>%
                str_squish()
              ) %>%
  filter(nchar(text)>2)

body_text_clean <- d

# save a smaller file
save(body_text_clean, file = here("data", "body_text_clean.rda"))
