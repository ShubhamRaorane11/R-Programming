library(dplyr)

nirf <- read.csv("NIRF Ranking 2016.csv", na.strings = c("", "NA"))

print("--- 1. Original Dataset (Preview) ---")
print(head(nirf))

duplicates_report <- nirf %>%
  group_by(Institute.ID, Institute.Name, State, Score, Rank) %>% 
  count() %>%
  filter(n > 1)

print("--- 2. Duplicate Rows (Exact Matches Found) ---")
print(duplicates_report)

nirf_clean_exact <- nirf %>% 
  distinct()

print("--- 3. Dataset After Removing Exact Duplicates ---")
print(nirf_clean_exact)

nirf_unique_institutes <- nirf %>% 
  distinct(Institute.Name, .keep_all = TRUE)

print("--- 4. Unique Institutes Only (1 entry per college) ---")
print(nirf_unique_institutes)
