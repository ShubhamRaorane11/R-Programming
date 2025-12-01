library(dplyr)

nba <- read.csv("final_data.csv")

print(head(nba, 3))

selected_basic <- nba %>%
  select(GAME_ID, TEAM_ID, TEAM_NAME, FGM, FGA)

print(head(selected_basic, 3))

selected_range <- nba %>%
  select(FGM:FT_PCT)

print(head(selected_range, 3))

selected_start_f <- nba %>%
  select(starts_with("FG"))

print(head(selected_start_f, 3))

dropped_team <- nba %>%
  select(-TEAM_NAME)

print(names(dropped_team))

dropped_multiple <- nba %>%
  select(-TEAM_NAME, -TEAM_ABBREVIATION, -HOME_TEAM)

print(names(dropped_multiple))

dropped_range <- nba %>%
  select(-(FGM:FT_PCT))

print(names(dropped_range))
