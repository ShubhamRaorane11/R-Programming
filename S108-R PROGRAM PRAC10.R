library(dplyr)
library(tidyr)

df <- read.csv("NIRF Ranking 2016.csv", na.strings = c("", "NA"))

df_clean <- df %>%
  mutate(
    TLR = replace_na(TLR, 0),
    RPC = replace_na(RPC, 0),
    GO = replace_na(GO, 0),
    OI = replace_na(OI, 0),
    PERCEPTION = replace_na(PERCEPTION, 0),
    Score = replace_na(Score, 0)
  )

print("--- Cleaned Baseline Data ---")
print(head(df_clean))

df_calc <- df_clean %>%
  mutate(
    Performance_Index = (TLR + RPC + GO + OI) / 4
  )

print("--- Method A: Arithmetic Results ---")
print(df_calc %>% select(TLR, RPC, GO, OI, Performance_Index))

df_logic <- df_clean %>%
  mutate(
    Category_Label = ifelse(Score > 75, "Top Institute", "Regular Institute"),
    Rank_Category = ifelse(Rank <= 10, "Top 10", "Others")
  )

print("--- Method B: Logic Results ---")
print(df_logic %>% select(Institute.Name, Score, Category_Label, Rank, Rank_Category))

df_text <- df_clean %>%
  mutate(
    Summary = paste(Institute.Name, "located in", City, "has score", Score)
  )

print("--- Method C: Text Transformation ---")
print(head(df_text$Summary))

final_dataset <- df_clean %>%
  mutate(
    Overall_Index = (TLR + RPC + GO + OI + PERCEPTION) / 5,
    High_Performer = ifelse(Overall_Index > 80, TRUE, FALSE),
    Status_Report = paste0("Score: ", Score, " | Rank: ", Rank)
  )

print("--- Final Combined Dataset ---")
print(head(final_dataset))
