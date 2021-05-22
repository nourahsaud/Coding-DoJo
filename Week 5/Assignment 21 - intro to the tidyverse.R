install.packages("tidyverse")
library(tidyverse)

##__________ Ex.324 __________ ##
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))


##Run ggplot(data = mpg). What do you see? scatter plot 
  
##How many rows are in mpg? How many columns? 234 Rows, 11 Col 

row <- nrow(mpg)
row
col <- ncol(mpg)
col

##What does the drv variable describe? Read the help for ?mpg to find out. 
## the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd
?mpg

##Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))

##What happens if you make a scatterplot of class vs drv? Why is the plot not useful? 
## The x axis and y axis both contains string values, you cant get any info from that ! 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv))





##__________ Ex.331 __________ ##

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

##What’s gone wrong with this code? Why are the points not blue? - I am not sure  

##Which variables in mpg are categorical? Which variables are continuous? 
##(Hint: type ?mpg to read the documentation for the dataset). 
##How can you see this information when you run mpg?
?mpg
# categorical vars: manufacturer, model, trans, drv, fl, class
# continuous vars: displ, year, cyl, cty, hwy, 
  
##Map a continuous variable to color, size, and shape. 
##How do these aesthetics behave differently for categorical vs. continuous variables? - not sure 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cyl, size = hwy, shape = drv))
  
##What happens if you map the same variable to multiple aesthetics? i am not sure what did happend but the size of the rectangle is smaller than before 
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = cyl, size = cyl, shape = drv))

##What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point) modify the width of object (border in the below code)
?geom_point 
ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)
##What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? 
##Note, you’ll also need to specify x and y. (spreate them into tow values (colors in the below code) one if its true displ < 5 and other if not)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = displ < 5))





##__________ Ex.351 __________ ##

##What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ cyl)
  
##What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot? no common values ! 
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))
  facet_grid(drv ~ cyl)


##What plots does the following code make? What does . do? represents the relation between displ and hwy and . 
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(drv ~ .)
  
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) +
    facet_grid(.~ cyl)

##Take the first faceted plot in this section:
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy))
  
  ggplot(data = mpg) + 
    geom_point(mapping = aes(x = displ, y = hwy)) + 
    facet_wrap(~ class, nrow = 2)

##What are the advantages to using faceting instead of the colour aesthetic? 
##What are the disadvantages? How might the balance change if you had a larger dataset?
  
##Read ?facet_wrap. What does nrow do? What does ncol do? no documentation for 'facet_wrap' -- nrow number of rows ncol number of cols
##What other options control the layout of the individual panels? Why doesn’t facet_grid() have nrow and ncol arguments?
#When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?
  ?facet_wrap.

  



##__________ Ex.361 __________ ##
##What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
    
##Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
    geom_point() + 
    geom_smooth(se = FALSE)
  
##What does show.legend = FALSE do? What happens if you remove it?
##Why do you think I used it earlier in the chapter? 
    
##What does the se argument to geom_smooth() do?
    
##Will these two graphs look different? Why/why not? no. maybe bc in the 1st ggplot it will implement the geom's with the val in ggpot and the oppesite for the second
  ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_point() + 
    geom_smooth()
  
  ggplot() + 
    geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
    geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))
  
##Recreate the R code necessary to generate the following graphs.





##__________ Ex.371 __________ ##
##What is the default geom associated with stat_summary()? The default geom for stat_summary() is geom_pointrange() .
##How could you rewrite the previous plot to use that geom function instead of the stat function?
    
##What does geom_col() do? How is it different to geom_bar()?
  ##geom_bar() uses the stat_count() statistical transformation to draw the bar graph. 
  ##geom_col() assumes the values have already been transformed to the appropriate values.

    
##Most geoms and stats come in pairs that are almost always used in concert. Read through the documentation and make a list of all the pairs. What do they have in common?
    
##What variables does stat_smooth() compute? What parameters control its behaviour?
    
##In our proportion bar chart, we need to set group = 1. Why? In other words what is the problem with these two graphs?
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
  ggplot(data = diamonds) + 
    geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))
  

  
  
  
##__________ Ex.371 __________ ##
##What is the problem with this plot? How could you improve it? use geom_jitter() , maybe not all of the points appear 
  ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
    geom_point()

##What parameters to geom_jitter() control the amount of jittering? #width and height 
  
##Compare and contrast geom_jitter() with geom_count(). count change size of points jitter makes all the points appear 
  
##What’s the default position adjustment for geom_boxplot()? Create a visualisation of the mpg dataset that demonstrates it.position = “dodge2”
  
  
  
  
  
  
  
  
  
  
  
  
  
  
