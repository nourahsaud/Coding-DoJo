# Install packages 
install.packages('ggplot2')
install.packages('patchwork')
install.packages('dplyr')
install.packages("ggpubr")


# Import dataset from excel file 
library(readxl)
candy <- read_excel(file.choose())
View(candy)


library(tidyverse)

# Remove all unneeded columns 
remove_col <- candy %>% select(-c(Timestamp, "Which state, province, county do you live in?", "[Anonymous brown globs that come in black and orange wrappers]", "[Any full-sized candy bar]", "[Bonkers (the board game)]", 
                                       "[Bottle Caps]", "[Broken glow stick]", "[Candy that is clearly just the stuff given out for free at restaurants]", "[Cash, or other forms of legal tender]", "[Chardonnay]", 
                                       "[Creepy Religious comics/Chick Tracts]", "[Dental paraphenalia]", "[Dots]", "[Generic Brand Acetaminophen]", "[Glow sticks]", "[Hugs (actual physical hugs)]", "[Kale smoothie]", 
                                       "[Mary Janes]", "[Mint Juleps]","[Pencils]", "[Person of Interest Season 3 DVD Box Set (not including Disc 4 with hilarious outtakes)]", "[Spotted Dick]", "[Sweetums (a friend to diabetes)]",
                                       "[Vials of pure high fructose corn syrup, for main-lining into your vein]", "[Vicodin]", "[White Bread]", "[Whole Wheat anything]", "Please list any items not included above that give you JOY.", 
                                       "Please list any items not included above that give you DESPAIR.", "Please leave any witty, snarky or thoughtful remarks or comments regarding your choices.", "Guess the number of mints in my hand.", 
                                       "What is your favourite font?", "That dress* that went viral a few years back - when I first saw it, it was ________", "Please estimate the degree(s) of separation you have from the following celebrities [JK Rowling]", 
                                       "Please estimate the degree(s) of separation you have from the following celebrities [JJ Abrams]", "Please estimate the degree(s) of separation you have from the following celebrities [Beyonce]",
                                       "Please estimate the degree(s) of separation you have from the following celebrities [Bieber]", "Please estimate the degree(s) of separation you have from the following celebrities [Kevin Bacon]",
                                       "Please estimate the degree(s) of separation you have from the following celebrities [Francis Bacon (1561 - 1626)]", "Do you eat apples the correct way, East to West (side to side) or do you eat them like a freak of nature, South to North (bottom to top)?",
                                       "When you see the above image of the 4 different websites, which one would you most likely check out (please be honest).","[York Peppermint Patties] Ignore"))
view(remove_col)

