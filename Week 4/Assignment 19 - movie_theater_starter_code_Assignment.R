# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack
# 2. Pretend you own multiple theaters and run two simulations to represent each theater and plot the results
# 3. Create conditional statements for movies that may be PG-13 and children are not allowed to watch

# set the seed to generate random number 
set.seed(1)

# Global variables 
{
movie <- c('Frozen 2', 'Tom and Jerry: The Movie', 'The Crime Boss',
           'Promising Yong Woman', 'The Mauritanian')  # List of 5 movies
movie_rate <- list('Frozen 2' = 'PG', 'Tom and Jerry: The Movie' = 'PG', 'The Crime Boss' = 'R15', 
                   'Promising Yong Woman' = 'R18', 'The Mauritanian ' = 'R15') # List of movie's rate
screens <- c(1,2,3,4,5) # Number of screens in the theater 

theater1_visitors <- rep(0,7) # Stores total visitors in theater 1
theater2_visitors <- rep(0,7) # Stores total visitors in theater 2

week_days <- rep(0, 7)  # Store totals for each day in theater 1
theater2_week_days <- rep(0, 7)  # Store totals for each day in theater 2 
}

#Theater 1 
Theater1 <- function(){
  # Cost for adults and children
  ticket_cost <- 18L
  ticket_cost_child <- 14L 
  seats <- 100 # Number of seats that each theater hold 
  #Amount of snacks 
  food_amount <- 10000
  beverage_amount <- 10000
  theater <- 'Theater 1' # to be used as an argument for the Snack function 
  # iterate through the week
  for (i in 1:7) {
    # Keep track of total revenue for the day
    snack_revenue <- 0 # recount for the next day
    total_revenue <- 0 # recount for the next day
    total_cost <- 0 # recount for the next day 
    net_profit <- 0 # recount for the next day
    visitors <- 0 # default value 
    # Assign number of screens 
    number_of_screens <- sample(5:25, 1, replace = TRUE)
    # Assign movies to the screens
    movie <- rep(movie, len = number_of_screens)
    # iterate through the amount of screens on a particular day
    for (j in 1:number_of_screens) {
      # Ticket revenue 
      # Check if the movie is allowed for children or not 
      if(movie_rate[movie[j]] == 'PG'){
        # define how many adults and children are watching the movie
        visitors_adult <- sample(100, 1)
        children <- 100 - visitors_adult 
        visitors_children <- sample(children,1)
        # Calculate the total number of visitors -- to be used for the snacks function
        visitors <- visitors_adult + visitors_children
        # Discounted tickets for frozen movie
        if(movie[j] == "Frozen 2"){
          ticket_cost <- ticket_cost * 0.8
          ticket_cost_child <- ticket_cost_child * 0.8 
        }else {
          ticket_cost <- 18
          ticket_cost_child <- 14
        }
        # Calculate the revenue for adults and children
        movie_revenue = visitors_adult * ticket_cost + visitors_children * ticket_cost_child 
        }else{
        # define  how many adults are watching the movie
        visitors_adult <- sample(100, 1)
        # Calculate the total number of visitors -- to be used for the snacks function
        visitors <- visitors_adult
        # Calculate the revenue for adults 
        movie_revenue = visitors_adult * ticket_cost
      }
      
      # Snack revenue 
      # Check snack availability and calculate snack revenue
      # define the number of buyers 
      number_of_visitors <- sample(visitors,1)
      if (number_of_visitors <= food_amount){
        snack <- 'Food' # to be used as an argument for the Snack function 
        food_revenue <- snacks(theater, snack, number_of_visitors) # calculate snack revenue 
        food_amount <- food_amount - number_of_visitors # update the food_amount 
      }
      # define the number of buyers 
      number_of_visitors <- sample(visitors,1)
      if (number_of_visitors <= beverage_amount){
        snack <- 'Beverage' # to be used as an argument for the Snack function 
        beverage_revenue <- snacks(theater, snack, number_of_visitors) # calculate snack revenue 
        beverage_amount <- beverage_amount - number_of_visitors # update the beverage_amount 
      }
      # Calculate snack revenue 
      snack_revenue <- food_revenue + beverage_revenue
      # Calculate total revenue, and add to running total for the day 
      total_revenue <- total_revenue + movie_revenue + snack_revenue
      
      # Calculate Costs 
      property_rent_cost <- 2500 # Rent cost per a day 
      managers <- 2 # Number of managers employee
      emp <- 15 # Number of the other employees: theater usher, cashier, cleaner ... etc 
      emp_cost <- employees(managers,emp) # stores employees salaries cost per a day 
      total_cost <- property_rent_cost + emp_cost # Calculate total cost 
      
      net_profit = total_revenue - total_cost # Calculate net profit per a day 
      
    }
    # Save total to the corresponding day
    week_days[i] <- net_profit
    theater1_visitors[i] <- visitors
  }
}

