print("--- 3. Cross-Tabulation (From Location vs To Location) ---")

book <- read.csv("bookstore_inventory.csv")

# Question: How many shipments went FROM each warehouse TO each store/branch?

cross_tab_locations <- table(book$from, book$to)

print(cross_tab_locations)