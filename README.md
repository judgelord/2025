

Please cite:

> Judge-Lord, Devin and Karla Magana. 2024. A Dataset for Text Analysis
> of Project 2025. https://github.com/judgelord/2025

The raw Project 2025 body text (parsed by paragraph and cleaned up a
bit):

- [data/body_text_clean.rda](data/body_text_clean.rda)

``` r
load(here::here("data", "body_text_clean.rda"))

body_text_clean$text[1:3]
```

    [1] "Section One"                                                                                                                                                                                                                   
    [2] "TAKING THE REINS OF GOVERNMENT"                                                                                                                                                                                                
    [3] "merica’s Bicentennial, which culminated on July 4, 1976, was a spirited and unifying celebration of our country, its Founding, and its ideals. As we approach our nation’s 250th anniversary, which will take place during the"

A hand-coded crosswalk of the most relevant agency by section:

- [data/agencies_by_section.csv](data/agencies_by_section.csv)
- [data/agencies_by_section.rda](data/agencies_by_section.rda)

``` r
load(here::here("data", "agencies_by_section.rda"))

agencies_by_section |> head()
```

                               section                        department agency
    1   TAKING THE REINS OF GOVERNMENT                              <NA>   <NA>
    2               WHITE HOUSE OFFICE EXECUTIVE OFFICE OF THE PRESIDENT    EOP
    3                   CHIEF OF STAFF EXECUTIVE OFFICE OF THE PRESIDENT    EOP
    4           DEPUTY CHIEFS OF STAFF EXECUTIVE OFFICE OF THE PRESIDENT    EOP
    5 PRINCIPAL DEPUTY CHIEFS OF STAFF EXECUTIVE OFFICE OF THE PRESIDENT    EOP
    6                  SENIOR ADVISERS EXECUTIVE OFFICE OF THE PRESIDENT    EOP
                        subagency_name subagency_acronym other_aliases
    1                             <NA>              <NA>          <NA>
    2               WHITE HOUSE OFFICE              <NA>          <NA>
    3                             <NA>              <NA>          <NA>
    4           DEPUTY CHIEFS OF STAFF              <NA>          <NA>
    5 PRINCIPAL DEPUTY CHIEFS OF STAFF              <NA>          <NA>
    6                  SENIOR ADVISERS              <NA>          <NA>

The Project 2025 body text, parsed by section, merged with the
crosswalk, and department, agency, and other acronyms extracted from the
text:

- [data/body_parsed.rda](data/body_parsed.rda)

``` r
library(dplyr)

load(here::here("data", "body_parsed.rda"))

body_parsed[127,] |> mutate(across(everything(), as.character))
```

    # A tibble: 1 × 10
      text  section department agency subagency_name subagency_acronym other_aliases
      <chr> <chr>   <chr>      <chr>  <chr>          <chr>             <chr>        
    1 The … OFFICE… EXECUTIVE… EOP    OFFICE OF PUB… OPL               <NA>         
    # ℹ 3 more variables: departments_mentioned <chr>, agencies_mentioned <chr>,
    #   acronyms_mentioned <chr>
