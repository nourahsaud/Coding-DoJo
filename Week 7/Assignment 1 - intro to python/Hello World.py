#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# 1. TASK: print "Hello World"
print('Hello World')


# In[ ]:


# 2. print "Hello Noelle!" with the name in a variable
name = "Noelle"
print('Hello', name, '!')	# with a comma
print('Hello ', name, '!')	# with a +


# In[ ]:


# 3. print "Hello 42!" with the number in a variable
name = 42
print('Hello', name, '!')	# with a comma


# In[ ]:


print('Hello '+ name)	# with a +	-- this one should give us an error!


# In[ ]:


# 4. print "I love to eat sushi and pizza." with the foods in variables copy
fave_food1 = "sushi"
fave_food2 = "pizza"
print('I love to eat {} and {}'.format(fave_food1,fav_food2)) # with .format()
print(f'I love to eat {fave_food1} and {fave_food2}') # with an f string

