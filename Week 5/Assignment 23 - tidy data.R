library(tidyverse)

#################################### Ex.12.2.1 ####################################
##Using prose, describe how the variables and observations are organized in each of the sample tables.
## Table 1 has 4 cols and 6 rows - each row contains country (chr), year (int), case (int) and population (int) 
table1
#> # A tibble: 6 x 4
#>   country      year  cases population
#>   <chr>       <int>  <int>      <int>
#> 1 Afghanistan  1999    745   19987071
#> 2 Afghanistan  2000   2666   20595360
#> 3 Brazil       1999  37737  172006362
#> 4 Brazil       2000  80488  174504898
#> 5 China        1999 212258 1272915272
#> 6 China        2000 213766 1280428583
## Table 2 has 4 cols and 12 rows, each row contains country (chr), year (int), type (chr) and count (int) 
table2
#> # A tibble: 12 x 4
#>   country      year type           count
#>   <chr>       <int> <chr>          <int>
#> 1 Afghanistan  1999 cases            745
#> 2 Afghanistan  1999 population  19987071
#> 3 Afghanistan  2000 cases           2666
#> 4 Afghanistan  2000 population  20595360
#> 5 Brazil       1999 cases          37737
#> 6 Brazil       1999 population 172006362
#> # … with 6 more rows
# Table 3 has 3 cols and 6 rows, each row contains country (chr), year (int) and rate (chr) 
table3
#> # A tibble: 6 x 3
#>   country      year rate             
#> * <chr>       <int> <chr>            
#> 1 Afghanistan  1999 745/19987071     
#> 2 Afghanistan  2000 2666/20595360    
#> 3 Brazil       1999 37737/172006362  
#> 4 Brazil       2000 80488/174504898  
#> 5 China        1999 212258/1272915272
#> 6 China        2000 213766/1280428583
# Table 4 is spreated into tow each table has 3 cols and 3 cols, each row contains country (chr), '1999' (int) and '2000' (int) 
# Table 4a filtered by cases, Table 4b filtered by population 
# Spread across two tibbles
table4a  # cases
#> # A tibble: 3 x 3
#>   country     `1999` `2000`
#> * <chr>        <int>  <int>
#> 1 Afghanistan    745   2666
#> 2 Brazil       37737  80488
#> 3 China       212258 213766
table4b  # population
#> # A tibble: 3 x 3
#>   country         `1999`     `2000`
#> * <chr>            <int>      <int>
#> 1 Afghanistan   19987071   20595360
#> 2 Brazil       172006362  174504898
#> 3 China       1272915272 1280428583

##Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
  ##Extract the number of TB cases per country per year.
  ##Extract the matching population per country per year.
## filter table 2 by cases 
t2_cases <- filter(table2, type == "cases") %>% 
  rename(cases = count) %>% 
  arrange(country, year) %>% 
  select(-type)
t2_cases
## filter table 2 by population 
t2_pop <- filter(table2, type == "population") %>% 
  rename(population = count) %>%
  arrange(country, year)%>% 
  select(-type)
t2_pop
  ##Divide cases by population, and multiply by 10000.
t2_cases_df <- tibble(
  year = t2_cases$year,
  country = t2_cases$country,
  cases = t2_cases$cases,
  population = t2_pop$population
) %>%
  mutate(rate = (cases / population) * 10000) %>%
  select(country, year, rate)
t2_cases_df
  ##Store back in the appropriate place.
t2_cases_df <- t2_cases_df %>%
  mutate(type = "rate") %>%
  rename(count = rate)
bind_rows(table2, t2_cases_df) %>%
  arrange(country, year, type, count)

## Table 4 
Table4_df <- tibble(
    country = table4a$country,
    `1999` = table4a[["1999"]] / table4b[["1999"]] * 10000,
    `2000` = table4a[["2000"]] / table4b[["2000"]] * 10000
  ) 
Table4_df

##Which representation is easiest to work with? Which is hardest? Why?
## table4a and table4b sprite the cases and population  into different tables which made it easy to divide cases by population

##Recreate the plot showing change in cases over time using table2 instead of table1. What do you need to do first?
table2 %>%
  filter(type == "cases") %>% ## show only the cases 
  ggplot(aes(year, count)) +
  geom_line(aes(group = country)) +
  geom_point(aes(colour = country)) +
  scale_x_continuous(breaks = unique(table2$year)) +
  ylab("cases")



#################################### Ex.12.3.3 ####################################
##Why are pivot_longer() and pivot_wider() not perfectly symmetrical? Carefully consider the following example:
stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>% 
  pivot_longer(`2015`:`2016`, names_to = "year", values_to = "return")
## because column type information is lost when a data frame is converted from wide to long

##Why does this code fail?
table4a %>% 
  pivot_longer(c(1999, 2000), names_to = "year", values_to = "cases")
