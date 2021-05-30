#!/usr/bin/env python
# coding: utf-8

# In[27]:


# An instructor offers a prize of $20.00 to anyone who thinks that two people in the room have the same birthday. 
# Your assignment is to build a Monte Carlo simulation to tell the instructor how many people need to be in the room 
# to give him/her a better than 50% chance of winning the $20. That is to say, how many people need to be in a room 
# in order for the probability of two of them having the same birthday is greater than 50%. 
# Do the same for 95% and 99%.


# In[37]:


# bd_probability(n) function returns the probability of not having same birthday
def bd_probability(n):
    p = 1 
    for i in range(n):
        p *= (365-i)/(365)
    p = round(100*p,2)
    return p


# In[41]:


for i in range(365):
    p = bd_probability(i)
    if(p < 50): # better than 50% chance
        print('U need ', i, ' number of people for probability greater than ', 100-p)
        break


# In[42]:


for i in range(365):
    p = bd_probability(i)
    if(p < 5): # better than 95% chance
        print('U need ', i, ' number of people for probability greater than ', 100-p)
        break


# In[43]:


for i in range(365):
    p = bd_probability(i)
    if(p < 1): # better than 99% chance
        print('U need ', i, ' number of people for probability greater than ', 100-p)
        break

