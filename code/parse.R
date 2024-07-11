source("code/setup.r")



# load rda version of 2025 text from read_2025_txt.R
load(here("data", "body_text_clean.rda"))

agencies_by_section <- read_csv(here("data", "agencies_by_section.csv"))

d <- body_text_clean

head(d)

# identify departments and acronyms to help consolidate (TODO)
departments <- d$text %>%
  str_extract_all("DEPARTMENT OF.*|.* DEPARTMENT") %>%
  unique() %>%
  na.omit() %>%
  as.character() %>%
  str_remove("MISSION STATEMENT FOR A REFORMED|OTHER STRUCTURAL REFORMS THAT THE|RENEWING THE |BIDEN ADMINISTRATION| AND RELATED.*|.*WITHIN THE DEPARTMENT| AND RELATED AGENCIES") %>%
  str_squish() %>%
  unique()

departments <- departments[nchar(departments) > nchar("DEPARTMENT OF")]

departments

acronyms <- d$text %>% str_extract("\\([A-Z][A-Z][A-Z|-]*\\)") %>% unique() %>% na.omit() %>% as.character()

acronyms <- acronyms[nchar(acronyms) > 4] # FIXME This removes VA and OE and a few otheres that are real agencies

acronyms


# CLEAN UP TEXT
# remove strings that look like section headers but are not
  # or sub-headers where there is an agency above
  remove <-   "PUTTING AMERICAN WORKERS|RESTORING THE|’S INTEGRITY| OFFICE OF OPERATIONS COORDINATION|CLAIMS VS|AMERICAN INDIANS AND|REGARDING ALASKA|BETTER CAPITAL MARKETS|ENTREPRENEURIAL CAPITAL FORMATION|AND RELATED AGENCIES|ENTREPRENEURIAL CAPITAL FORMATION|DIGITAL ASSETS| ADMINISTRATION AND IMPROVED COMMODITIES AND DERIVATIVES MARKETS|IMPROVED REGULATION OF THE INDUSTRY AND SROS|OTHER ACTIONS|FIRST|LONGER|OFFICE OF THE SECRETARY|OFFICE OF STRATEGY, POLICY, AND PLANS|MANAGEMENT DIRECTORATE|PLCY|FOREIGN INTELLIGENCE SURVEILLANCE ACT|PREVENTING THE ABUSE OF INTELLIGENCE FOR PARTISAN PURPOSES| ORGANIZATIONAL|COVERT ACTION| REQUIRES|OTHER STRUCTURAL REFORMS THAT THE |PROGRAM AND OFFICE PRIORITIZATION WITHIN THE DEPARTMENT|ADDITIONAL|NEW REGULATIONS|STATEMENT FOR A REFORMED |AMERICAN ENERGY AND SCIENCE DOMINANCE| AND RELATED COMS|^NEW|AGENCY POLICIES THAT DON’T REQUIRE NEW LEGISLATION OR REGULATIONS TO ENACT|POLICIES/REGULATIONS THAT REQUIRE COORDINATION WITH OTHER AGENCIES AND/OR THE WHITE HOUSE|THAT THE PRESIDENT SHOULD ISSUE|NEW REGULATIONS|ADMINISTRATOR’S OFFICE AND REORGANIZATION RESPONSIBILITY|COVID|EMERGENCY PREPAREDNESS|AFFORDABLE CARE ACT AND PRIVATE HEALTH INSURANCE|LEGISLATIVE PROPOSALS|LIFE, CONSCIENCE, AND BODILY INTEGRITY| REFORM PILLARS|FIRST|LONGER|BUDGET STRUCTURE|RESTORING AMERICAN ENERGY DOMINANCE|ADMINISTRATION PRIORITIES|ONSHORE|IMMEDIATE ACTIONS|PURSUING A NATIONAL SECURITY AGENDA AIMED AT EXTERNAL STATE AND NON|DISMANTLING DOMESTIC AND INTERNATIONAL CRIMINAL ENTERPRISES|RENEWING THE DEPARTMENT’S FOCUS ON VIOLENT CRIME|PRIORITIZING THE PROTECTION OF PUBLIC SAFETY|IMMEDIATE ACTIONS REGARDING ALASKA| ADMINISTRATION AND IMPROVED COMMODITIES AND DERIVATIVES MARKETS|NECESSARY BORDER AND IMMIGRATION STATUTORY, REGULATORY, AND ADMINISTRATIVE CHANGES|STATEMENT|PRIMARY RECOMMENDATION| AND RELATED AGENCIES|ANTI-MONEY LAUNDERING AND BENEFICIAL OWNERSHIP REPORTING REFORM|PUBLIC–PRIVATE PARTNERSHIPS|EMERGING TECHNOLOGIES|BUILD AMERICA BUREAU|PRIMARY RECOMMENDATION|PRIMARY RECOMMENDATION|STATEMENT|NECESSARY BORDER AND IMMIGRATION STATUTORY, REGULATORY, AND ADMINISTRATIVE CHANGES|PROGRAM AND OFFICE PRIORITIZATION WITHIN THE DEPARTMENT|OTHER STRUCTURAL REFORMS THAT THE | REQUIRES|NEW REGULATIONS|THAT THE PRESIDENT SHOULD ISSUE|PRO |EDUCATION AND VOCATIONAL TRAINING|RELIGION| AND RELATED AGENCIES|THE ECONOMY|^AGENCY$|AGENCY POLICIES THAT DON’T REQUIRE NEW LEGISLATION OR REGULATIONS TO ENACT|REFORM PILLARS|BIDEN ADMINISTRATION |OTHER REFORMS|BACKGROUND|MINIMUM EFFECTIVE REFORMS|MONETARY RULE REFORM OPTIONS|BROAD |FOR 2025 AND BEYOND|ANALYSIS AND|OVERVIEW|ENDNOTES|YES, TRADE DEFICITS MATTER|INDEX|OVERVIEW AND BACKGROUND|POLICY PRIORITIES|SOURCE|SOURCES|TABLE|AUTHOR’S|AUTHORS|NOTE|FIGURE|HTML|PLAW|CAA Section|CHART|MATH|READING|AVERAGE SCORES|FOURTH-GRADE|EIGHTH-GRADE|NEEDED REFORMS|RECOMMENDATIONS|MAJOR PRIORITY ISSUES AND SPECIFIC RECOMMENDATIONS|PERSONNEL|DEFUNDING THROUGH THE BUDGETARY PROCESS|PUBLIC INTEREST VS. PRIVILEGE|MISSION|KEY ISSUES|REGIONS|ORGANIZATIONAL ISSUES|NECESSARY REFORMS|ATTEMPTS AT REFORM|ADDITIONAL AREAS FOR REFORM|EXECUTIVE ORDER|DEFENSE-INDO-PACIFIC-STRATEGY-REPORT-2019.PDF|CONCLUSION|SHAPING THE FUTURE|HISTORY AND CONTEXT|POLITICAL LEADERSHIP AND BUREAUCRATIC LEADERSHIP AND SUPPORT|RIGHTING THE SHIP|PIVOTING ABROAD|OTHER INTERNATIONAL ENGAGEMENTS|SHAPING THE FUTURE|POLITICAL LEADERSHIP AND BUREAUCRATIC LEADERSHIP AND SUPPORT|AGENCY RELATIONSHIPS"

