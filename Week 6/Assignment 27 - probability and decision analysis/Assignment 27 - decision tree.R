


## create a dataframe 
place <- c("Outside","Inside","Porch","Outside","Inside","Porch")
weather <- c("Sunny","Sunny","Sunny","Rainy","Rainy","Rainy")
prob <- c(0.4,0.4,0.4,0.6,0.6,0.6)
value <- c(100,40,90,0,50,20)
kim_party_place <- data.frame(place,weather,prob,value)
descision(kim_party_place)

descision <- function(kim_party_place){
  outside <- 0
  inside <- 0
  porch <- 0 
  for(i in 1:nrow(kim_party_place)){
    place_case <- kim_party_place$place[i]
    weather_case <- kim_party_place$weather[i]
    prob_i <- kim_party_place$prob[i]
    value_i <- kim_party_place$value[i]
    if(place_case == "Outside"){
      if(weather_case == "Sunny"){
        outside <- outside + prob_i * value_i
      } else {outside <- outside + prob_i * value_i}
    } else if (place_case == "Inside") {
      if(weather_case == "Sunny"){
        inside <- inside + prob_i * value_i
      } else {inside <- inside + prob_i * value_i}
    } else {
      if(weather_case == "Sunny"){
        porch <- porch + prob_i * value_i
      } else {porch <- porch + prob_i * value_i}
    }
  }
  if(outside > inside && outside > porch){
    print(paste0("The Outside option is prefered with the value of ", outside))
  } else if (inside > outside && inside > porch) {
    print(paste0("The Inside option is prefered with the value of ", inside))   
  } else {
    print(paste0("The Porch option is prefered with the value of ", porch))
  }
}





