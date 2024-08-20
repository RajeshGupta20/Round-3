
# Python Questions:

# 1. What is a tuple in Python? What is the difference between a list and a tuple?
# A tuple is an ordered and immutable collection of items in Python. The main difference between a list and a tuple is that a list is mutable (can be modified after creation), while a tuple is immutable (cannot be modified after creation).

# 2. What are the rules for local and global variables in Python?
# Local variables: Defined inside a function and accessible only within that function.
# Global variables: Defined outside any function and accessible throughout the program. If you need to modify a global variable inside a function, you must declare it as global.

# 3. What is Python's parameter passing mechanism?
# Python uses a mechanism called "Call by Object Reference" or "Call by Sharing." It means that functions receive references to the objects, and if the object is mutable, changes to it will affect the original object. However, if you reassign a variable inside a function, it will not affect the original variable.

# 4. Write a method to open a text file and display its content:

def display_file_content(filename):
    with open(filename, 'r') as file:
        content = file.read()
        print(content)

# 5. Syntax to get the desired results:

# 1) {'key2': ['Vishesh', 'For', 'Python'], 'key1': [1, 2]}
result_1 = {'key1': [1, 2], 'key2': ["Vishesh", "For", "Python"]}

# 2) {'key1': [1, 2, ['Vishesh', 'For', 'Python']]}
result_2 = {'key1': [1, 2, ["Vishesh", "For", "Python"]]}

# 3) {'1': [1, 2], '3': [3, 4], '2': [2, 3]}
valList = [1, 2, 3]
result_3 = {str(i): [i, i+1] for i in valList}
