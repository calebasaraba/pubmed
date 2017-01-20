### PUBMED

library(RISmed)
library(tidyverse)
library(metagear)
library(stringr)


amr_query <- "(((((((antibiotic AND (resistance OR resistant))) OR (antimicrobial AND (resistance OR resistant))) AND (novel OR first OR new OR emerging OR emergent)) AND (case OR patient)) AND humans[Filter]) AND (\"2006\"[Date - Publication] : \"2017\"[Date - Publication]))"

amr_search <- EUtilsSummary(amr_query, retmax = 15000)

amr_records <- EUtilsGet(amr_search)

amr_df <- tibble(PMID = PMID(amr_records), Author = Author(amr_records), YearEpublish = YearEpublish(amr_records), MonthEpublish = MonthEpublish(amr_records),
                     YearPpublish = YearPpublish(amr_records), MonthPpublish = MonthPpublish(amr_records), ISSN = ISSN(amr_records),
                     Title = Title(amr_records), ArticleTitle = ArticleTitle(amr_records), AbstractText = AbstractText(amr_records),
                     Affiliation = Affiliation(amr_records), Language = Language(amr_records), PublicationType = PublicationType(amr_records),
                     MedlineTA = MedlineTA(amr_records), NlmUniqueID = NlmUniqueID(amr_records), ISSNLinking = ISSNLinking(amr_records),
                     PublicationStatus = PublicationStatus(amr_records), ArticleId = ArticleId(amr_records), Volume = Volume(amr_records),
                     Issue = Issue(amr_records), ISOAbbreviation = ISOAbbreviation(amr_records), Country = Country(amr_records))

initialized_amr <- effort_initialize(amr_df)

distributed_amr <- effort_distribute(initialized_amr, reviewers = c("Cale", "Allison", "Brooke")) %>%
  select(-Author, -PublicationType)


distributed_amr %>%
  filter(REVIEWERS == "Allison") %>%
  write_csv("allison_amr.csv")

distributed_amr %>%
  filter(REVIEWERS == "Brooke") %>%
  write_csv("brooke_amr.csv")

distributed_amr %>%
  filter(REVIEWERS == "Cale") %>%
  write_csv("cale_amr.csv")

