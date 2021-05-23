#!/usr/bin/env python
# coding: utf-8

# In[55]:


# Biggie Size - Given a list, write a function that changes all positive numbers in the list to "big".
# Example: biggie_size([-1, 3, 5, -5]) returns that same list, but whose values are now [-1, "big", "big", -5]
list = [-1, 2, 5, 3, -10, -3, 2]
def biggie(list):
    for x in range(len(list)):
        if list[x] > 0:
            list[x] = 'big'
    return list

print (biggie(list))


# In[76]:


# Count Positives - Given a list of numbers, 
# create a function to replace the last value with the number of positive values. 
# (Note that zero is not considered to be a positive number).
# Example: count_positives([-1,1,1,1]) changes the original list to [-1,1,1,3] and returns it
# Example: count_positives([1,6,-4,-2,-7,-2]) changes the list to [1,6,-4,-2,-7,2] and returns it
list = [-2,5, 6, 4, 3, -2, 1, 1]
def count_positives(list):
    count = 0
    for x in range(len(list)):
        if list[x] > 0:
            count += 1 
    list[len(list)-1] = count
    print(list[len(list)-1])
    print(list)


count_positives(list)


# In[85]:


# Sum Total - Create a function that takes a list and returns the sum of all the values in the array.
# Example: sum_total([1,2,3,4]) should return 10
# Example: sum_total([6,3,-2]) should return 7
list = [1,2,3,4,5,-7]
def sum_total(list):
    total = 0
    for x in list:
        total += x
    return total

sum_total(list)


# In[87]:


# Create a function that takes a list and returns the average of all the values.
# Example: average([1,2,3,4]) should return 2.5 == 0:
list = [2,4,6,8]
def average(list):
    avg = 0
    for x in list:
        avg += x 
    avg /= len(list)
    return(avg)
average(list)


# In[93]:


# Length - Create a function that takes a list and returns the length of the list.
# Example: length([37,2,1,-9]) should return 4
# Example: length([]) should return 0
list = [1,2,3,4,5,6,7,8,9,10]
def length (list):
    count = 0
    for i in list:
        count += 1
    return count
length(list)


# In[111]:


# Minimum - Create a function that takes a list of numbers and returns the minimum value in the list. 
# (Optional) If the list is empty, have the function return False.
# Example: minimum([37,2,1,-9]) should return -9
# (Optional) Example: minimum([]) should return False
list = [1,2,3,4,5]
def Minimum (list):
    min = list[0]
    if (len(list) == 0):
        return bool(0)
    for x in list:
        if (x < min):
            min = x
    return min
Minimum(list)       


# In[113]:


# Maximum - Create a function that takes a list and returns the maximum value in the array. 
# (Optional) If the list is empty, have the function return False.
# Example: maximum([37,2,1,-9]) should return 37
# (Optional) Example: maximum([]) should return False
list = [1,2,3,4,5]
def maximum (list):
    max = list[0]
    if (len(list) == 0):
        return bool(0)
    for x in list:
        if (x > max):
            max = x
    return max
maximum(list) 


# In[115]:


# Ultimate Analysis (Optional) - Create a function that takes a list and returns a dictionary that has the sumTotal, 
# average, minimum, maximum and length of the list.
# Example: ultimate_analysis([37,2,1,-9]) should 
# return {'sumTotal': 31, 'average': 7.75, 'minimum': -9, 'maximum': 37, 'length': 4 }
list = [1,2,3,4]
def ultimate_analysis(list):
    count = 0
    max = list[0]
    min = list[0]
    for x in list:
        count += x 
        if (x > max):
            max = x
        elif (x < min):
            min = x 
    dict = {
        'Average' : count/len(list), 
        'Minimum' : min,
        'Maximum' : max,
        'Length' : len(list)
    }
    return dict
ultimate_analysis(list)


# In[148]:


# Reverse List (Optional) - Create a function that takes a list and return that list with values reversed. 
# Do this without creating a second list. (This challenge is known to appear during basic technical interviews.)
# Example: reverse_list([37,2,1,-9]) should return [-9,1,2,37]
# tried to but it's not working yet
rev_list = [1,2,3,4]
rev_list.reverse()
print(rev_list)


# In[ ]:




