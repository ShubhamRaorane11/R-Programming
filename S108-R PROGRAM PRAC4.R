library(dplyr)
library(readr)

spotify <- read_csv("spotify_data.csv")

head(spotify)

high_popularity_subset <- subset(spotify, track_popularity > 80)
cat("Number of highly popular tracks (popularity > 80):", nrow(high_popularity_subset), "\n")
summary(high_popularity_subset$track_popularity)

explicit_and_famous_subset <- subset(spotify, explicit == TRUE & artist_followers > 1000000)
cat("Number of explicit tracks by artists with >1M followers:", nrow(explicit_and_famous_subset), "\n")
head(explicit_and_famous_subset)

special_tracks_subset <- subset(spotify, grepl("dark r&b", tolower(artist_genres)) | track_duration_min > 4)
cat("Number of special tracks (dark r&b OR duration > 4 mins):", nrow(special_tracks_subset), "\n")
head(special_tracks_subset)

low_popularity_filter <- spotify |>
  filter(track_popularity < 30)
cat("Number of low-popularity tracks (< 30):", nrow(low_popularity_filter), "\n")
summary(low_popularity_filter$track_popularity)

long_single_filter <- spotify |>
  filter(album_type == "single", track_duration_min > 3.5)
cat("Number of singles longer than 3.5 minutes:", nrow(long_single_filter), "\n")
head(long_single_filter)

album_or_single_filter <- spotify |>
  filter(album_type %in% c("album", "single"))
cat("Number of rows with album_type album or single:", nrow(album_or_single_filter), "\n")
table(album_or_single_filter$album_type)

