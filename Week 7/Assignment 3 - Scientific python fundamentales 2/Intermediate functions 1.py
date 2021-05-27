#!/usr/bin/env python
# coding: utf-8

# In[38]:


# Intermediate functions 1


# In[115]:


# write a single function we are going to name randInt() that takes up to 2 arguments.
# If no arguments are provided, the function should return a random integer between 0 and 100.
# If only a max number is provided, the function should return a random integer between 0 and the max number.
# If only a min number is provided, the function should return a random integer between the min number and 100
# If both a min and max number are provided, the function should return a random integer between those 2 values.
import random
def randInt(min = 0, max = 100):
    if (max > min):
        num = 0
        if min == 0 and max < 100:
            num = random.random() * max
            return num
        elif min > 0 and max == 100:
            num = random.randint(min,100)
            return num
        else: 
            num = random.randint(min,max)
            return num
        num = random.random() * 100
        return num
    else:
        return f'The min {min} is greater than the max {max}'
        
        
    
print(randInt())
print(randInt(max=50))
print(randInt(min=50))
print(randInt(min=50, max=500))
print(randInt(min=500, max=50))

    

