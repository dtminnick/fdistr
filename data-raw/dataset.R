
# Load libraries.

library(dplyr)
library(stringr)

# Create sequence of words.

words <- c("lily",
           "the",
           "caretaker’s",
           "daughter",
           "was",
           "literally",
           "run",
           "off",
           "her",
           "feet",
           "hardly",
           "had",
           "she",
           "brought",
           "one",
           "gentleman",
           "into",
           "the",
           "little",
           "pantry",
           "behind",
           "the",
           "office",
           "on",
           "the",
           "ground",
           "floor",
           "and",
           "helped",
           "him",
           "off",
           "with",
           "his",
           "overcoat",
           "than",
           "the",
           "wheezy",
           "hall-door",
           "bell",
           "clanged",
           "again",
           "and",
           "she",
           "had",
           "to",
           "scamper",
           "along",
           "the",
           "bare",
           "hallway",
           "to",
           "let",
           "in",
           "another",
           "guest")

# Coerce to data frame.

words <- data.frame(words, stringsAsFactors = FALSE)

# Add column name.

colnames(words) <- c("word")

# Add additional columns.

words <- words %>%
      mutate(first_letter = str_sub(word, 1, 1),
             last_letter = str_sub(word, str_length(word), str_length(word)),
             letter_count = str_length(word))

# Save data.

usethis::use_data(words, overwrite = TRUE)