# Rename multiple columns of the data frame at once
rename_col <- rename(remove_col, c(Going_out = "Are you going actually going trick or treating yourself?", Gender ="Your gender:", Age="How old are you?", Country="Which country do you live in?", Grand_Bar= "[100 Grand Bar]", Black_Jacks= "[Black Jacks]", Bonkers_candy="[Bonkers (the candy)]", 
                                     Cadbury_Creme_Eggs="[Cadbury Creme Eggs]", Box_o_Raisins="[Box'o'Raisins]", Butterfinger= "[Butterfinger]", Candy_Corn="[Candy Corn]", Caramellos="[Caramellos]", Chick_o_Sticks="[Chick-o-Sticks (we dont know what that is)]", Chiclets="[Chiclets]",
                                     Coffee_Crisp="[Coffee Crisp]", Dove_Bars="[Dove Bars]", Fuzzy_Peaches="[Fuzzy Peaches]", Goo_Goo_Clusters="[Goo Goo Clusters]", Good_N_Plenty="[Good N' Plenty]", Baseball_cards_gum="[Gum from baseball cards]", Gummy_Bears="[Gummy Bears straight up]", Hard_Candy="[Hard Candy]", Healthy_Fruit="[Healthy Fruit]" ,
                                     Heath_Bar="[Heath Bar]", Hershey_Dark_Chocolate="[Hershey's Dark Chocolate]", Hershey_Milk_Chocolate="[Hersheys Milk Chocolate]", Hershey_Kisses="[Hershey's Kisses]", Jolly_Rancher_bad_flavor="[Jolly Rancher (bad flavor)]", Jolly_Ranchers_good_flavor="[Jolly Ranchers (good flavor)]", 
                                     JoyJoy_Mit_Iodine="[JoyJoy (Mit Iodine!)]", Junior_Mints="[Junior Mints]", Senior_Mints="[Senior Mints]", Kinder_Happy_Hippo="[Kinder Happy Hippo]", Kit_Kat="[Kit Kat]", LaffyTaffy="[LaffyTaffy]", LemonHeads="[LemonHeads]", Licorice_white="[Licorice (not black)]", 
                                     Licorice_black="[Licorice (yes black)]", Lindt_Truffle="[Lindt Truffle]", Lollipops="[Lollipops]", Mars="[Mars]", Maynards="[Maynards]", Mike_and_Ike="[Mike and Ike]", Milk_Duds="[Milk Duds]", Milky_Way="[Milky Way]", Regular_MNMs="[Regular M&Ms]", Peanut_MNMs="[Peanut M&Ms]",
                                     Blue_MNMs="[Blue M&M's]", Red_MNMs="[Red M&M's]", Third_Party_MNMs="[Third Party M&M's]", Minibags_chips="[Minibags of chips]", Mint_Kisses="[Mint Kisses]", Mr_Goodbar="[Mr. Goodbar]", Necco_Wafers="[Necco Wafers]", Nerds="[Nerds]", Nestle_Crunch="[Nestle Crunch]", 
                                     Now_N_Laters="[Now'n'Laters]", Peeps="[Peeps]", Pixy_Stix="[Pixy Stix]", Reese_PeanutButter_Cups="[Reeses Peanut Butter Cups]", Reese_Pieces="[Reese's Pieces]", Reggie_Jackson_Bar="[Reggie Jackson Bar]", Rolos="[Rolos]", Skittles="[Skittles]", Smarties_American="[Smarties (American)]", 
                                     Smarties_Commonwealth="[Smarties (Commonwealth)]", Snickers="[Snickers]", Sourpatch_Kids= "[Sourpatch Kids (i.e. abominations of nature)]", Sweet_Tarts="[Sweet Tarts]", Swedish_Fish="[Swedish Fish]", Tic_Tacs="[Tic Tacs]", Circus_peanut="[Those odd marshmallow circus peanut things]", 
                                     Trail_Mix="[Trail Mix]", Twix="[Twix]", Whatchamacallit="[Whatchamacallit Bars]", York_Peppermint_Patties="[York Peppermint Patties]", Betty_or_Veronica="Betty or Veronica?", Friday_or_Sunday="Which day do you prefer, Friday or Sunday?", Tolberone="[Tolberone something or other]"))

view(rename_col)

# Replace the column [Gender] values as (Male,Female ,Unspecified)  
replace_col <- rename_col %>% 
  mutate(Gender = replace(Gender, Gender == "I'd rather not say", "Unspecified")) %>% 
