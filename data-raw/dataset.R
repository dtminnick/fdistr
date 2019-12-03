
# Load libraries.

library(dplyr)
library(stringr)

# Create sequence of words.

words <- paste("Lily, the caretaker's daughter, was literally run off her feet. ",
               "Hardly had she brought one gentleman into the little pantry behind ",
               "the office on the ground floor and helped him off with his overcoat ",
               "than the wheezy hall-door bell clanged again and she had to scamper ",
               "along the bare hallway to let in another guest. It was well for her ",
               "she had not to attend to the ladies also. But Miss Kate and Miss ",
               "Julia had thought of that and had converted the bathroom upstairs ",
               "into a ladies' dressing-room. Miss Kate and Miss Julia were there, ",
               "gossiping and laughing and fussing, walking after each other to the ",
               "head of the stairs, peering down over the banisters and calling down ",
               "to Lily to ask her who had come.", sep = "")

# Create a data frame of words.

words <- unlist(strsplit(words, " "))

# Remove punctuation.

words <- gsub("[][,.]", "", words)

# Convert all words in the vector to lower case.

words <- str_to_lower(words)

# Coerce to data frame.

words <- as.data.frame(words, stringsAsFactors = FALSE)

# Add column name.

colnames(words) <- c("word")

# Add additional columns.

words <- words %>%
      mutate(first_letter = str_sub(word, 1, 1),
             last_letter = str_sub(word, str_length(word), str_length(word)),
             letter_count = str_length(word),
             starts_with = ifelse(first_letter %in% c("a", "e", "i", "o", "u"),
                                        "vowel",
                                        "consonant"),
             ends_with = ifelse(last_letter %in% c("a", "e", "i", "o", "u"),
                                "vowel",
                                "consonant"))

# Save data.

usethis::use_data(words, overwrite = TRUE)
