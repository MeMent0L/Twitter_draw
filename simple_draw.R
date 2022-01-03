library(foreign)
library(dplyr)
library(xlsx)

################# Read XLSX file

RESP = read.xlsx('Xmas 21 Promo on Twitter - Winners Draw.xlsx', 1)

################# Remove last 3 participants as they are part of core team or they are group members (LRT, realdatawhale, iamfredmartin)

RESP = head(RESP,16)

################# Select the winner
# find a random number between 1 and the number of people selected
# set.seed with the date the draw is made to select ID(s) randomly

id_winners = c()
set.seed(03012022)

for (i in 1:1) {
  id_winners = c(id_winners, sample(RESP$ID, 1))
}

RESP_Winners = RESP %>% slice(id_winners)

colnames(RESP_Winners) = c("ID", "Handle", "Tweet", "Retweet", "Certificate", "Tag" ) 

write.csv(RESP_Winners, "RESP_Winners.csv", row.names = FALSE) 
