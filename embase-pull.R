#### Loading EMBASE

library(tidyverse)

embase1 <- read_csv("embase1.csv")
embase2 <- read_csv("embase2.csv")

embase <- bind_rows(embase1, embase2)

embase <- embase[,1:33]

embase <- embase %>%
  mutate(PMID = as.character(`Medline PMID`))

PMID_dupes <- filter(embase, PMID %in% amr_df$PMID)

PMID_dupes_dframe <- left_join(embase, amr_df, by = c("PMID" = "PMID")) %>%
  filter(!is.na()) %>%
  select(Title.x, ArticleTitle)
  