# clean up text
d %<>% mutate(text = text %>%
    #remove extra white spac
    str_squish() %>%
    str_remove_all(remove) %>%
  str_replace("ESA obligations", "Endangered Species Act obligations") %>%
  str_replace("DEPARTMENT ORGANIZATION", "DEPARTMENT")
)

# identify section headers
d %<>% mutate(section = str_extract(text, "^[A-Z][A-Z][A-Z][A-Z| |-|/|’|!|#|[0-9]|,|“|”]*") %>%
                # clea up strings
                str_squish() %>% str_remove("’$|,$| [A-Z]$|^ESG|^INTRODUCTION|^NATO") %>%
                str_remove_all(remove) %>%
                str_replace("DEPARTMENT OF DEFENSE|DOD .*|NUCLEAR DETERRENCE|MISSILE DEFENSE|SPECIAL OPERATIONS FORCES", "DOD") %>%
                str_replace("SEC ADMINISTRATION", "SEC") %>%
                str_replace(" COM$", " COMMISSION") %>%
                str_replace("HEALTH RES AND SERVICES ADMINISTRATION" ,"HRSA") %>%
                str_squish()
)

# drop headers shorter than 3 letters
d %<>% mutate(section = ifelse(nchar(section) < 3, NA, section))


# inspect section headers in order
d$section %>% unique()

# fill down
d %<>% fill(section)

head(d, 100)
tail(d)




