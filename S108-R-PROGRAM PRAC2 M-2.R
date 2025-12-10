library(dplyr)
crypto <- read.csv("crypto.csv")

head(crypto)
str(crypto)

# =============================================================================
# 2. Frequency Tables
# =============================================================================
print("--- 2. Frequency Tables (Crypto Dataset) ---")

# A. Using Base R table()
print("Frequency Table: Asset")
asset_counts <- table(crypto$asset)
print(asset_counts)

print("Frequency Table: Symbol")
symbol_counts <- table(crypto$symbol)
print(symbol_counts)

# =============================================================================
# B. Using dplyr::count()
# =============================================================================
print("Frequency Table using dplyr::count() - Asset")
asset_df <- crypto %>% count(asset)
print(asset_df)

print("Frequency Table using dplyr::count() - Symbol")
symbol_df <- crypto %>% count(symbol)
print(symbol_df)
