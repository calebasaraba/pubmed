### PUBMED

library(RISmed)


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



##### Testing Stuff
pp <- YearPpublish(amr_records)

table(pp, useNA = "ifany")

ep <- YearEpublish(amr_records)

table(ep, useNA = "ifany")

pubmed <- YearPubmed(amr_records)
table(pubmed, useNA = "ifany")

table(amr_records@YearAccepted, useNA = "ifany")
table(amr_records@YearEpublish, useNA = "ifany")
table(amr_records@YearPpublish, useNA = "ifany")


table(amr_records@ISSN, useNA = "ifany")

dance_query <- "dance"

dance_search <- EUtilsSummary(dance_query, retmax = 15000)

dance_records <- EUtilsGet(dance_search)

table(dance_records@YearPpublish, useNA = "ifany")
table(dance_records@YearEpublish, useNA = "ifany")