#Theater 2 
Theater2 <- function(){
  # Cost for adults and children
  t2_ticket_cost <- 50L
  t2_ticket_cost_child <- 30L 
  seats <- 30 # Number of seats that each theater hold 
  #Amount of snacks 
  t2_food_amount <- 5000
  t2_beverage_amount <- 5000
  theater <- 'Theater 2' # to be used as an argument for the Snack function 
  # iterate through the week
  for (i in 1:7) {
    # Keep track of total revenue for the day
    t2_snack_revenue <- 0 # recount for the next day
    t2_total_revenue <- 0 # recount for the next day
    t2_total_cost <- 0 # recount for the next day 
    t2_net_profit <- 0 # recount for the next day
    t2_visitors <- 0 # default value 
    # Assign number of screens 
    number_of_screens <- sample(5:25, 1, replace = TRUE)
    # Assign movies to the screens
    movie <- rep(movie, len = number_of_screens)
    # iterate through the amount of screens on a particular day
    for (j in 1:number_of_screens) {
      # Ticket revenue 
      # Check if the movie is allowed for children or not 
      if(movie_rate[movie[j]] == 'PG'){
        # define how many adults and children are watching the movie
        t2_visitors_adult <- sample(30, 1)
        t2_children <- 30 - t2_visitors_adult 
        t2_visitors_children <- sample(t2_children,1)
        # Calculate the total number of visitors -- to be used for the snacks function
        t2_visitors <- t2_visitors_adult + t2_visitors_children
        # Calculate the revenue for adults and children
        t2_movie_revenue = t2_visitors_adult * t2_ticket_cost + t2_visitors_children * t2_ticket_cost_child 
      }else{
        # define  how many adults are watching the movie
        t2_visitors_adult <- sample(30, 1)
        # Calculate the total number of visitors -- to be used for the snacks function
        t2_visitors <- t2_visitors_adult
        # Calculate the revenue for adults 
        t2_movie_revenue = t2_visitors_adult * t2_ticket_cost
      }
      
      # Snack revenue 
      # Check snack availability and calculate snack revenue
      # define the number of buyers 
      number_of_visitors <- sample(t2_visitors,1)
      if (number_of_visitors <= food_amount){
        snack <- 'Food' # to be used as an argument for the Snack function 
        t2_food_revenue <- snacks(theater, snack, number_of_visitors) # calculate snack revenue 
        t2_food_amount <- t2_food_amount - number_of_visitors # update the food_amount 
      }
      # define the number of buyers 
      number_of_visitors <- sample(t2_visitors,1)
      if (number_of_visitors <= beverage_amount){
        snack <- 'Beverage' # to be used as an argument for the Snack function 
        t2_beverage_revenue <- snacks(theater, snack, number_of_visitors) # calculate snack revenue 
        t2_beverage_amount <- t2_beverage_amount - number_of_visitors # update the beverage_amount 
      }
      # Calculate snack revenue 
      t2_snack_revenue <- t2_food_revenue + t2_beverage_revenue
      # Calculate total revenue, and add to running total for the day 
      t2_total_revenue <- t2_total_revenue + t2_movie_revenue + t2_snack_revenue
      
      # Calculate Costs 
      t2_property_rent_cost <- 1000 # Rent cost per a day 
      managers <- 2 # Number of managers employee
      emp <- 10 # Number of the other employees: theater usher, cashier, cleaner ... etc 
      t2_emp_cost <- employees(managers,emp) # stores employees salaries cost per a day 
      t2_total_cost <- property_rent_cost + emp_cost # Calculate total cost 
      
      t2_net_profit = t2_total_revenue - t2_total_cost # Calculate net profit per a day 
      
    }
    # Save total to the corresponding day
    theater2_week_days[i] <- t2_net_profit
    theater2_visitors[i] <- t2_visitors
  }
}

