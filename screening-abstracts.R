library(metagear)
library(stringr)

#SCREENING ABSTRACT / TITLE

screen<- function(name){
  if(str_detect(name, "[Aa]llison")) {
    abstract_screener("allison_amr.csv", aReviewer = "Allison", abstractColumnName = "AbstractText", titleColumnName = "ArticleTitle")
  }
  if(str_detect(name, "[Cc]ale")) {
    abstract_screener("cale_amr.csv", aReviewer = "Cale", abstractColumnName = "AbstractText", titleColumnName = "ArticleTitle")
  }
  if(str_detect(name, "[Bb]rooke")) {
    abstract_screener("brooke_amr.csv", aReviewer = "Brooke", abstractColumnName = "AbstractText", titleColumnName = "ArticleTitle")
  }
}


### Screen your name here to start GUI ~ and remember to save!
screen("cale")
