

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

agencies_by_section
```

                                                                                                 section
    1                                                                     TAKING THE REINS OF GOVERNMENT
    2                                                                                 WHITE HOUSE OFFICE
    3                                                                                     CHIEF OF STAFF
    4                                                                             DEPUTY CHIEFS OF STAFF
    5                                                                   PRINCIPAL DEPUTY CHIEFS OF STAFF
    6                                                                                    SENIOR ADVISERS
    7                                                                      OFFICE OF WHITE HOUSE COUNSEL
    8                                                                      OFFICE OF WHITE HOUSE COUNSEL
    9                                                                                    STAFF SECRETARY
    10                                                                          OFFICE OF COMMUNICATIONS
    11                                                                     OFFICE OF LEGISLATIVE AFFAIRS
    12                                                                            OFFICE OF PRESIDENTIAL
    13                                                                                               PPO
    14                                                                       OFFICE OF POLITICAL AFFAIRS
    15                                                                         OFFICE OF CABINET AFFAIRS
    16                                                                          OFFICE OF PUBLIC LIAISON
    17                                                                                               OPL
    18                                                               OFFICE OF INTERGOVERNMENTAL AFFAIRS
    19                                                                       WHITE HOUSE POLICY COUNCILS
    20                                                                                              <NA>
    21                                                                                              <NA>
    22                                                                                              <NA>
    23                                                                      OFFICE OF THE VICE PRESIDENT
    24                                                                     OFFICE OF THE LADY/ GENTLEMAN
    25                                                                 EXECUTIVE OFFICE OF THE PRESIDENT
    26                                                                                               OMB
    27                                                                                              OFPP
    28                                                                                              OPPM
    29                                                                                             OFCIO
    30                                                                                              MIAO
    31                                                                                              MIAO
    32                                                                         NATIONAL SECURITY COUNCIL
    33                                                                         NATIONAL SECURITY COUNCIL
    34                                                                         NATIONAL ECONOMIC COUNCIL
    35                                                                                     OFFICE OF THE
    36                                                                                               EOP
    37                                                                      COUNCIL OF ECONOMIC ADVISERS
    38                                                                            NATIONAL SPACE COUNCIL
    39                                                           OFFICE OF SCIENCE AND TECHNOLOGY POLICY
    40                                                                  COUNCIL ON ENVIRONMENTAL QUALITY
    41                                                            OFFICE OF NATIONAL DRUG CONTROL POLICY
    42                                                                                             ONDCP
    43                                                                             GENDER POLICY COUNCIL
    44                                                                      OFFICE OF THE VICE PRESIDENT
    45                                                                      OFFICE OF THE VICE PRESIDENT
    46                                                                                  CENTRAL AGENCIES
    47                                                                                               OPM
    48                                                                                               OPM
    49                                                                                               GSA
    50                                                                                THE COMMON DEFENSE
    51                                                                                THE COMMON DEFENSE
    52                                                                                THE COMMON DEFENSE
    53                                                                                               DOD
    54                                                                                               DOD
    55                                                                                               DOD
    56                                                                                        USCYBERCOM
    57                                                                                               DOD
    58                                                                                               DOD
    59                                                                   DEPARTMENT OF HOMELAND SECURITY
    60                                                                   DEPARTMENT OF HOMELAND SECURITY
    61                                                                   DEPARTMENT OF HOMELAND SECURITY
    62                                                                   DEPARTMENT OF HOMELAND SECURITY
    63                                                                   DEPARTMENT OF HOMELAND SECURITY
    64                                                                   DEPARTMENT OF HOMELAND SECURITY
    65                                                                                               CBP
    66                                                                                          CBP, ICE
    67                                                                                               CBP
    68                                                                                               CBP
    69                                                                                             USCIS
    70                                                                                             USCIS
    71                                                                                             USCIS
    72                                                               FEDERAL EMERGENCY MANAGEMENT AGENCY
    73                                                                                              FEMA
    74                                                  CYBERSECURITY AND INFRASTRUCTURE SECURITY AGENCY
    75                                                                                              CISA
    76                                                                                              CISA
    77                                                                                              USCG
    78                                                                                              USSS
    79                                                            TRANSPORTATION SECURITY ADMINISTRATION
    80                                                               OFFICE OF INTELLIGENCE AND ANALYSIS
    81                                                                     OFFICE OF THE GENERAL COUNSEL
    82                                                                                           DHS OGC
    83                                                                 DHS OFFICE OF LEGISLATIVE AFFAIRS
    84                                                                DHS OFFICE OF PUBLIC AFFAIRS (OPA)
    85                                                    DHS OFFICE OF PARTNERSHIP AND ENGAGEMENT (OPE)
    86                                                                                               DHS
    87                                                                 OFFICE OF OPERATIONS COORDINATION
    88                                                                                               OPS
    89                                                       OFFICE FOR CIVIL RIGHTS AND CIVIL LIBERTIES
    90                                                                                              CRCL
    91                                                     OFFICE OF THE IMMIGRATION DETENTION OMBUDSMAN
    92                                                                                              OIDO
    93                                                                                            CISOMB
    94                                                                                            CISOMB
    95                                                                                            CISOMB
    96                                                                                            CISOMB
    97                                                                                            CISOMB
    98                                                                                            CISOMB
    99                                                                                            CISOMB
    100                                                                                           CISOMB
    101                                                                                           CISOMB
    102                                                                                           CISOMB
    103                                                                              DEPARTMENT OF STATE
    104                                                                              DEPARTMENT OF STATE
    105                                                                              DEPARTMENT OF STATE
    106                                                                      INTERNATIONAL ORGANIZATIONS
    107                                                                      INTERNATIONAL ORGANIZATIONS
    108                                                                      INTERNATIONAL ORGANIZATIONS
    109                                                                           INTELLIGENCE COMMUNITY
    110                                                  OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    111                                                  OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    112                                                                                            IRTPA
    113                                                                      CENTRAL INTELLIGENCE AGENCY
    114                                                                                     ODNI AND CIA
    115                                                                                     ODNI AND CIA
    116                                                                                            CHINA
    117                                                 NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    118                                                                                             NCSC
    119                                                                                             NCSC
    120                                                                                        ODNI, CIA
    121                                                                                        ODNI, CIA
    122                                                                                        ODNI, CIA
    123                                                                                   MEDIA AGENCIES
    124                                                                                              VOA
    125                                                                                              OIG
    126                                                                                              OIG
    127                                                                                              OIG
    128                                                              CORPORATION FOR PUBLIC BROADCASTING
    129                                                                                              NPR
    130                                                                                              NPR
    131                                                             AGENCY FOR INTERNATIONAL DEVELOPMENT
    132                                                                                            USAID
    133                                                                                            USAID
    134                                                                                            PLGHA
    135                                                                        OTHER OFFICES AND BUREAUS
    136                                                                                            USAID
    137                                                                                           PEPFAR
    138                                                                              THE GENERAL WELFARE
    139                                                                              THE GENERAL WELFARE
    140                                                                                              HHS
    141                                                                                              HHS
    142                                                                                              HHS
    143                                                                                              HHS
    144                                                                                              HHS
    145                                                                                              HHS
    146                                                                                              HHS
    147                                                                        DEPARTMENT OF AGRICULTURE
    148                                                                                              CCC
    149                                                                                              CBO
    150                                                                                              CBO
    151                                                                                              CBO
    152                                                                          DEPARTMENT OF EDUCATION
    153                                                                          DEPARTMENT OF EDUCATION
    154                                                                          DEPARTMENT OF EDUCATION
    155                                                                                             OESE
    156                                                                                             OESE
    157                                                                                             OESE
    158                                                                                             OESE
    159                                                                                             OESE
    160                                                                                             OESE
    161                                                                                             OESE
    162                                                                                              OCR
    163                                                                                              OCR
    164                                                                          DEPARTMENT OF EDUCATION
    165                                                                          DEPARTMENT OF EDUCATION
    166                                                                          DEPARTMENT OF EDUCATION
    167                                                                          HIGHER EDUCATION REFORM
    168                                                                                              HEA
    169                                                                                              HEA
    170                                                                             DEPARTMENT OF ENERGY
    171                                                                                              DOE
    172                                 OFFICE OF CYBERSECURITY, ENERGY SECURITY, AND EMERGENCY RESPONSE
    173                                                                                            CESER
    174                                                                            OFFICE OF ELECTRICITY
    175                                                                         OFFICE OF NUCLEAR ENERGY
    176                                                    OFFICE OF FOSSIL ENERGY AND CARBON MANAGEMENT
    177                                                 OFFICE OF ENERGY EFFICIENCY AND RENEWABLE ENERGY
    178                                                                                             EERE
    179                                                                           GRID DEPLOYMENT OFFICE
    180                                                             OFFICE OF CLEAN ENERGY DEMONSTRATION
    181                                                                              LOAN PROGRAM OFFICE
    182                                                                ADVANCED RESEARCH PROJECTS AGENCY
    183                                                                                             ARPA
    184                                                                FEDERAL ENERGY MANAGEMENT PROGRAM
    185                                                                                             FEMP
    186                                                                               CLEAN ENERGY CORPS
    187                                                                ENERGY INFORMATION ADMINISTRATION
    188                                                                                              EIA
    189                                                                  OFFICE OF INTERNATIONAL AFFAIRS
    190                                                                  OFFICE OF INTERNATIONAL AFFAIRS
    191                                                                             ARCTIC ENERGY OFFICE
    192                                                   OFFICE OF INTELLIGENCE AND COUNTERINTELLIGENCE
    193                                                                                              DOE
    194                                                                                 OFFICE OF POLICY
    195                                                                 OFFICE OF TECHNOLOGY TRANSITIONS
    196                                                                 OFFICE OF TECHNOLOGY TRANSITIONS
    197                                                                                              OTT
    198                                                                                OFFICE OF SCIENCE
    199                                                               OFFICE OF ENVIRONMENTAL MANAGEMENT
    200                                                  OFFICE OF CIVILIAN RADIOACTIVE WASTE MANAGEMENT
    201                                                         NATIONAL NUCLEAR SECURITY ADMINISTRATION
    202                                                                                             NNSA
    203                                                                                             NNSA
    204                                                                                             NNSA
    205                                                                                             FERC
    206                                                                                              LNG
    207                                                                    NUCLEAR REGULATORY COMMISSION
    208                                                                    NUCLEAR REGULATORY COMMISSION
    209                                                                    NUCLEAR REGULATORY COMMISSION
    210                                                                    NUCLEAR REGULATORY COMMISSION
    211                                                                  ENVIRONMENTAL PROTECTION AGENCY
    212                                                                                              EPA
    213                                                                      OFFICE OF AIR AND RADIATION
    214                                                                                              OAR
    215                                                                                              OAR
    216                                                                                              OAR
    217                                                                                              OAR
    218                                                                                  OFFICE OF WATER
    219                                                                                  OFFICE OF WATER
    220                                                          OFFICE OF LAND AND EMERGENCY MANAGEMENT
    221                                                                                             OLEM
    222                                                                                             RCRA
    223                                               OFFICE OF CHEMICAL SAFETY AND POLLUTION PREVENTION
    224                                                                                            OCSPP
    225                                                                                            OCSPP
    226                                                                                             OPPT
    227                                                               OFFICE OF RESEARCH AND DEVELOPMENT
    228                                                                                              ORD
    229                                                                                              EPA
    230                                                                           AMERICAN INDIAN OFFICE
    231                                                                                              AIO
    232                                                                EPA OFFICE OF LEGISLATIVE AFFAIRS
    233                                                                                          EPA OGC
    234                                                                                OFFICE OF SUPPORT
    235                                                                                              OMS
    236                                                                                              EPA
    237                                                            OFFICE OF THE CHIEF FINANCIAL OFFICER
    238                                                                                             OCFO
    239                                                                                             OCFO
    240                                                          DEPARTMENT OF HEALTH AND HUMAN SERVICES
    241                                                       CENTERS FOR DISEASE CONTROL AND PREVENTION
    242                                                                                              CDC
    243                                                                     FOOD AND DRUG ADMINISTRATION
    244                                                                    NATIONAL INSTITUTES OF HEALTH
    245                                                                                              NIH
    246                                                       CENTERS FOR MEDICARE AND MEDICAID SERVICES
    247                                                                                              CMS
    248                                                                                              CMS
    249                                                                                          HHS/CMS
    250                                                         ADMINISTRATION FOR CHILDREN AND FAMILIES
    251                                                                                             TANF
    252                                                                                              HHS
    253                                                                                              ORR
    254                                                  ADMINISTRATION ON CHILDREN, YOUTH, AND FAMILIES
    255                                                                             OFFICE OF HEAD START
    256                                                              ADMINISTRATION FOR COMMUNITY LIVING
    257                                                                                             HRSA
    258                                                                            INDIAN HEALTH SERVICE
    259                                                                                     RURAL HEALTH
    260                                                                                     RURAL HEALTH
    261                                                     OFFICE OF THE ASSISTANT SECRETARY FOR HEALTH
    262                                                                                            USPHS
    263                                                                                              HHS
    264                                           ADMINISTRATION FOR STRATEGIC PREPAREDNESS AND RESPONSE
    265                                                                                             ASPR
    266                                                                        OFFICE OF GENERAL COUNSEL
    267                                                                         OFFICE OF GLOBAL AFFAIRS
    268                                                                          OFFICE FOR CIVIL RIGHTS
    269                                                                          OFFICE FOR CIVIL RIGHTS
    270                                                                          OFFICE FOR CIVIL RIGHTS
    271                                                                          OFFICE FOR CIVIL RIGHTS
    272                                                                          OFFICE FOR CIVIL RIGHTS
    273                                                      DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    274                                                                                              HUD
    275                                                                                              HUD
    276                                                                                              HUD
    277                                                                                              HUD
    278                                                                                              HUD
    279                                                                                              HUD
    280                                                                       DEPARTMENT OF THE INTERIOR
    281                                                                                              DOI
    282                                                                                              DOI
    283                                                                                              BLM
    284                                                                                             NEPA
    285                                                                                             FEIS
    286                                                                            DEPARTMENT OF JUSTICE
    287                                                                            DEPARTMENT OF JUSTICE
    288                                                                        DEFENDING THE RULE OF LAW
    289                                                                                             HAVA
    290                                                                                             HAVA
    291                                                                                             HAVA
    292                                                                                             HAVA
    293                                                                                             HAVA
    294                                                                              DEPARTMENT OF LABOR
    295                                                                              DEPARTMENT OF LABOR
    296                                                                                              PRO
    297                                                                                              PRO
    298                                                           WORKER VOICE AND COLLECTIVE BARGAINING
    299                                                           WORKER VOICE AND COLLECTIVE BARGAINING
    300                                                                                       THE STATES
    301                                              WORKER RETIREMENT SAVINGS, ESG, AND PENSION REFORMS
    302                                                                                  PENSION REFORMS
    303                                                                       INTERNATIONAL LABOR POLICY
    304                                                                            ORGANIZATIONAL AGENDA
    305                                                                                              DOL
    306                                                                     DEPARTMENT OF TRANSPORTATION
    307                                                                                              DOT
    308                                                                                            NHTSA
    309                                                                   CORPORATE AVERAGE FUEL ECONOMY
    310                                                                   CORPORATE AVERAGE FUEL ECONOMY
    311                                                                   FEDERAL HIGHWAY ADMINISTRATION
    312                                                                                         AVIATION
    313                                                                  FEDERAL AVIATION ADMINISTRATION
    314                                                                           FEDERAL TRANSIT POLICY
    315                                                                          FEDERAL RAILROAD POLICY
    316                                                                                              FRA
    317                                                                                  MARITIME POLICY
    318                                                                                            MARAD
    319                                                                                            MARAD
    320                                                                                            MARAD
    321                                                                   DEPARTMENT OF VETERANS AFFAIRS
    322                                                                             DEPARTMENTAL HISTORY
    323                                                                             DEPARTMENTAL HISTORY
    324                                                                   VETERANS HEALTH ADMINISTRATION
    325                                                                                              VHA
    326                                                                                              VHA
    327                                                                                              VHA
    328                                                                 VETERANS BENEFITS ADMINISTRATION
    329                                                                     HUMAN RES AND ADMINISTRATION
    330                                                                     HUMAN RES AND ADMINISTRATION
    331                                                                           DEPARTMENT OF COMMERCE
    332                                                                                         COMMERCE
    333                                                                                         COMMERCE
    334                                                               INTERNATIONAL TRADE ADMINISTRATION
    335                                                               INTERNATIONAL TRADE ADMINISTRATION
    336                                                                  BUREAU OF INDUSTRY AND SECURITY
    337                                                                                              EAR
    338                                                                                              BIS
    339                                                  NATIONAL OCEANIC AND ATMOSPHERIC ADMINISTRATION
    340                                                                                             NOAA
    341                         BUREAU OF ECONOMIC THE OFFICE OF THE UNDERSECRETARY FOR ECONOMIC AFFAIRS
    342                                                                                              BEA
    343                                                                                              BEA
    344                                                                                    CENSUS BUREAU
    345                                                                                    CENSUS BUREAU
    346                                                              ECONOMIC DEVELOPMENT ADMINISTRATION
    347                                                             MINORITY BUSINESS DEVELOPMENT AGENCY
    348                                                                                             MBDA
    349                                                   NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY
    350                                              NATIONAL TELECOMMUNICATIONS AND INFORMATION SERVICE
    351                                       NATIONAL TELECOMMUNICATIONS AND INFORMATION ADMINISTRATION
    352                                                                       DEPARTMENT OF THE TREASURY
    353                                                                              TREASURY DEPARTMENT
    354                                                                                       TAX POLICY
    355                                                                               TAX ADMINISTRATION
    356                                                                      TAXPAYER RIGHTS AND PRIVACY
    357                                                                            INTERNATIONAL AFFAIRS
    358                                                                            FISCAL RESPONSIBILITY
    359                                                                    INTERNATIONAL COMPETITIVENESS
    360                                                             CHINA AND OTHER GEOPOLITICAL THREATS
    361                                                                                            CFIUS
    362                                                                                            CFIUS
    363                                                                    IMPROVED FINANCIAL REGULATION
    364                                                                              THE “EQUITY” AGENDA
    365                                                                                          CLIMATE
    366                                                                                           EXPORT
    367                                                                                       THE EXPORT
    368                                                                                             EXIM
    369                                                              FAILING TO MEET THE CHINA CHALLENGE
    370                                                                          THE CASE FOR THE EXPORT
    371                                                                                  FEDERAL RESERVE
    372                                                                                             NGDP
    373                                                                    SMALL BUSINESS ADMINISTRATION
    374                                                                                              SBA
    375                                                              ORIGIN, HISTORY, AND CORE FUNCTIONS
    376                                                                            BUDGETARY FLUCTUATION
    377                                                                         HISTORY OF MISMANAGEMENT
    378                                                         THE SBA IN A CONSERVATIVE ADMINISTRATION
    379                                                                                              RFA
    380                                                                                              RFA
    381                                                                                             SBIR
    382                                                                                              SBA
    383                                                                                              SBA
    384                                                                                            TRADE
    385                                                                          THE CASE FOR FAIR TRADE
    386                                                               LAYING THE TRADE DEFICIT PREDICATE
    387                                                                                     CHALLENGE #1
    388                                                        REDUCTION IN U S TRADE DEFICIT WITH WORLD
    389                                                                                     AVERAGE MOST
    390                                                    BILATERAL TRADE DEFICIT, 2018, IN BILLIONS OF
    391                                                                                     SCENARIO ONE
    392                                                                                     SCENARIO TWO
    393                                                                                     CHALLENGE #2
    394                                                                                     CHALLENGE #2
    395                                                                          THE CASE FOR FREE TRADE
    396 REAL GROSS DOMESTIC PRODUCT PER CAPITA, IN CHAINED 2012 DOLLARS, SEASONALLY ADJUSTED ANNUAL RATE
    397                                                             IMPLEMENTING THE CONSERVATIVE VISION
    398                                                             IMPLEMENTING THE CONSERVATIVE VISION
    399                                                                                             EXIM
    400                                                                                             IPEF
    401                                                                                             IPEF
    402                                                                                             IPEF
    403                                                                                             IPEF
    404                                                                  INDEPENDENT REGULATORY AGENCIES
    405                                                                    FINANCIAL REGULATORY AGENCIES
    406                                                               SECURITIES AND EXCHANGE COMMISSION
    407                                                                                              SEC
    408                                                                                             CFTC
    409                                                             CONSUMER FINANCIAL PROTECTION BUREAU
    410                                                             CONSUMER FINANCIAL PROTECTION BUREAU
    411                                                                           FEDERAL COMMUNICATIONS
    412                                                                                              COM
    413                                                                                              FCC
    414                                                                                              FCC
    415                                                                      FEDERAL ELECTION COMMISSION
    416                                                                      FEDERAL ELECTION COMMISSION
    417                                                                         FEDERAL TRADE COMMISSION
    418                                                                                              FTC
    419                                                                                             <NA>
    420                                                                                          ONWARD!
                                                department                agency
    1                                                 <NA>                  <NA>
    2                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    3                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    4                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    5                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    6                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    7                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    8                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    9                    EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    10                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    11                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    12                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    13                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    14                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    15                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    16                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    17                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    18                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    19                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    20                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    21                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    22                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    23                        OFFICE OF THE VICE PRESIDENT                   OVP
    24                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    25                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    26                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    27                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    28                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    29                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    30                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    31                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    32                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    33                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    34                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    35                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    36                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    37                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    38                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    39                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    40                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    41                   EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    42                   EXECUTIVE OFFICE OF THE PRESIDENT                 ONDCP
    43                   EXECUTIVE OFFICE OF THE PRESIDENT Gender Policy Council
    44                        OFFICE OF THE VICE PRESIDENT                   OVP
    45                        OFFICE OF THE VICE PRESIDENT                   OVP
    46                                                <NA>                  <NA>
    47                      OFFICE OF PERSONNEL MANAGEMENT                   OPM
    48                      OFFICE OF PERSONNEL MANAGEMENT                   OPM
    49                     GENERAL SERVICES ADMINISTRATION                   GSA
    50                               DEPARTMENT OF DEFENSE                   DOD
    51                               DEPARTMENT OF DEFENSE                   DOD
    52                               DEPARTMENT OF DEFENSE                   DOD
    53                               DEPARTMENT OF DEFENSE                   DOD
    54                               DEPARTMENT OF DEFENSE                   DOD
    55                               DEPARTMENT OF DEFENSE                   DOD
    56                               DEPARTMENT OF DEFENSE                   DOD
    57                               DEPARTMENT OF DEFENSE                   DOD
    58                               DEPARTMENT OF DEFENSE                   DOD
    59                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    60                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    61                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    62                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    63                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    64                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    65                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    66                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    67                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    68                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    69                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    70                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    71                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    72                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    73                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    74                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    75                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    76                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    77                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    78                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    79                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    80                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    81                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    82                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    83                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    84                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    85                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    86                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    87                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    88                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    89                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    90                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    91                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    92                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    93                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    94                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    95                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    96                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    97                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    98                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    99                     DEPARTMENT OF HOMELAND SECURITY                   DHS
    100                    DEPARTMENT OF HOMELAND SECURITY                   DHS
    101                    DEPARTMENT OF HOMELAND SECURITY                   DHS
    102                    DEPARTMENT OF HOMELAND SECURITY                   DHS
    103                                DEPARTMENT OF STATE      State Department
    104                                DEPARTMENT OF STATE      State Department
    105                                DEPARTMENT OF STATE      State Department
    106                                DEPARTMENT OF STATE      State Department
    107                                DEPARTMENT OF STATE      State Department
    108                                DEPARTMENT OF STATE      State Department
    109    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    110    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    111    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    112    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    113    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                   CIA
    114    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    115    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    116                                               <NA>                  <NA>
    117    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  NCSC
    118    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  NCSC
    119    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  NCSC
    120    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    121    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    122    OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE                  ODNI
    123              UNITED STATES AGENCY FOR GLOBAL MEDIA                 USAGM
    124              UNITED STATES AGENCY FOR GLOBAL MEDIA                 USAGM
    125                                               <NA>                   OIG
    126                                               <NA>                   OIG
    127                                               <NA>                   OIG
    128                CORPORATION FOR PUBLIC BROADCASTING                   CPB
    129                CORPORATION FOR PUBLIC BROADCASTING                   CPB
    130                CORPORATION FOR PUBLIC BROADCASTING                   CPB
    131 UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT                 USAID
    132 UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT                 USAID
    133 UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT                 USAID
    134                                               <NA>                  <NA>
    135                                               <NA>                  <NA>
    136 UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT                 USAID
    137                                               <NA>                  <NA>
    138                                               <NA>                  <NA>
    139                                               <NA>                  <NA>
    140            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    141            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    142            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    143            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    144            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    145            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    146            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    147                          DEPARTMENT OF AGRICULTURE                  USDA
    148                                               <NA>                   CCC
    149                                               <NA>                   CBO
    150                                               <NA>                   CBO
    151                                               <NA>                   CBO
    152                            DEPARTMENT OF EDUCATION                    ED
    153                            DEPARTMENT OF EDUCATION                    ED
    154                            DEPARTMENT OF EDUCATION                    ED
    155                            DEPARTMENT OF EDUCATION                    ED
    156                            DEPARTMENT OF EDUCATION                    ED
    157                            DEPARTMENT OF EDUCATION                    ED
    158                            DEPARTMENT OF EDUCATION                    ED
    159                            DEPARTMENT OF EDUCATION                    ED
    160                            DEPARTMENT OF EDUCATION                    ED
    161                            DEPARTMENT OF EDUCATION                    ED
    162                            DEPARTMENT OF EDUCATION                    ED
    163                            DEPARTMENT OF EDUCATION                    ED
    164                            DEPARTMENT OF EDUCATION                    ED
    165                            DEPARTMENT OF EDUCATION                    ED
    166                            DEPARTMENT OF EDUCATION                    ED
    167                            DEPARTMENT OF EDUCATION                    ED
    168                            DEPARTMENT OF EDUCATION                    ED
    169                            DEPARTMENT OF EDUCATION                    ED
    170                               DEPARTMENT OF ENERGY                   DOE
    171                               DEPARTMENT OF ENERGY                   DOE
    172                               DEPARTMENT OF ENERGY                   DOE
    173                               DEPARTMENT OF ENERGY                   DOE
    174                               DEPARTMENT OF ENERGY                   DOE
    175                               DEPARTMENT OF ENERGY                   DOE
    176                               DEPARTMENT OF ENERGY                   DOE
    177                               DEPARTMENT OF ENERGY                   DOE
    178                               DEPARTMENT OF ENERGY                   DOE
    179                               DEPARTMENT OF ENERGY                   DOE
    180                               DEPARTMENT OF ENERGY                   DOE
    181                               DEPARTMENT OF ENERGY                   DOE
    182                               DEPARTMENT OF ENERGY                   DOE
    183                               DEPARTMENT OF ENERGY                   DOE
    184                               DEPARTMENT OF ENERGY                   DOE
    185                               DEPARTMENT OF ENERGY                   DOE
    186                               DEPARTMENT OF ENERGY                   DOE
    187                               DEPARTMENT OF ENERGY                   DOE
    188                               DEPARTMENT OF ENERGY                   DOE
    189                               DEPARTMENT OF ENERGY                   DOE
    190                               DEPARTMENT OF ENERGY                   DOE
    191                               DEPARTMENT OF ENERGY                   DOE
    192                               DEPARTMENT OF ENERGY                   DOE
    193                               DEPARTMENT OF ENERGY                   DOE
    194                               DEPARTMENT OF ENERGY                   DOE
    195                               DEPARTMENT OF ENERGY                   DOE
    196                               DEPARTMENT OF ENERGY                   DOE
    197                               DEPARTMENT OF ENERGY                   DOE
    198                               DEPARTMENT OF ENERGY                   DOE
    199                               DEPARTMENT OF ENERGY                   DOE
    200                               DEPARTMENT OF ENERGY                   DOE
    201                               DEPARTMENT OF ENERGY                   DOE
    202                               DEPARTMENT OF ENERGY                   DOE
    203                               DEPARTMENT OF ENERGY                   DOE
    204                               DEPARTMENT OF ENERGY                   DOE
    205                               DEPARTMENT OF ENERGY                   DOE
    206                               DEPARTMENT OF ENERGY                   DOE
    207                      NUCLEAR REGULATORY COMMISSION                   NRC
    208                      NUCLEAR REGULATORY COMMISSION                   NRC
    209                      NUCLEAR REGULATORY COMMISSION                   NRC
    210                      NUCLEAR REGULATORY COMMISSION                   NRC
    211                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    212                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    213                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    214                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    215                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    216                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    217                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    218                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    219                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    220                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    221                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    222                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    223                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    224                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    225                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    226                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    227                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    228                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    229                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    230                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    231                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    232                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    233                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    234                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    235                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    236                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    237                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    238                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    239                    ENVIRONMENTAL PROTECTION AGENCY                   EPA
    240            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    241            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   CDC
    242            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   CDC
    243                       FOOD AND DRUG ADMINISTRATION                   FDA
    244            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   NIH
    245            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   NIH
    246            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    247            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    248            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    249            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    250            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    251            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    252            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    253            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    254            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    255            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    256            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    257            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    258            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    259            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    260            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    261            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    262            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    263            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    264            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    265            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    266            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    267            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    268            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    269            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    270            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    271            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    272            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    273        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    274        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    275        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    276        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    277        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    278        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    279        DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT                   HUD
    280                         DEPARTMENT OF THE INTERIOR                   DOI
    281                         DEPARTMENT OF THE INTERIOR                   DOI
    282                         DEPARTMENT OF THE INTERIOR                   DOI
    283                         DEPARTMENT OF THE INTERIOR                   DOI
    284                  EXECUTIVE OFFICE OF THE PRESIDENT                   EOP
    285                          DEPARTMENT OF AGRICULTURE                  USDA
    286                              DEPARTMENT OF JUSTICE                   DOJ
    287                              DEPARTMENT OF JUSTICE                   DOJ
    288                              DEPARTMENT OF JUSTICE                   DOJ
    289                     ELECTION ASSISTANCE COMMISSION                  HAVA
    290                     ELECTION ASSISTANCE COMMISSION                  HAVA
    291                     ELECTION ASSISTANCE COMMISSION                  HAVA
    292                     ELECTION ASSISTANCE COMMISSION                  HAVA
    293                     ELECTION ASSISTANCE COMMISSION                  HAVA
    294                                DEPARTMENT OF LABOR                   DOL
    295                                DEPARTMENT OF LABOR                   DOL
    296                                DEPARTMENT OF LABOR                   DOL
    297                                DEPARTMENT OF LABOR                   DOL
    298                                DEPARTMENT OF LABOR                   DOL
    299                                DEPARTMENT OF LABOR                   DOL
    300                                DEPARTMENT OF LABOR                   DOL
    301                                DEPARTMENT OF LABOR                   DOL
    302                                DEPARTMENT OF LABOR                   DOL
    303                                DEPARTMENT OF LABOR                   DOL
    304                                DEPARTMENT OF LABOR                   DOL
    305                                DEPARTMENT OF LABOR                   DOL
    306                       DEPARTMENT OF TRANSPORTATION                   DOT
    307                       DEPARTMENT OF TRANSPORTATION                   DOT
    308                       DEPARTMENT OF TRANSPORTATION                   DOT
    309                       DEPARTMENT OF TRANSPORTATION                   DOT
    310                       DEPARTMENT OF TRANSPORTATION                   DOT
    311                       DEPARTMENT OF TRANSPORTATION                   DOT
    312                       DEPARTMENT OF TRANSPORTATION                   DOT
    313                       DEPARTMENT OF TRANSPORTATION                   DOT
    314                       DEPARTMENT OF TRANSPORTATION                   DOT
    315                       DEPARTMENT OF TRANSPORTATION                   DOT
    316                       DEPARTMENT OF TRANSPORTATION                   DOT
    317                       DEPARTMENT OF TRANSPORTATION                   DOT
    318                       DEPARTMENT OF TRANSPORTATION                   DOT
    319                       DEPARTMENT OF TRANSPORTATION                   DOT
    320                       DEPARTMENT OF TRANSPORTATION                   DOT
    321                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    322                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    323                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    324                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    325                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    326                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    327                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    328                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    329                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    330                     DEPARTMENT OF VETERANS AFFAIRS                    VA
    331                             DEPARTMENT OF COMMERCE                   DOC
    332                             DEPARTMENT OF COMMERCE                   DOC
    333                             DEPARTMENT OF COMMERCE                   DOC
    334                             DEPARTMENT OF COMMERCE                   DOC
    335                             DEPARTMENT OF COMMERCE                   DOC
    336                             DEPARTMENT OF COMMERCE                   DOC
    337                             DEPARTMENT OF COMMERCE                   DOC
    338                             DEPARTMENT OF COMMERCE                   DOC
    339                             DEPARTMENT OF COMMERCE                   DOC
    340                             DEPARTMENT OF COMMERCE                   DOC
    341                             DEPARTMENT OF COMMERCE                   DOC
    342                             DEPARTMENT OF COMMERCE                   DOC
    343                             DEPARTMENT OF COMMERCE                   DOC
    344                             DEPARTMENT OF COMMERCE                   DOC
    345                             DEPARTMENT OF COMMERCE                   DOC
    346                             DEPARTMENT OF COMMERCE                   DOC
    347                             DEPARTMENT OF COMMERCE                   DOC
    348                             DEPARTMENT OF COMMERCE                   DOC
    349            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    350            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    351            DEPARTMENT OF HEALTH AND HUMAN SERVICES                   HHS
    352                         DEPARTMENT OF THE TREASURY              Treasury
    353                         DEPARTMENT OF THE TREASURY              Treasury
    354                         DEPARTMENT OF THE TREASURY                   IRS
    355                         DEPARTMENT OF THE TREASURY                   IRS
    356                         DEPARTMENT OF THE TREASURY                   IRS
    357                         DEPARTMENT OF THE TREASURY                  <NA>
    358                         DEPARTMENT OF THE TREASURY                  <NA>
    359                         DEPARTMENT OF THE TREASURY                  <NA>
    360                         DEPARTMENT OF THE TREASURY                  <NA>
    361                         DEPARTMENT OF THE TREASURY                 CFIUS
    362                         DEPARTMENT OF THE TREASURY                 CFIUS
    363                         DEPARTMENT OF THE TREASURY                  <NA>
    364                         DEPARTMENT OF THE TREASURY                  <NA>
    365                         DEPARTMENT OF THE TREASURY                  <NA>
    366            EXPORT-IMPORT BANK OF THE UNITED STATES                  EXIM
    367            EXPORT-IMPORT BANK OF THE UNITED STATES                  EXIM
    368            EXPORT-IMPORT BANK OF THE UNITED STATES                  EXIM
    369                                               <NA>                  <NA>
    370                                               <NA>                  <NA>
    371                                    FEDERAL RESERVE                   FED
    372                         DEPARTMENT OF THE TREASURY              Treasury
    373                      SMALL BUSINESS ADMINISTRATION                   SBA
    374                      SMALL BUSINESS ADMINISTRATION                   SBA
    375                      SMALL BUSINESS ADMINISTRATION                   SBA
    376                      SMALL BUSINESS ADMINISTRATION                   SBA
    377                      SMALL BUSINESS ADMINISTRATION                   SBA
    378                      SMALL BUSINESS ADMINISTRATION                   SBA
    379              UNITED STATES AGENCY FOR GLOBAL MEDIA                 USAGM
    380              UNITED STATES AGENCY FOR GLOBAL MEDIA                 USAGM
    381                              DEPARTMENT OF JUSTICE                  SBIR
    382                      SMALL BUSINESS ADMINISTRATION                   SBA
    383                      SMALL BUSINESS ADMINISTRATION                   SBA
    384                            US TRADE REPRESENTATIVE                  USTR
    385                                               <NA>                  <NA>
    386                                               <NA>                  <NA>
    387                                               <NA>                  <NA>
    388                                               <NA>                  <NA>
    389                                               <NA>                  <NA>
    390                                               <NA>                  <NA>
    391                                               <NA>                  <NA>
    392                                               <NA>                  <NA>
    393                                               <NA>                  <NA>
    394                                               <NA>                  <NA>
    395                                               <NA>                  <NA>
    396                                               <NA>                  <NA>
    397                                               <NA>                  <NA>
    398                                               <NA>                  <NA>
    399            EXPORT-IMPORT BANK OF THE UNITED STATES                  EXIM
    400                            US TRADE REPRESENTATIVE                  USTR
    401                            US TRADE REPRESENTATIVE                  USTR
    402                            US TRADE REPRESENTATIVE                  USTR
    403                            US TRADE REPRESENTATIVE                  USTR
    404                    INDEPENDENT REGULATORY AGENCIES                  <NA>
    405                      FINANCIAL REGULATORY AGENCIES                  <NA>
    406                 SECURITIES AND EXCHANGE COMMISSION                   SEC
    407                 SECURITIES AND EXCHANGE COMMISSION                   SEC
    408               COMMODITY FUTURES TRADING COMMISSION                  CFTC
    409               CONSUMER FINANCIAL PROTECTION BUREAU                  CFPB
    410               CONSUMER FINANCIAL PROTECTION BUREAU                  CFPB
    411                  FEDERAL COMMUNICATIONS COMMISSION                   FCC
    412                  FEDERAL COMMUNICATIONS COMMISSION                   FCC
    413                  FEDERAL COMMUNICATIONS COMMISSION                   FCC
    414                  FEDERAL COMMUNICATIONS COMMISSION                   FCC
    415                        FEDERAL ELECTION COMMISSION                   FEC
    416                        FEDERAL ELECTION COMMISSION                   FEC
    417                           FEDERAL TRADE COMMISSION                   FTC
    418                           FEDERAL TRADE COMMISSION                   FTC
    419                                               <NA>                  <NA>
    420                                               <NA>                  <NA>
                                                                  subagency_name
    1                                                                       <NA>
    2                                                         WHITE HOUSE OFFICE
    3                                                                       <NA>
    4                                                     DEPUTY CHIEFS OF STAFF
    5                                           PRINCIPAL DEPUTY CHIEFS OF STAFF
    6                                                            SENIOR ADVISERS
    7                                              OFFICE OF WHITE HOUSE COUNSEL
    8                                              OFFICE OF WHITE HOUSE COUNSEL
    9                                                            STAFF SECRETARY
    10                                                  OFFICE OF COMMUNICATIONS
    11                                             OFFICE OF LEGISLATIVE AFFAIRS
    12                                                    OFFICE OF PRESIDENTIAL
    13                                                                      <NA>
    14                                               OFFICE OF POLITICAL AFFAIRS
    15                                                 OFFICE OF CABINET AFFAIRS
    16                                                  OFFICE OF PUBLIC LIAISON
    17                                                  OFFICE OF PUBLIC LIAISON
    18                                       OFFICE OF INTERGOVERNMENTAL AFFAIRS
    19                                         EXECUTIVE OFFICE OF THE PRESIDENT
    20                                             POLICY COORDINATING COMMITTEE
    21                                                 NATIONAL SECURITY COUNCIL
    22                                                   DOMESTIC POLICY COUNCIL
    23                                              OFFICE OF THE VICE PRESIDENT
    24                                             OFFICE OF THE LADY/ GENTLEMAN
    25                                         EXECUTIVE OFFICE OF THE PRESIDENT
    26                                                                      <NA>
    27                                                                      <NA>
    28                                                                      <NA>
    29                                                                      <NA>
    30                                                                      <NA>
    31                                                                      <NA>
    32                                                 NATIONAL SECURITY COUNCIL
    33                                                 NATIONAL SECURITY COUNCIL
    34                                                 NATIONAL ECONOMIC COUNCIL
    35                                         EXECUTIVE OFFICE OF THE PRESIDENT
    36                                         EXECUTIVE OFFICE OF THE PRESIDENT
    37                                              COUNCIL OF ECONOMIC ADVISERS
    38                                                    NATIONAL SPACE COUNCIL
    39                                   OFFICE OF SCIENCE AND TECHNOLOGY POLICY
    40                                          COUNCIL ON ENVIRONMENTAL QUALITY
    41                                    OFFICE OF NATIONAL DRUG CONTROL POLICY
    42                                    OFFICE OF NATIONAL DRUG CONTROL POLICY
    43                                                     GENDER POLICY COUNCIL
    44                                              OFFICE OF THE VICE PRESIDENT
    45                                              OFFICE OF THE VICE PRESIDENT
    46                                                                      <NA>
    47                                            OFFICE OF PERSONNEL MANAGEMENT
    48                                            OFFICE OF PERSONNEL MANAGEMENT
    49                                           GENERAL SERVICES ADMINISTRATION
    50                                                     DEPARTMENT OF DEFENSE
    51                                                     DEPARTMENT OF DEFENSE
    52                                                     DEPARTMENT OF DEFENSE
    53                                                     DEPARTMENT OF DEFENSE
    54                                                     DEPARTMENT OF DEFENSE
    55                                                     DEPARTMENT OF DEFENSE
    56                                                                USCYBERCOM
    57                                                     DEPARTMENT OF DEFENSE
    58                                                     DEPARTMENT OF DEFENSE
    59                                           DEPARTMENT OF HOMELAND SECURITY
    60                                           DEPARTMENT OF HOMELAND SECURITY
    61                                           DEPARTMENT OF HOMELAND SECURITY
    62                                           DEPARTMENT OF HOMELAND SECURITY
    63                                           DEPARTMENT OF HOMELAND SECURITY
    64                                           DEPARTMENT OF HOMELAND SECURITY
    65                                             CUSTOMS AND BORDER PROTECTION
    66                                       IMMIGRATION AND CUSTOMS ENFORCEMENT
    67                                             CUSTOMS AND BORDER PROTECTION
    68                                             CUSTOMS AND BORDER PROTECTION
    69                                             CUSTOMS AND BORDER PROTECTION
    70                                             CUSTOMS AND BORDER PROTECTION
    71                                             CUSTOMS AND BORDER PROTECTION
    72                                       FEDERAL EMERGENCY MANAGEMENT AGENCY
    73                                       FEDERAL EMERGENCY MANAGEMENT AGENCY
    74                          CYBERSECURITY AND INFRASTRUCTURE SECURITY AGENCY
    75                          CYBERSECURITY AND INFRASTRUCTURE SECURITY AGENCY
    76                          CYBERSECURITY AND INFRASTRUCTURE SECURITY AGENCY
    77                                                            US COAST GAURD
    78                                              UNITED STATES SECRET SERVICE
    79                                    TRANSPORTATION SECURITY ADMINISTRATION
    80                                       OFFICE OF INTELLIGENCE AND ANALYSIS
    81                                             OFFICE OF THE GENERAL COUNSEL
    82                                             OFFICE OF THE GENERAL COUNSEL
    83                                         DHS OFFICE OF LEGISLATIVE AFFAIRS
    84                                              DHS OFFICE OF PUBLIC AFFAIRS
    85                                  DHS OFFICE OF PARTNERSHIP AND ENGAGEMENT
    86                                  DHS OFFICE OF PARTNERSHIP AND ENGAGEMENT
    87                                         OFFICE OF OPERATIONS COORDINATION
    88                                         OFFICE OF OPERATIONS COORDINATION
    89                               OFFICE FOR CIVIL RIGHTS AND CIVIL LIBERTIES
    90                               OFFICE FOR CIVIL RIGHTS AND CIVIL LIBERTIES
    91                             OFFICE OF THE IMMIGRATION DETENTION OMBUDSMAN
    92                             OFFICE OF THE IMMIGRATION DETENTION OMBUDSMAN
    93              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    94              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    95              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    96              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    97              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    98              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    99              OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    100             OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    101             OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    102             OFFICE OF THE CITIZENSHIP AND IMMIGRATION SERVICES OMBUDSMAN
    103                                                      DEPARTMENT OF STATE
    104                                                      DEPARTMENT OF STATE
    105                                                      DEPARTMENT OF STATE
    106                                                      DEPARTMENT OF STATE
    107                                                      DEPARTMENT OF STATE
    108                                                      DEPARTMENT OF STATE
    109                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    110                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    111                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    112                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    113                                              CENTRAL INTELLIGENCE AGENCY
    114                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    115                          OFFICE OF THE DIRECTOR OF NATIONAL INTELLIGENCE
    116                                                                     <NA>
    117                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    118                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    119                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    120                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    121                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    122                         NATIONAL COUNTERINTELLIGENCE AND SECURITY CENTER
    123                                    UNITED STATES AGENCY FOR GLOBAL MEDIA
    124                                                         VOICE OF AMERICA
    125                                                                     <NA>
    126                                                                     <NA>
    127                                                                     <NA>
    128                                                                     PBS?
    129                                                                      NPR
    130                                                                      NPR
    131                       UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT
    132                       UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT
    133                       UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT
    134                                                                     <NA>
    135                                                                     <NA>
    136                       UNITED STATES AGENCY FOR INTERNATIONAL DEVELOPMENT
    137                                                                     <NA>
    138                                                                     <NA>
    139                                                                     <NA>
    140                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    141                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    142                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    143                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    144                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    145                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    146                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    147                                                DEPARTMENT OF AGRICULTURE
    148                                                                     <NA>
    149                                                                     <NA>
    150                                                                     <NA>
    151                                                                     <NA>
    152                                                  DEPARTMENT OF EDUCATION
    153                                                  DEPARTMENT OF EDUCATION
    154                                                  DEPARTMENT OF EDUCATION
    155                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    156                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    157                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    158                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    159                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    160                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    161                             OFFICE OF ELEMENTARY AND SECONDARY EDUCATION
    162                                                                      OCR
    163                                                                      OCR
    164                                                  DEPARTMENT OF EDUCATION
    165                                                  DEPARTMENT OF EDUCATION
    166                                                  DEPARTMENT OF EDUCATION
    167                                                  DEPARTMENT OF EDUCATION
    168                                                  DEPARTMENT OF EDUCATION
    169                                                  DEPARTMENT OF EDUCATION
    170                                                     DEPARTMENT OF ENERGY
    171                                                     DEPARTMENT OF ENERGY
    172         OFFICE OF CYBERSECURITY, ENERGY SECURITY, AND EMERGENCY RESPONSE
    173         OFFICE OF CYBERSECURITY, ENERGY SECURITY, AND EMERGENCY RESPONSE
    174                                                    OFFICE OF ELECTRICITY
    175                                                 OFFICE OF NUCLEAR ENERGY
    176                            OFFICE OF FOSSIL ENERGY AND CARBON MANAGEMENT
    177                         OFFICE OF ENERGY EFFICIENCY AND RENEWABLE ENERGY
    178                         OFFICE OF ENERGY EFFICIENCY AND RENEWABLE ENERGY
    179                                                   GRID DEPLOYMENT OFFICE
    180                                     OFFICE OF CLEAN ENERGY DEMONSTRATION
    181                                                      LOAN PROGRAM OFFICE
    182                                        ADVANCED RESEARCH PROJECTS AGENCY
    183                                        ADVANCED RESEARCH PROJECTS AGENCY
    184                                        FEDERAL ENERGY MANAGEMENT PROGRAM
    185                                        FEDERAL ENERGY MANAGEMENT PROGRAM
    186                                                       CLEAN ENERGY CORPS
    187                                        ENERGY INFORMATION ADMINISTRATION
    188                                        ENERGY INFORMATION ADMINISTRATION
    189                                          OFFICE OF INTERNATIONAL AFFAIRS
    190                                          OFFICE OF INTERNATIONAL AFFAIRS
    191                                                     ARCTIC ENERGY OFFICE
    192                           OFFICE OF INTELLIGENCE AND COUNTERINTELLIGENCE
    193                                                     DEPARTMENT OF ENERGY
    194                                                         OFFICE OF POLICY
    195                                         OFFICE OF TECHNOLOGY TRANSITIONS
    196                                         OFFICE OF TECHNOLOGY TRANSITIONS
    197                                         OFFICE OF TECHNOLOGY TRANSITIONS
    198                                                        OFFICE OF SCIENCE
    199                                       OFFICE OF ENVIRONMENTAL MANAGEMENT
    200                          OFFICE OF CIVILIAN RADIOACTIVE WASTE MANAGEMENT
    201                                 NATIONAL NUCLEAR SECURITY ADMINISTRATION
    202                                 NATIONAL NUCLEAR SECURITY ADMINISTRATION
    203                                 NATIONAL NUCLEAR SECURITY ADMINISTRATION
    204                                 NATIONAL NUCLEAR SECURITY ADMINISTRATION
    205                                                                     FERC
    206                            OFFICE OF FOSSIL ENERGY AND CARBON MANAGEMENT
    207                                            NUCLEAR REGULATORY COMMISSION
    208                                            NUCLEAR REGULATORY COMMISSION
    209                                            NUCLEAR REGULATORY COMMISSION
    210                                            NUCLEAR REGULATORY COMMISSION
    211                                          ENVIRONMENTAL PROTECTION AGENCY
    212                                          ENVIRONMENTAL PROTECTION AGENCY
    213                                              OFFICE OF AIR AND RADIATION
    214                                              OFFICE OF AIR AND RADIATION
    215                                              OFFICE OF AIR AND RADIATION
    216                                              OFFICE OF AIR AND RADIATION
    217                                              OFFICE OF AIR AND RADIATION
    218                                                          OFFICE OF WATER
    219                                                          OFFICE OF WATER
    220                                  OFFICE OF LAND AND EMERGENCY MANAGEMENT
    221                                  OFFICE OF LAND AND EMERGENCY MANAGEMENT
    222                                       RESOURCE CONSERVATION AND RECOVERY
    223                       OFFICE OF CHEMICAL SAFETY AND POLLUTION PREVENTION
    224                       OFFICE OF CHEMICAL SAFETY AND POLLUTION PREVENTION
    225                       OFFICE OF CHEMICAL SAFETY AND POLLUTION PREVENTION
    226                                OFFICE OF POLLUTION PREVENTION AND TOXICS
    227                                       OFFICE OF RESEARCH AND DEVELOPMENT
    228                                       OFFICE OF RESEARCH AND DEVELOPMENT
    229                                          ENVIRONMENTAL PROTECTION AGENCY
    230                                                   AMERICAN INDIAN OFFICE
    231                                                   AMERICAN INDIAN OFFICE
    232                                                OFFICE OF GENERAL COUNSEL
    233                                                OFFICE OF GENERAL COUNSEL
    234                                                        OFFICE OF SUPPORT
    235                                                                      OMS
    236                                          ENVIRONMENTAL PROTECTION AGENCY
    237                                    OFFICE OF THE CHIEF FINANCIAL OFFICER
    238                                    OFFICE OF THE CHIEF FINANCIAL OFFICER
    239                                    OFFICE OF THE CHIEF FINANCIAL OFFICER
    240                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    241                               CENTERS FOR DISEASE CONTROL AND PREVENTION
    242                               CENTERS FOR DISEASE CONTROL AND PREVENTION
    243                                             FOOD AND DRUG ADMINISTRATION
    244                                            NATIONAL INSTITUTES OF HEALTH
    245                                            NATIONAL INSTITUTES OF HEALTH
    246                               CENTERS FOR MEDICARE AND MEDICAID SERVICES
    247                               CENTERS FOR MEDICARE AND MEDICAID SERVICES
    248                               CENTERS FOR MEDICARE AND MEDICAID SERVICES
    249                               CENTERS FOR MEDICARE AND MEDICAID SERVICES
    250                                 ADMINISTRATION FOR CHILDREN AND FAMILIES
    251                                                                     TANF
    252                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    253                                                                      ORR
    254                          ADMINISTRATION ON CHILDREN, YOUTH, AND FAMILIES
    255                                                     OFFICE OF HEAD START
    256                                      ADMINISTRATION FOR COMMUNITY LIVING
    257                             HEALTH RESOURCES AND SERVICES ADMINISTRATION
    258                                                    INDIAN HEALTH SERVICE
    259                             HEALTH RESOURCES AND SERVICES ADMINISTRATION
    260                             HEALTH RESOURCES AND SERVICES ADMINISTRATION
    261                             OFFICE OF THE ASSISTANT SECRETARY FOR HEALTH
    262                                                                    USPHS
    263                                  DEPARTMENT OF HEALTH AND HUMAN SERVICES
    264                   ADMINISTRATION FOR STRATEGIC PREPAREDNESS AND RESPONSE
    265                   ADMINISTRATION FOR STRATEGIC PREPAREDNESS AND RESPONSE
    266                                                OFFICE OF GENERAL COUNSEL
    267                                                 OFFICE OF GLOBAL AFFAIRS
    268                                                  OFFICE FOR CIVIL RIGHTS
    269                                                  OFFICE FOR CIVIL RIGHTS
    270                                                  OFFICE FOR CIVIL RIGHTS
    271                                                  OFFICE FOR CIVIL RIGHTS
    272                                                  OFFICE FOR CIVIL RIGHTS
    273                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    274                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    275                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    276                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    277                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    278                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    279                              DEPARTMENT OF HOUSING AND URBAN DEVELOPMENT
    280                                               DEPARTMENT OF THE INTERIOR
    281                                               DEPARTMENT OF THE INTERIOR
    282                                               DEPARTMENT OF THE INTERIOR
    283                                                BUREAU OF LAND MANAGEMENT
    284                                         COUNCIL ON ENVIRONMENTAL QUALITY
    285                                                        US FOREST SERVICE
    286                                                    DEPARTMENT OF JUSTICE
    287                                                    DEPARTMENT OF JUSTICE
    288                                                    DEPARTMENT OF JUSTICE
    289                                           ELECTION ASSISTANCE COMMISSION
    290                                           ELECTION ASSISTANCE COMMISSION
    291                                           ELECTION ASSISTANCE COMMISSION
    292                                           ELECTION ASSISTANCE COMMISSION
    293                                           ELECTION ASSISTANCE COMMISSION
    294                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    295                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    296                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    297                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    298                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    299                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    300                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    301                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    302                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    303                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    304                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    305                        OFFICE OF THE SECRETARY, U.S. DEPARTMENT OF LABOR
    306                                             DEPARTMENT OF TRANSPORTATION
    307                                             DEPARTMENT OF TRANSPORTATION
    308                                                                    NHTSA
    309                                                                    NHTSA
    310                                                                    NHTSA
    311                                           FEDERAL HIGHWAY ADMINISTRATION
    312                                          FEDERAL AVIATION ADMINISTRATION
    313                                          FEDERAL AVIATION ADMINISTRATION
    314                                                   FEDERAL TRANSIT POLICY
    315                                          FEDERAL RAILROAD ADMINISTRATION
    316                                          FEDERAL RAILROAD ADMINISTRATION
    317                                    UNITED STATES MARITIME ADMINISTRATION
    318                                    UNITED STATES MARITIME ADMINISTRATION
    319                                    UNITED STATES MARITIME ADMINISTRATION
    320                                    UNITED STATES MARITIME ADMINISTRATION
    321                                           DEPARTMENT OF VETERANS AFFAIRS
    322                                           DEPARTMENT OF VETERANS AFFAIRS
    323                                           DEPARTMENT OF VETERANS AFFAIRS
    324                                           VETERANS HEALTH ADMINISTRATION
    325                                           VETERANS HEALTH ADMINISTRATION
    326                                           VETERANS HEALTH ADMINISTRATION
    327                                           VETERANS HEALTH ADMINISTRATION
    328                                         VETERANS BENEFITS ADMINISTRATION
    329                             OFFICE OF HUMAN RESOURCES AND ADMINISTRATION
    330                             OFFICE OF HUMAN RESOURCES AND ADMINISTRATION
    331                                                   DEPARTMENT OF COMMERCE
    332                                                   DEPARTMENT OF COMMERCE
    333                                                   DEPARTMENT OF COMMERCE
    334                                       INTERNATIONAL TRADE ADMINISTRATION
    335                                       INTERNATIONAL TRADE ADMINISTRATION
    336                                          BUREAU OF INDUSTRY AND SECURITY
    337                                                                      EAR
    338                                          BUREAU OF INDUSTRY AND SECURITY
    339                          NATIONAL OCEANIC AND ATMOSPHERIC ADMINISTRATION
    340                          NATIONAL OCEANIC AND ATMOSPHERIC ADMINISTRATION
    341 BUREAU OF ECONOMIC THE OFFICE OF THE UNDERSECRETARY FOR ECONOMIC AFFAIRS
    342 BUREAU OF ECONOMIC THE OFFICE OF THE UNDERSECRETARY FOR ECONOMIC AFFAIRS
    343 BUREAU OF ECONOMIC THE OFFICE OF THE UNDERSECRETARY FOR ECONOMIC AFFAIRS
    344                                                            CENSUS BUREAU
    345                                                            CENSUS BUREAU
    346                                      ECONOMIC DEVELOPMENT ADMINISTRATION
    347                                     MINORITY BUSINESS DEVELOPMENT AGENCY
    348                                     MINORITY BUSINESS DEVELOPMENT AGENCY
    349                           NATIONAL INSTITUTE OF STANDARDS AND TECHNOLOGY
    350               NATIONAL TELECOMMUNICATIONS AND INFORMATION ADMINISTRATION
    351               NATIONAL TELECOMMUNICATIONS AND INFORMATION ADMINISTRATION
    352                                               DEPARTMENT OF THE TREASURY
    353                                               DEPARTMENT OF THE TREASURY
    354                                                 INTERNAL REVENUE SERVICE
    355                                                 INTERNAL REVENUE SERVICE
    356                                                 INTERNAL REVENUE SERVICE
    357                                                                     <NA>
    358                                                                     <NA>
    359                                                                     <NA>
    360                                                                     <NA>
    361                     COMMITTEE ON FOREIGN INVESTMENT IN THE UNITED STATES
    362                     COMMITTEE ON FOREIGN INVESTMENT IN THE UNITED STATES
    363                                                                     <NA>
    364                                                                     <NA>
    365                                                                     <NA>
    366                                  EXPORT-IMPORT BANK OF THE UNITED STATES
    367                                  EXPORT-IMPORT BANK OF THE UNITED STATES
    368                                  EXPORT-IMPORT BANK OF THE UNITED STATES
    369                                                                     <NA>
    370                                                                     <NA>
    371                                                          FEDERAL RESERVE
    372                                                                     NGDP
    373                                            SMALL BUSINESS ADMINISTRATION
    374                                            SMALL BUSINESS ADMINISTRATION
    375                                            SMALL BUSINESS ADMINISTRATION
    376                                            SMALL BUSINESS ADMINISTRATION
    377                                            SMALL BUSINESS ADMINISTRATION
    378                                            SMALL BUSINESS ADMINISTRATION
    379                                                          RADIO FREE ASIA
    380                                                          RADIO FREE ASIA
    381                                                                     SBIR
    382                                            SMALL BUSINESS ADMINISTRATION
    383                                            SMALL BUSINESS ADMINISTRATION
    384                                                                     USTR
    385                                                                     <NA>
    386                                                                     <NA>
    387                                                                     <NA>
    388                                                                     <NA>
    389                                                                     <NA>
    390                                                                     <NA>
    391                                                                     <NA>
    392                                                                     <NA>
    393                                                                     <NA>
    394                                                                     <NA>
    395                                                                     <NA>
    396                                                                     <NA>
    397                                                                     <NA>
    398                                                                     <NA>
    399                                  EXPORT-IMPORT BANK OF THE UNITED STATES
    400                                                                     USTR
    401                                                                     USTR
    402                                                                     USTR
    403                                                                     USTR
    404                                                                     <NA>
    405                                                                     <NA>
    406                                       SECURITIES AND EXCHANGE COMMISSION
    407                                       SECURITIES AND EXCHANGE COMMISSION
    408                                     COMMODITY FUTURES TRADING COMMISSION
    409                                     CONSUMER FINANCIAL PROTECTION BUREAU
    410                                     CONSUMER FINANCIAL PROTECTION BUREAU
    411                                                                      FCC
    412                                                                      FCC
    413                                                                      FCC
    414                                                                      FCC
    415                                              FEDERAL ELECTION COMMISSION
    416                                              FEDERAL ELECTION COMMISSION
    417                                                 FEDERAL TRADE COMMISSION
    418                                                 FEDERAL TRADE COMMISSION
    419                                                                     <NA>
    420                                                                     <NA>
            subagency_acronym                other_aliases
    1                    <NA>                         <NA>
    2                    <NA>                         <NA>
    3                    <NA>                         <NA>
    4                    <NA>                         <NA>
    5                    <NA>                         <NA>
    6                    <NA>                         <NA>
    7                    <NA>                         <NA>
    8                    <NA>                         <NA>
    9                    <NA>                         <NA>
    10                   <NA>                         <NA>
    11                    OLA                         <NA>
    12                   <NA>                         <NA>
    13                    PPO                         <NA>
    14                   <NA>                         <NA>
    15                   <NA>                         <NA>
    16                    OPL                         <NA>
    17                    OPL                         <NA>
    18                   <NA>                         <NA>
    19                    EOP                         <NA>
    20                    PCC                         <NA>
    21                    NSC                         <NA>
    22                    DPC                         <NA>
    23                   <NA>                         <NA>
    24                   <NA>                         <NA>
    25                   <NA>                         <NA>
    26                    OMB                         <NA>
    27                   OFPP                         <NA>
    28                   OPPM                         <NA>
    29                  OFCIO                         <NA>
    30                   MIAO                         <NA>
    31                   MIAO                         <NA>
    32                   <NA>                         <NA>
    33                   <NA>                         <NA>
    34                    NEC                         <NA>
    35                    EOP                         <NA>
    36                    EOP                         <NA>
    37                   <NA>                         <NA>
    38                   <NA>                         <NA>
    39                   OSTP                         <NA>
    40                    CEQ                         <NA>
    41                  ONDCP                         <NA>
    42                  ONDCP                         <NA>
    43  Gender Policy Council                         <NA>
    44                   <NA>                         <NA>
    45                   <NA>                         <NA>
    46                   <NA>                         <NA>
    47                    OPM                         <NA>
    48                    OPM                         <NA>
    49                    GSA                         <NA>
    50                    DOD                         <NA>
    51                    DOD                         <NA>
    52                    DOD                         <NA>
    53                    DOD                         <NA>
    54                    DOD                         <NA>
    55                    DOD                         <NA>
    56             USCYBERCOM                         <NA>
    57                    DOD                         <NA>
    58                    DOD                         <NA>
    59                    DHS                         <NA>
    60                    DHS                         <NA>
    61                    DHS                         <NA>
    62                    DHS                         <NA>
    63                    DHS                         <NA>
    64                    DHS                         <NA>
    65                    CBP                         <NA>
    66                    ICE                         <NA>
    67                    CBP                         <NA>
    68                    CBP                         <NA>
    69                  USCIS                         <NA>
    70                  USCIS                         <NA>
    71                  USCIS                         <NA>
    72                   FEMA                         <NA>
    73                   FEMA                         <NA>
    74                   CISA                         <NA>
    75                   CISA                         <NA>
    76                   CISA                         <NA>
    77                   USCG                         <NA>
    78                   USSS                         <NA>
    79                    TSA                         <NA>
    80                    OIA                         <NA>
    81                    OGC                         <NA>
    82                    OGC                         <NA>
    83                    DHS                         <NA>
    84                    OPA                         <NA>
    85                    OPE                         <NA>
    86                    DHS                         <NA>
    87                    OPS                         <NA>
    88                    OPS                         <NA>
    89                   CRCL                         <NA>
    90                   CRCL                         <NA>
    91                   OIDO                         <NA>
    92                   OIDO                         <NA>
    93                 CISOMB                         <NA>
    94                 CISOMB                         <NA>
    95                 CISOMB                         <NA>
    96                 CISOMB                         <NA>
    97                 CISOMB                         <NA>
    98                 CISOMB                         <NA>
    99                 CISOMB                         <NA>
    100                CISOMB                         <NA>
    101                CISOMB                         <NA>
    102                CISOMB                         <NA>
    103      State Department                         <NA>
    104      State Department                         <NA>
    105      State Department                         <NA>
    106      State Department                         <NA>
    107      State Department                         <NA>
    108      State Department                         <NA>
    109                  ODNI                         <NA>
    110                  ODNI                         <NA>
    111                  ODNI                         <NA>
    112                  ODNI                         <NA>
    113                   CIA                         <NA>
    114                  ODNI                         <NA>
    115                  ODNI                         <NA>
    116                  <NA>                         <NA>
    117                  NCSC                         <NA>
    118                  NCSC                         <NA>
    119                  NCSC                         <NA>
    120                  ODNI                         <NA>
    121                  ODNI                         <NA>
    122                  ODNI                         <NA>
    123                 USAGM                         <NA>
    124                   VOA                         <NA>
    125                   OIG                         <NA>
    126                   OIG                         <NA>
    127                   OIG                         <NA>
    128                  PBS?                         <NA>
    129                   NPR                         <NA>
    130                   NPR                         <NA>
    131                 USAID                         <NA>
    132                 USAID                         <NA>
    133                 USAID                         <NA>
    134                  <NA>                         <NA>
    135                  <NA>                         <NA>
    136                 USAID                         <NA>
    137                  <NA>                         <NA>
    138                  <NA>                         <NA>
    139                  <NA>                         <NA>
    140                   HHS                         <NA>
    141                   HHS                         <NA>
    142                   HHS                         <NA>
    143                   HHS                         <NA>
    144                   HHS                         <NA>
    145                   HHS                         <NA>
    146                   HHS                         <NA>
    147                  USDA                         <NA>
    148                  <NA>                         <NA>
    149                   CBO                         <NA>
    150                   CBO                         <NA>
    151                   CBO                         <NA>
    152                    ED                         <NA>
    153                    ED                         <NA>
    154                    ED                         <NA>
    155                  OESE                         <NA>
    156                  OESE                         <NA>
    157                  OESE                         <NA>
    158                  OESE                         <NA>
    159                  OESE                         <NA>
    160                  OESE                         <NA>
    161                  OESE                         <NA>
    162                   OCR                         <NA>
    163                   OCR                         <NA>
    164                    ED                         <NA>
    165                    ED                         <NA>
    166                    ED                         <NA>
    167                    ED                         <NA>
    168                    ED                         <NA>
    169                    ED                         <NA>
    170                   DOE                         <NA>
    171                   DOE                         <NA>
    172                 CESER                         <NA>
    173                 CESER                         <NA>
    174                DOE-OE                         <NA>
    175               DOE-ONE                         <NA>
    176                  FECM                         <NA>
    177                  EERE                         <NA>
    178                  EERE                         <NA>
    179                  <NA>                         <NA>
    180                  <NA>                         <NA>
    181                  <NA>                         <NA>
    182                  ARPA                         <NA>
    183                  ARPA                         <NA>
    184                  FEMP                         <NA>
    185                  FEMP                         <NA>
    186                  <NA>                         <NA>
    187                   EIA                         <NA>
    188                   EIA                         <NA>
    189                   OIA                         <NA>
    190                   OIA                         <NA>
    191                   AEO                         <NA>
    192                   OIC DOE-IN, DOE/IN, I&CI, OR OIC
    193                   DOE                         <NA>
    194                  <NA>                         <NA>
    195                   OTT                         <NA>
    196                   OTT                         <NA>
    197                   OTT                         <NA>
    198                  <NA>                         <NA>
    199                   OEM                         <NA>
    200                 OCRWM                         <NA>
    201                  NNSA                         <NA>
    202                  NNSA                         <NA>
    203                  NNSA                         <NA>
    204                  NNSA                         <NA>
    205                  FERC                         <NA>
    206                  FECM                         <NA>
    207                   NRC                         <NA>
    208                   NRC                         <NA>
    209                   NRC                         <NA>
    210                   NRC                         <NA>
    211                   EPA                         <NA>
    212                   EPA                         <NA>
    213                   OAR                         <NA>
    214                   OAR                         <NA>
    215                   OAR                         <NA>
    216                   OAR                         <NA>
    217                   OAR                         <NA>
    218                    OW                         <NA>
    219                    OW                         <NA>
    220                  OLEM                         <NA>
    221                  OLEM                         <NA>
    222                  RCRA                         <NA>
    223                 OCSPP                         <NA>
    224                 OCSPP                         <NA>
    225                 OCSPP                         <NA>
    226                  OPPT                         <NA>
    227                   ORD                         <NA>
    228                   ORD                         <NA>
    229                   EPA                         <NA>
    230                   AIO                         <NA>
    231                   AIO                         <NA>
    232                   OGC                         <NA>
    233                   OGC                         <NA>
    234                  <NA>                         <NA>
    235                   OMS                         <NA>
    236                   EPA                         <NA>
    237                  OCFO                         <NA>
    238                  OCFO                         <NA>
    239                  OCFO                         <NA>
    240                   HHS                         <NA>
    241                   CDC                         <NA>
    242                   CDC                         <NA>
    243                   FDA                         <NA>
    244                   NIH                         <NA>
    245                   NIH                         <NA>
    246                   CMS                         <NA>
    247                   CMS                         <NA>
    248                   CMS                         <NA>
    249                   CMS                         <NA>
    250                   ACF                         <NA>
    251                  TANF                         <NA>
    252                   HHS                         <NA>
    253                   ORR                         <NA>
    254                  ACYF                         <NA>
    255                   OHS                         <NA>
    256                   ACL                         <NA>
    257                  HRSA                         <NA>
    258                   IHS                         <NA>
    259                  HRSA                         <NA>
    260                  HRSA                         <NA>
    261                   HHS                         <NA>
    262                 USPHS                         <NA>
    263                   HHS                         <NA>
    264                  ASPR                         <NA>
    265                  ASPR                         <NA>
    266                   OGC                         <NA>
    267                   OGA                         <NA>
    268                   OCR                         <NA>
    269                   OCR                         <NA>
    270                   OCR                         <NA>
    271                   OCR                         <NA>
    272                   OCR                         <NA>
    273                   HUD                         <NA>
    274                   HUD                         <NA>
    275                   HUD                         <NA>
    276                   HUD                         <NA>
    277                   HUD                         <NA>
    278                   HUD                         <NA>
    279                   HUD                         <NA>
    280                   DOI                         <NA>
    281                   DOI                         <NA>
    282                   DOI                         <NA>
    283                   BLM                         <NA>
    284                   CEQ                         <NA>
    285                  USFS                         <NA>
    286                   DOJ                         <NA>
    287                   DOJ                         <NA>
    288                   DOJ                         <NA>
    289                   EAC                         <NA>
    290                   EAC                         <NA>
    291                   EAC                         <NA>
    292                   EAC                         <NA>
    293                   EAC                         <NA>
    294                   DOL                         <NA>
    295                   DOL                         <NA>
    296                   DOL                         <NA>
    297                   DOL                         <NA>
    298                   DOL                         <NA>
    299                   DOL                         <NA>
    300                   DOL                         <NA>
    301                   DOL                         <NA>
    302                   DOL                         <NA>
    303                   DOL                         <NA>
    304                   DOL                         <NA>
    305                   DOL                         <NA>
    306                   DOT                         <NA>
    307                   DOT                         <NA>
    308                 NHTSA                         <NA>
    309                 NHTSA                         <NA>
    310                 NHTSA                         <NA>
    311                   FHA                         <NA>
    312                   FAA                         <NA>
    313                   FAA                         <NA>
    314                  <NA>                         <NA>
    315                   FRA                         <NA>
    316                   FRA                         <NA>
    317                 MARAD                         <NA>
    318                 MARAD                         <NA>
    319                 MARAD                         <NA>
    320                 MARAD                         <NA>
    321                    VA                         <NA>
    322                    VA                         <NA>
    323                    VA                         <NA>
    324                   VHA                         <NA>
    325                   VHA                         <NA>
    326                   VHA                         <NA>
    327                   VHA                         <NA>
    328                   VBA                         <NA>
    329                   HRA                         <NA>
    330                   HRA                         <NA>
    331                   DOC                         <NA>
    332                   DOC                         <NA>
    333                   DOC                         <NA>
    334                   ITA                         <NA>
    335                   ITA                         <NA>
    336                   BIS                         <NA>
    337                   EAR                         <NA>
    338                   BIS                         <NA>
    339                  NOAA                         <NA>
    340                  NOAA                         <NA>
    341                   BEA                         <NA>
    342                   BEA                         <NA>
    343                   BEA                         <NA>
    344         Census Bureau                         <NA>
    345         Census Bureau                         <NA>
    346                   EDA                         <NA>
    347                  MBDA                         <NA>
    348                  MBDA                         <NA>
    349                  NIST                         <NA>
    350                  NTIA                         <NA>
    351                  NTIA                         <NA>
    352              Treasury                         <NA>
    353              Treasury                         <NA>
    354                   IRS                         <NA>
    355                   IRS                         <NA>
    356                   IRS                         <NA>
    357                  <NA>                         <NA>
    358                  <NA>                         <NA>
    359                  <NA>                         <NA>
    360                  <NA>                         <NA>
    361                 CFIUS                         <NA>
    362                 CFIUS                         <NA>
    363                  <NA>                         <NA>
    364                  <NA>                         <NA>
    365                  <NA>                         <NA>
    366                  EXIM                         <NA>
    367                  EXIM                         <NA>
    368                  EXIM                         <NA>
    369                  <NA>                         <NA>
    370                  <NA>                         <NA>
    371                  <NA>                         <NA>
    372                  NGDP                         <NA>
    373                  <NA>                         <NA>
    374                  <NA>                         <NA>
    375                  <NA>                         <NA>
    376                  <NA>                         <NA>
    377                  <NA>                         <NA>
    378                  <NA>                         <NA>
    379                   RFA                         <NA>
    380                   RFA                         <NA>
    381                  <NA>                         <NA>
    382                  <NA>                         <NA>
    383                  <NA>                         <NA>
    384                  USTR                         <NA>
    385                  <NA>                         <NA>
    386                  <NA>                         <NA>
    387                  <NA>                         <NA>
    388                  <NA>                         <NA>
    389                  <NA>                         <NA>
    390                  <NA>                         <NA>
    391                  <NA>                         <NA>
    392                  <NA>                         <NA>
    393                  <NA>                         <NA>
    394                  <NA>                         <NA>
    395                  <NA>                         <NA>
    396                  <NA>                         <NA>
    397                  <NA>                         <NA>
    398                  <NA>                         <NA>
    399                  EXIM                         <NA>
    400                  USTR                         <NA>
    401                  USTR                         <NA>
    402                  USTR                         <NA>
    403                  USTR                         <NA>
    404                  <NA>                         <NA>
    405                  <NA>                         <NA>
    406                   SEC                         <NA>
    407                   SEC                         <NA>
    408                  CFTC                         <NA>
    409                  CFPB                         <NA>
    410                  CFPB                         <NA>
    411                   FCC                         <NA>
    412                   FCC                         <NA>
    413                   FCC                         <NA>
    414                   FCC                         <NA>
    415                   FEC                         <NA>
    416                   FEC                         <NA>
    417                   FTC                         <NA>
    418                   FTC                         <NA>
    419                  <NA>                         <NA>
    420                  <NA>                         <NA>

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
