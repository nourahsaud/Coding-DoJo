
#import the CSV file 
deck <- read.csv(file.choose())


# shuffle_deal function
shuffle_deal <- function(players, hand_size){
  
  x <- players * hand_size  # stores the sum of players cards 
  
  if (x > 52) { # checks if the card's are not enough for playing
    return(paste('No enouph cards !!!'))
    
  } else { # starts the game
    cards <- sample(deck$X, size = x, replace = FALSE) # shuffle cards
    players_list <- vector(mode = 'list', 1) # empty list to store players cards 
    last_card <- 0L 
    first_card <- 1L # first card for plaer 1 
    for(i in 1:players){
      last_card <- last_card + hand_size # define the last card for player i
      player_cards <- deck[deck$X %in% cards[first_card:last_card],] # stores cards for player i 
      players_list[[i]] <- player_cards 
      first_card <- last_card + 1 # define the first card for player i 
    }
    return(players_list)
  }
}

hands <- shuffle_deal(3,5)
hands

