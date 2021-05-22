#################################################################### 16 ####################################################################
library("tidyverse")
library("lubridate")
library("nycflights13")

make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

flights_dt <- flights %>%
  filter(!is.na(dep_time), !is.na(arr_time)) %>%
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time),
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time),
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)
  ) %>%
  select(origin, dest, ends_with("delay"), ends_with("time"))

############################## 16.2.4 ############################## 
##What happens if you parse a string that contains invalid dates?
ymd(c("2010-10-10", "bananas"))
## Warning message:1 failed to parse.

##What does the tzone argument to today() do? Why is it important?
## It determines the time-zone of the date. bc different time-zones can have different dates.

##Use the appropriate lubridate function to parse each of the following dates:
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014
mdy(d1)
ymd(d2)
dmy(d3)
mdy(d4)
mdy(d5)



############################## 16.4.5 ############################## 
##Why is there months() but no dmonths()? There is no unambiguous value of months

##Explain days(overnight * 1) to someone who has just started learning R. How does it work?
## The variable overnight is equal to TRUE or FALSE. 
##If it is an overnight flight, then overnight = 1, and if not, the overnight = 0.

##Create a vector of dates giving the first day of every month in 2015. 
ymd("2015-01-01") + months(0:11)
##Create a vector of dates giving the first day of every month in the current year.

##Write a function that given your birthday (as a date), returns how old you are in years.
age <- function(bday) {
  (bday %--% today()) %/% years(1) }
age(ymd("1995-11-17"))
##Why can’t (today() %--% (today() + years(1))) / months(1) work?
(today() %--% (today() + years(1))) / months(1) 








