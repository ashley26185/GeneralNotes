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