# Replace the column [Country] values to be in one format 
  mutate(Country = replace(Country, Country %in% c('America', 'america', 'EUA', 'Merica', 'Murica',  'the best one - usa','The republic of Cascadia',
                                                   'The Yoo Ess of Aaayyyyyy', 'U.S.', 'u.s.', 'U.s.', 'U.S.A.', 'United  States of America', 'United Sates', 
                                                   'United State', 'united states', 'United states', 'United States of America', 'united states of america', 
                                                   'United Stetes', 'Units States', 'US', 'Us', 'us', 'Usa', 'USA', 'uSA', 'usa', 'USA USA USA', 
                                                   'USA USA USA USA', 'USA!', 'USA! USA!', 'USA! USA! USA!', 'USA!!!!!!', 'USSA','UNited States'), 'United States')) %>% 
  mutate(Country = replace(Country, Country == 'belgium', 'Belgium')) %>% 
  mutate(Country = replace(Country, Country == 'Brasil', 'Brazil')) %>% 
  mutate(Country = replace(Country, Country == 'canada', 'Canada')) %>% 
  mutate(Country = replace(Country, Country == 'croatia', 'Croatia')) %>% 
  mutate(Country = replace(Country, Country %in% c('England', 'england', 'UK', 'uk', 'United Kindom'), 'United Kingdom')) %>% 
  mutate(Country = replace(Country, Country == 'españa', 'Spain')) %>% 
  mutate(Country = replace(Country, Country == 'france', 'France')) %>% 
  mutate(Country = replace(Country, Country == 'germany', 'Germany')) %>% 
  mutate(Country = replace(Country, Country == 'hungary', 'Hungary')) %>% 
  mutate(Country = replace(Country, Country == 'kenya', 'Kenya')) %>% 
  mutate(Country = replace(Country, Country %in% c('netherlands', 'The Netherlands'), 'Netherlands')) %>% 
  mutate(Country = replace(Country, Country == 'Korea', 'South Korea')) %>% 
  mutate(Country = replace(Country, Country == 'sweden', 'Sweden'))  
  
# Replace blank value NA in the [Gender] column to Unspecified
replace_col$Gender[which(is.na(replace_col$Gender))] <- "Unspecified" 

view(replace_col)

#clean all the other NA values in the data frame 
tidy_candy <- na.omit(replace_col) 

view(tidy_candy)

# 1st  (Who participated in the survey?)
ggplot(data = tidy_candy) + 
  geom_point(mapping = aes(x =Gender , y = Age, colour = Country))

# 2nd  Going to trick or treating ? (based on Age and Gender) 
ggplot(data = tidy_candy) + 
  geom_point(mapping = aes(x =Age , y = Going_out, colour = Gender))


# 3rd ([Healthy Fruit])
count_fruit <- table(tidy_candy$Healthy_Fruit, tidy_candy$Gender)
count_fruit
barplot(count_fruit, 
        main= "Frequency of Healthy fruit and gender ",
        xlab = "Gender",
        ylab = "Frequency",
        legend = rownames(count_fruit),
        col = c("#cebbd9", "#faaac4", "#ff69b4"),
)

# 4th (Hershey products comparision)
library(ggpubr)
library(ggplot2)
library(purrr)
par(mfrow=c(3,1))
dark_chocolate_count <- table(tidy_candy$Hershey_Dark_Chocolate)
dark_chocolate <- barplot(dark_chocolate_count, main= "Frequency of Hershey's Dark Chocolate ",
                          xlab = "Hershey's Dark Chocolate", ylab = "Frequency",
                          legend = rownames(dark_chocolate_count),
                          col = c("#cebbd9", "#faaac4", "#ff69b4"),
                          )

milk_chocolate_count <- table(tidy_candy$Hershey_Milk_Chocolate)
milk_chocolate <- barplot(milk_chocolate_count, main= "Frequency of Hershey's Milk Chocolate ",
                          xlab = " Hershey's DMilk Chocolate", ylab = "Frequency",,
                          col = c("#cebbd9", "#faaac4", "#ff69b4"),
                          )

kisses_count <- table(tidy_candy$Hershey_Kisses)
kisses <- barplot(kisses_count, main= "Frequency of Hershey's Kisses ",
                  xlab = "Hershey's Kisses", ylab = "Frequency",,
                  col = c("#cebbd9", "#faaac4", "#ff69b4"),
                  )

dark_chocolate_count
milk_chocolate_count
kisses_count

write.csv(tidy_candy,"~/Desktop/Learn /Data Science bootcamp /Projects/R/shiny/tidy_candy.csv", row.names = FALSE)

