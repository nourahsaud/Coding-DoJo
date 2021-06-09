import numpy as np
import random

class MyClass:

# Initialize the class
    def __init__(self, ls = np.random.randint(low = 1, high = 20, size = 10)):
        self.ls = ls

# Return the max value
    def maximum(self):
        max_value = np.max(self.ls)
        return max_value

# Returnt the min value
    def minimum(self):
        min_value = np.min(self.ls)
        return min_value

# Return the max value squared
    def max_squared(self):
        max_value = np.max(self.ls)
        return max_value ** 2

# Return len
    def llength(self):
        return len(self.ls)

# Return sum of all positives
    def positive_sum(self):
        sum = 0
        for i in self.ls:
            if i > 0:
                sum += i
        return sum

# Return count of all negative
    def negative_count(self):
        count = 0
        for i in self.ls:
            if i < 0:
                count += 1
        return count

# Return mean
    def mean(self):
        return sum(self.ls)/len(self.ls)

# Return sorted list
    def sorted(self):
        return np.sort(self.ls)

if __name__ == "__main__":
    MyClass()