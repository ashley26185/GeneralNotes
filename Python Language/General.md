#  Returns list of all functions in the moduleName
import moduleName
print(dir(moduleName))

# Logging
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Standards
## Use of main function
```Python
def main() -> None:
    helloworld()

if __name__ == '__main__
    main()
```

## Type annotations
```python
age: int = 10
name: str = ""
```

## Inheritance
```python
class ParentClass:
    def __init__(self, name):
        self.name = name

    def greet(self):
        print(f"Hello from {self.name} (Parent)")

class ChildClass(ParentClass):  # ChildClass inherits from ParentClass
    def __init__(self, name, age):
        super().__init__(name)  # Call the parent class's constructor
        self.age = age

    def introduce(self):
        print(f"My name is {self.name} and I am {self.age} years old.")
```
## Decorators - Enhance functionality of a function
```py
def decorator(func):
    def wrapper():
        print("Before calling the function.")
        func()
        print("After calling the function.")
    return wrapper

@decorator # Applying the decorator to a function
def greet():
    print("Hello, World!")
greet()
```

## Methhod annotations
```py
@dataclass
@staticmethod
@validator (from pydantic)

```

## Indicate where code will go
```py
class Dog:
    pass
```

# Class Names
Python class names are written in CapitalizedWords notation by convention
```py
class Dog:
    def __init__(self, name, age):
        self.name = name
        self.age = age
```
# 

