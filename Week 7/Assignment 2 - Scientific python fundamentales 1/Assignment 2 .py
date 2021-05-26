#!/usr/bin/env python
# coding: utf-8

# In[5]:


# Python Assingnment


# In[14]:


# 1. Print the numbers between 1 and 100
numbers = list(range(1, 101))

print(numbers)


# In[15]:


# 2. Print the numbers between 1 and 100 divisible by 8
for x in range(1,101):
    if x%8 == 0:
        print(x)


# In[18]:


# 3. Use a while loop to find the first 20 numbers divisible by 5 
x = 1
count = 0
a = [0] * 20
while x < 101:
    if x%5 == 0:
        a[count] = x
        count += 1 
    x += 1
print (a)


# In[37]:


# Create a function that evaluates if a number is prime (you can not use a list of known primes). 
# Only allow values between 0 and 100. 
def prime_num(num):
    if num in range(0,101):
        prime = 0
        if num > 1:
            for x in range(2, num):
                if num%x == 0:
                    prime = 0
                    break
                else: 
                    prime = num
            if prime != 0:
                print(num, 'is a prime number')
            else:
                print(num, 'is not a prime number')
        else:
            print(num, 'is not a prime number')
    else:
        print('Invalid number: choose a number between 0 and 100')


prime_num(200)
prime_num(0)
prime_num(19)
prime_num(25)