#> Error: Can't subset columns that don't exist.
#> ✖ Locations 1999 and 2000 don't exist.
#> ℹ There are only 3 columns.
## The column names 1999 and 2000 are not non-syntactic variable names.

##What would happen if you widen this table? Why? How could you add a new column to uniquely identify each value?
people <- tribble(
  ~name,             ~names,  ~values,
  #-----------------|--------|------
  "Phillip Woods",   "age",       45,
  "Phillip Woods",   "height",   186,
  "Phillip Woods",   "age",       50,
  "Jessica Cordero", "age",       37,
  "Jessica Cordero", "height",   156
)
people
glimpse(people)
##pivot_wider(people, names_from = names, values_from = values)

## it will fails bc, Values are not uniquely identified. 
## there are two rows with values for the age of “Phillip Woods”.

## Tidy the simple tibble below. Do you need to make it wider or longer? What are the variables?
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
preg 
## by using pivot_longer 
preg_tidy <- preg %>%
  pivot_longer(c(male, female), names_to = "sex", values_to = "count")
## variables 
glimpse(preg) 
glimpse(preg_tidy)



#################################### Ex.12.4.3 ####################################
##What do the extra and fill arguments do in separate()? Experiment with the various options for the following two toy datasets.
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"))

tibble(x = c("a,b,c", "d,e", "f,g,i")) %>% 
  separate(x, c("one", "two", "three"))
## The extra argument tells separate() what to do if there are too many pieces
## and the fill argument tells it what to do if there aren’t enough.
## By default, separate() drops extra values with a warning.
## using extra = "drop" gives same result but without a warning msg
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>%
  separate(x, c("one", "two", "three"), extra = "drop")
## using extra = "merge" merges the g with f instead of dropping it 
tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>%
  separate(x, c("one", "two", "three"), extra = "merge")
## using fill = "right" gives same result but without a warning msg
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>%
  separate(x, c("one", "two", "three"), fill = "right")
## using fill = "left" puts the missing value NA to the lest in column one 
tibble(x = c("a,b,c", "d,e", "f,g,i")) %>%
  separate(x, c("one", "two", "three"), fill = "left")

##Both unite() and separate() have a remove argument. What does it do? Why would you set it to FALSE?
## The remove argument discards input columns in the result data frame. 
## by set it with FALSE it will create a new variable, but keep the old one.

##Compare and contrast separate() and extract(). 
##Why are there three variations of separation (by position, by separator, and with groups), but only one unite?
## separate(), splits a column into multiple columns by separator
## extract() uses a regular expression to specify groups in character vector and split that single character vector into multiple columns
## separate() and extract() convert one column to many columns, unite() converts many columns to one 



#################################### Ex.12.5.1 ####################################
##Compare and contrast the fill arguments to pivot_wider() and complete()
## the fill arguments in pivot_wider() and complete() set vales to replace NA.
## pivot_wider() fill argument accepts a single value
## complete() fill argument is named list, allowing for different values for different variables
##What does the direction argument to fill() do?
## direction aegument determines whether NA values should be replaced by the previous non-missing value ("down") or the next non-missing value ("up").



#################################### Ex.12.6.1 ####################################
who1 <- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  )
##In this case study I set values_drop_na = TRUE just to make it easier to check that we had the correct values. 
##Is this reasonable?  depends on how missing values are represented 
##Think about how missing values are represented in this dataset. Are there implicit missing values? 
nrow(who) ## 7240
who %>% 
  complete(country, year) %>%
  nrow() ## 7446
## Since the nrow() in complete(country, year) is greater than nrow(who), there are some implicit values.
##What’s the difference between an NA and zero?
## 0, which mean they are explicitly stated as no-case
## NAs in each column are different, which means that in a given year for a country, there are both missing and non-missing cases.
  
##What happens if you neglect the mutate() step? (mutate(names_from = stringr::str_replace(key, "newrel", "new_rel")))

##I claimed that iso2 and iso3 were redundant with country. Confirm this claim.

##For each country, year, and sex compute the total number of cases of TB. Make an informative visualisation of the data.




#################################################################### 13 ####################################################################
#################################### Ex.13.2.1 ####################################
##Imagine you wanted to draw (approximately) the route each plane flies from its origin to its destination. 
##What variables would you need?
## from flight table (origin) and destination (dest) airport of each flight. 
## from airports table longitude (lon) and latitude (lat) of each airport.
##What tables would you need to combine? Two joins for flights to airports, one for log and lat of origin airport, another for long and lat of destination airport

##I forgot to draw the relationship between weather and airports. What is the relationship and how should it appear in the diagram?
##weather only contains information for the origin (NYC) airports. 
##If it contained weather records for all airports in the USA, what additional relation would it define with flights?
  
##We know that some days of the year are “special”, and fewer people than usual fly on them. 
##How might you represent that data as a data frame? What would be the primary keys of that table? How would it connect to the existing tables?







