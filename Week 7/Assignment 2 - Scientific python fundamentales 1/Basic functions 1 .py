#!/usr/bin/env python
# coding: utf-8

# In[38]:


# Basic functions 1 


# In[39]:


#1 output: 5
def a():
    return 5
print(a())


# In[40]:


#2 output: 10
def a():
    return 5
print(a()+a())


# In[41]:


#3 output: 5
def a():
    return 5
    return 10
print(a())


# In[42]:


#4 output: 5 
def a():
    return 5
    print(10)
print(a())


# In[43]:


#5 there will be 2 outputs 1st: 5 2nd: None << bc x has no value bc a doesn't return anything
def a():
    print(5)
x = a()
print(x)


# In[46]:


#6 output: it will print 3 and 5 then error message bc a doesnt return anything 
def a(b,c):
    print(b+c)
print(a(1,2) + a(2,3))


# In[48]:


#7 output: 25 # bc a return string
def a(b,c):
    return str(b)+str(c)
print(a(2,5))


# In[51]:


#8 I don't know what copy does but it give me a syntaxError
def a():
    b = copy 100
    print(b)
    if b < 10:
        return 5
    else:
        return 10
    return 7
print(a())


# In[52]:


#9 output1: 7 output2: 14 output3: 21
def a(b,c):
    if b<c:
        return 7
    else:
        return 14
    return 3
print(a(2,3))
print(a(5,3))
print(a(2,3) + a(5,3))


# In[53]:


#10 output: 8
def a(b,c):
    return b+c
    return 10
print(a(3,5))


# In[54]:


#11 output1: 500 output2: 500 output3: 300 ## I forget to predict the last line output4: 500
b = 500
print(b)
def a():
    b = 300
    print(b)
print(b)
a()
print(b)


# In[55]:


#12 output1: 500 output2: 500 output3: 300 output4: 300 ## output4: 500 bc when we call a we didnt assigned it to b
b = 500
print(b)
def a():
    b = 300
    print(b)
    return b
print(b)
a()
print(b)


# In[56]:


#13 output1: 500 output2: 500 output3: 300 output4: 300
b = 500
print(b)
def a():
    b = 300
    print(b)
    return b
print(b)
b=a()
print(b)


# In[57]:


#14 output1: 1 output2: 3 output3: 2 
def a():
    print(1)
    b()
    print(2)
def b():
    print(3)
a()


# In[58]:


#15 output1: 1 output2: 3 output3: 5 output4: 10
def a():
    print(1)
    x = b()
    print(x)
    return 10
def b():
    print(3)
    return 5
y = a()
print(y)