###############################
## merge in hand-coded department's and agencies
d %<>% left_join(agencies_by_section)

# inspect
d |> drop_na(section) |> kablebox()



###############################
# extract department
department_strings <- paste(departments, collapse = "|")
department_strings

d %<>% group_by(text) %>%
  # NOT CASE SENSITIVE!
  mutate(departments_mentioned = str_ext_all(text, department_strings) )

d$departments_mentioned %<>% map(unique) %<>% map(str_to_upper)

# inspect
keep(d$departments_mentioned, \(x) length(x) > 0)

# replace chr 0 with NA, paste lists together
d %<>%
  mutate(departments_mentioned = ifelse(
    departments_mentioned == "character(0)", NA,
    departments_mentioned # to keep as list
    #str_c(department, collapse = ";", sep = ";") #  FIXME to collapse as string
    )
  )




###############################
# extract agency (From hand-coded list )
agency_strings <- c(agencies_by_section$agency, agencies_by_section$subagency_acronym) %>%
  unique()  %>%
  paste(collapse = "\\b|\\b") %>%
  str_remove("NA\\\\b\\|")

agency_strings


d %<>% group_by(text) %>%
  # NOT CASE SENSITIVE!
  mutate(agencies_mentioned = str_extract_all(text, agency_strings) )

d$agencies_mentioned %<>% map(str_to_upper) %<>% map(unique)

# inspect
keep(d$agencies_mentioned, \(x) length(x) > 0)

# replace chr 0 with NA, paste lists together
d %<>%
  mutate(agencies_mentioned = ifelse(
    agencies_mentioned == "character(0)", NA,
    agencies_mentioned # to keep as list
    #str_c(department, collapse = ";", sep = ";") #  FIXME to collapse as string
  )
  )








###############################
# extract acronyms

#TODO INSPECT THESE
acronyms[nchar(acronyms) < 6]

# drop non-orgs
acronyms <- acronyms[!str_detect(acronyms, "DEI|GHG|ESG|CRT|LNG")]

crosswalk <- tibble(
  acronym = acronyms |> str_remove_all("\\)|\\("),
  match = str_ext(acronyms, agency_strings)
)

# acronyms not covered in the hand-coded sheet
crosswalk %>% filter(is.na(match)) %>% select(acronym) |>  kablebox()

# make regex
acronym_strings <- c(agencies_by_section$agency, # from hand-coded sheet
                     acronyms, # extracted acronyms
                     "VA", "OE", "IA" # add back in a few that were dropped
                     ) %>%
  str_remove_all("\\)|\\(") %>%
  unique() %>%
  paste(collapse = "\\b|\\b") %>%
  str_remove("NA\\\\b\\|")

acronym_strings

d %<>% group_by(text) %>%
  #  CASE SENSITIVE!
  mutate(acronyms_mentioned = str_extract_all(text, acronym_strings) )

d$acronyms_mentioned %<>% map(unique)

# inspect
keep(d$acronyms_mentioned, \(x) length(x) > 0)

# replace chr 0 with NA, paste lists together
d %<>%
  mutate(acronyms_mentioned = ifelse(
    acronyms_mentioned == "character(0)", NA,
    acronyms_mentioned) # TO KEEP AS LIST
    # str_c(acronym, collapse = ";", sep = ";") #  FIXME TO MAKE STRING
  )

d %>% drop_na(acronyms_mentioned) %>% pull(acronyms_mentioned)

#FIXME not sure why this is happening, should be unique
# d$acronym %<>% str_replace("OVP.;.OVP", "OVP")

# d %<>% ungroup() %>% tidyr::fill(acronym)

d$acronyms_mentioned

unique(d$acronyms_mentioned)

d %<>% ungroup()

# for hand coding
d %>%
  drop_na(section) %>%
  mutate_all(paste) %>%
  distinct(section, department, departments_mentioned, agencies_mentioned, acronyms_mentioned) %>%
  kablebox


# make lists chr vectors so they show up on github preview
d %>%
  drop_na(section) %>%
  mutate_all(paste) %>%
  distinct(section, department, departments_mentioned, agencies_mentioned, acronyms_mentioned) %>%
  write_csv(here("data", "section-dept-alignment.csv"))


# Save

body_parsed <- d

save(body_parsed, file = here("data", "body_parsed.rda"))


# source scripts to update term counts
source(here("code", "count_racialized_terms.R"))