# Snack function 
snacks <- function(theater, snack, number_of_visitors){
  snacks_revenue <- 0 
  #check if its theater 1 
  if(theater == 'Theater 1'){
    # List of Food snacks 
    food <- c('Hotdog','Burger','Frise', 'Popcorn','Nachos')
    food_cost <- 10
    # List of beverage snacks
    beverage <- c('Soft drinks', 'Water', 'Ice tea')
    beverage_cost <- 2
    
    if (snack == 'Food'){
      # Assign who buys which snack for each movie 
      visitors_food_orders <- sample(food, number_of_visitors, replace = TRUE)
      # Calculate the snack revenue for each movie for food 
      snacks_revenue <- number_of_visitors * food_cost
    }
    
    if (snack == 'Beverage'){
      # Assign who buys which snack for each movie
      visitors_beverage_orders <- sample(beverage, number_of_visitors, replace = TRUE)
      # Calculate the snack revenue for each movie for beverage
      snacks_revenue <- number_of_visitors * beverage_cost 
    }
    return (snacks_revenue)
  }
  #check if its theater 2  
  if (theater == 'Theater 2'){
    # List of Food snacks 
    theater2_food <- c('Steak', 'Salmon', 'Nachos & Popcorn', 'Burger', 'Risotto')
    theater2_food_cost <- 25
    # List of beverage snacks
    theater2_beverage <- c('Sparkling','Soft drinks', 'Water', 'Ice tea')
    theater2_beverage_cost <- 10
    
    if (snack == 'Food'){
      # Assign who buys which snack for each movie 
      theater2_visitors_food_orders <- sample(theater2_food, number_of_visitors, replace = TRUE)
      # Calculate the snack revenue for each movie for food 
      snacks_revenue <- number_of_visitors * theater2_food_cost
    }
    
    if (snack == 'Beverage'){
      # Assign who buys which snack for each movie
      theater2_visitors_beverage_orders <- sample(theater2_beverage, number_of_visitors, replace = TRUE)
      # Calculate the snack revenue for each movie for beverage
      snacks_revenue <- number_of_visitors * theater2_beverage_cost 
    }
    return (snacks_revenue)}}

# Employee function 
employees <- function(managers,emp){
  emp_salary = 50
  manager_salary = 150
  return(emp_salary*emp + manager_salary*managers)
}

  # Make a barchart showing total revenue per day 
  {
  days <- c('Sun','Mon','Tue','Wed','Thu','Fri','Sat')
  theaters_revenue <- as.matrix(data.frame(week_days, theater2_week_days))

  # Calculate the total revenue per a week for theater 1 and 2 
  Theater1_total_revenue <- sum(week_days)
  format(round(Theater1_total_revenue, 2), nsmall = 2)
  Theater2_total_revenue <- sum(theater2_week_days)
  format(round(Theater2_total_revenue, 2), nsmall = 2)

    barplot(week_days, names.arg = days, col = '#C6DEFF',
            main = 'Theater 1 Revenue', xlab = 'Days', ylab = 'Revenue')
    barplot(theater2_week_days, names.arg = days, col = '#C6DEFF', 
            main = 'Theater 2 Revenue', xlab = 'Days', ylab = 'Revenue')

    barplot(theaters_revenue, col = c('#C6DEFF'), beside = TRUE, 
            names.arg = c('Teater 1','Theater 2'), main = 'Comparison between Theater 1 and 2 revenue')
  }    

  # Make a barchart showing the busiest day  
  {
    days <- c('Sun','Mon','Tue','Wed','Thu','Fri','Sat')
    theaters_visitors <- as.matrix(data.frame(theater1_visitors, theater2_visitors))
    # Calculate the total revenue per a week for theater 1 and 2 
    Theater1_total_visitors <- sum(theater1_visitors)
    format(round(Theater1_total_visitors, 2), nsmall = 2)
    Theater2_total_visitors <- sum(theater2_visitors)
    format(round(Theater2_total_visitors, 2), nsmall = 2)
    barplot(theater1_visitors, names.arg = days, col = '#C6DEFF',
          main = 'Theater 1 Visitors', xlab = 'Days', ylab = 'Visitors')
    barplot(theater2_visitors, names.arg = days, col = '#C6DEFF', 
          main = 'Theater 2 Visitors', xlab = 'Days', ylab = 'Visitors')
  
    barplot(theaters_visitors, col = c('#C6DEFF'), beside = TRUE, 
          names.arg = c('Teater 1','Theater 2'), main = 'Comparison between Theater 1 and 2 revenue')
}    
  # Make any other chart
  {  # load library
  library(ggplot2)

  # Create test data.
  data <- data.frame(
    category=c('Theater 1', 'Theater 2'),
    count=c(Theater1_total_revenue, Theater2_total_revenue)
  )

  # Compute percentages
  data$fraction <- data$count / sum(data$count)

  # Compute the cumulative percentages (top of each rectangle)
  data$ymax <- cumsum(data$fraction)

  # Compute the bottom of each rectangle
  data$ymin <- c(0, head(data$ymax, n=-1))

  # Compute label position
  data$labelPosition <- (data$ymax + data$ymin) / 2

  # Compute a good label
  data$label <- paste0(data$category, "\n value: ", data$count)

  # Make the plot
  ggplot(data, aes(ymax=ymax, ymin=ymin, xmax=4, xmin=3, fill=category )) +
    geom_rect() +
    geom_label( x=3.5, aes(y=labelPosition, label=label), size=3) +
    scale_fill_brewer(palette=3) +
   coord_polar(theta="y") +
   xlim(c(2, 4)) +
    theme_void() +
    theme(legend.position = "none")
  }

  #Which day had the highest revenue? The highest revenue was on sat (Theater 1)

   