#!/usr/bin/env python
# coding: utf-8

# In[5]:


# Linear Algebra


# In[10]:


# 1. 
# 3x + 5y = 6
# 7x - 5y = 9
import numpy as np 
a = np.array([[3,5],[7,-5]])
b = np.array([6,9])
np.linalg.solve(a,b)


# In[7]:


# 2. 
# x + y + z = 6
# y + z = -4
# 2x + 5y - z = 26
import numpy as np 
a = np.array([[1,1,1],[0,1,1],[2,5,-1]])
b = np.array([6,-4,26])
np.linalg.solve(a,b)


# In[12]:


# 3. 
# x + y = 4
# 2x + 2y = 8 
import numpy as np 
a = np.array([[1,1],[2,2]])
b = np.array([4,8])
np.linalg.inv(a).dot(b)


# In[ ]:


# What happens with the 3rd solution ? and why ?
# LinAlgError: Singular matrix
# The determinant of the given matrix is zero
# x = 4 - 7
# 8 - 2y + 2y = 8 
# 8 = 8 

