#########---------------- 7.3.4 ----------------######### 
##Explore the distribution of each of the x, y, and z variables in diamonds. What do you learn? 
##Think about a diamond and how you might decide which dimension is the length, width, and depth.

##Explore the distribution of price. Do you discover anything unusual or surprising? 
##(Hint: Carefully think about the binwidth and make sure you try a wide range of values.)

##How many diamonds are 0.99 carat? 23 How many are 1 carat? 1558 What do you think is the cause of the difference?
diamonds %>% filter(carat == 1) %>% count()  

##Compare and contrast coord_cartesian() vs xlim() or ylim() when zooming in on a histogram. 
##What happens if you leave binwidth unset? What happens if you try and zoom so only half a bar shows?



#########---------------- 7.4.1 ----------------#########  
## What happens to missing values in a histogram? Removed
##What happens to missing values in a bar chart? Why is there a difference?

## What does na.rm = TRUE do in mean() and sum()?
## Its a boolian paraneter When na.rm is TRUE, the function skips over any NA values. and if its false it will return NA to the calc



#########---------------- 7.5.1.1 ----------------######### 
##Use what you’ve learned to improve the visualisation of the departure times of cancelled vs. non-cancelled flights.

##What variable in the diamonds dataset is most important for predicting the price of a diamond? carat
##How is that variable correlated with cut? 
##Why does the combination of those two relationships lead to lower quality diamonds being more expensive?
  
##Install the ggstance package, and create a horizontal boxplot. How does this compare to using coord_flip()?
install.packages("ggstance")
library(ggstance)
ggplot(mpg, aes(class, hwy, fill = factor(cyl))) +
  geom_boxplot() +
  coord_flip()
  
##One problem with boxplots is that they were developed in an era of much smaller datasets and tend to 
##display a prohibitively large number of “outlying values”. One approach to remedy this problem is the letter value plot. 
##Install the lvplot package, and try using geom_lv() to display the distribution of price vs cut. What do you learn? 
##How do you interpret the plots?
install.packages('lvplot')
library(lvplot)
ggplot(diamonds, aes(x = cut, y = price)) +
  geom_lv()

##Compare and contrast geom_violin() with a facetted geom_histogram(), 
##or a coloured geom_freqpoly(). What are the pros and cons of each method?
  
##If you have a small dataset, it’s sometimes useful to use geom_jitter() 
##to see the relationship between a continuous and categorical variable. 
##The ggbeeswarm package provides a number of methods similar to geom_jitter(). 
##List them and briefly describe what each one does
## geom_quasirandom() produces plots that are a mix of jitter and violin plots. 
## geom_beeswarm() produces a plot similar to a violin plot, but by offsetting the points.


 
#########---------------- 7.5.2.1 ----------------#########    
##How could you rescale the count dataset above to more clearly 
##show the distribution of cut within colour, or colour within cut? 
  
##Use geom_tile() together with dplyr to explore how average flight delays vary by destination and month of year. 
##What makes the plot difficult to read? How could you improve it?
  
##Why is it slightly better to use aes(x = color, y = cut)
##rather than aes(x = cut, y = color) in the example above? 



#########---------------- 7.5.2.1 ----------------#########    
##Instead of summarising the conditional distribution with a boxplot, 
##you could use a frequency polygon. What do you need to consider when using cut_width() vs cut_number()? 
##How does that impact a visualisation of the 2d distribution of carat and price?
#cut_width(), we need to choose the width, and the number of bins will be calculated automatically. 
#cut_number(), we need to specify the number of bins, and the widths will be calculated automatically.

##Visualize the distribution of carat, partitioned by price.

##How does the price distribution of very large diamonds compare to small diamonds? 
##Is it as you expect, or does it surprise you?
## The price of diamond depends not on the size only, the clarity, color, cut .. etc, 
  
##Combine two of the techniques you’ve learned to visualise the combined distribution of cut, carat, and price.
ggplot(diamonds, aes(x = cut_number(carat, 5), y = price, color = cut)) +
  geom_boxplot()

diamonds %>% ggplot() +
  geom_bin2d(mapping = aes(x = carat, y = price)) +
  facet_grid(cut~.)

##Two dimensional plots reveal outliers that are not visible in one dimensional plots. 
##For example, some points in the plot below have an unusual combination of x and y values, 
##which makes the points outliers even though their x and y values appear normal when examined separately. 
ggplot(data = diamonds) +
  geom_point(mapping = aes(x = x, y = y)) +
  coord_cartesian(xlim = c(4, 11), ylim = c(4, 11)) 
##Why is a scatterplot a better display than a binned plot for this case?
  
  
