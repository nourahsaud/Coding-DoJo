
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

two_players_points <- function(hand_size){
  
  hand <- shuffle_deal(2,hand_size)
  p1 <- hand[[1]]
  p2 <- hand[[2]]
  p1_points <- 0
  p2_points <- 0
  for(i in 1:hand_size){
    p1_points <- p1_points + p1$value[i]
    p2_points <- p2_points + p2$value[i]
  }
  if (p1_points > p2_points){
    print('Player 1 has higher points than player 2')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
  } else if (p2_points > p1_points) {
    print('Player 2 has higher points than player 1')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
  } else {print(paste0('They are equal with points of ', p1_points))}
}

three_players_points <- function(hand_size){
  
  hand <- shuffle_deal(3,hand_size)
  p1 <- hand[[1]]
  p2 <- hand[[2]]
  p3 <- hand[[3]]
  p1_points <- 0
  p2_points <- 0
  p3_points <- 0
  for(i in 1:hand_size){
    p1_points <- p1_points + p1$value[i]
    p2_points <- p2_points + p2$value[i]
    p3_points <- p3_points + p3$value[i]
  }
  if (p1_points > p2_points && p1_points > p3_points){
    print('Player 1 has the heighest points')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
    print(paste0('Player 3 points ', p3_points))
  } else if (p2_points > p1_points && p2_points > p3_points) {
    print('Player 2 has the heighest points')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
    print(paste0('Player 3 points ', p3_points))
  } else if (p3_points > p1_points && p3_points > p2_points) {
    print('Player 3 has the heighest points')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
    print(paste0('Player 3 points ', p3_points))
  }else {print('Some players have equal with points of ')
    print(paste0('Player 1 points ', p1_points))
    print(paste0('Player 2 points ', p2_points))
    print(paste0('Player 3 points ', p3_points))}
}

players <- 5
hand_size <- 5
hands <- shuffle_deal(players,hand_size)
hands
two_players_points(3)
three_players_points(4)
