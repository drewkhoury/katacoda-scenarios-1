
---
## Getting started with TDD
This scenario will guide you through the creation of a student tracking application. There is a preconfigured Java project which contains `Student` and `StudentTest` classes. We will be using JUnit5 to build out our test suite and Gradle to execute the tests.
### Prerequisites for this scenario
Basic understanding of:
- Java class design
- Java syntax
- JUnit

### What is TDD?

TDD refers to a style of programming in which three activities are tightly interwoven: coding, testing (in the form of writing unit tests) and design (in the form of refactoring).

It can be succinctly described by the following set of rules:

1. Write a “single” unit test describing an aspect of the program
2. Run the test, which should fail because the program lacks that feature
3. Write “just enough” code, the simplest possible, to make the test pass
4. “Refactor” the code until it conforms to the simplicity criteria
5. Repeat, “accumulating” unit tests over time

*https://www.agilealliance.org/glossary/tdd/*


### Red Green Refactor!
These three activities are often referred to as red, green, refactor.

- **<span style="color:red">Red:</span>** Introduce a test for desired functionality that fails (or does not compile)

- **<span style="color:green">Green:</span>** Modify code to make new and existing tests pass, committing whatever sins necessary in the process to accomplish quickly

- **<span style="color:blue">Refactor:</span>** Take time to make the code good

![Red Green Refactor](./assets/red-green-refactor.png)

### What to test?
**Trivial:** Start with the simplest functionality. What happens when you call methods with default arguments? Zero? Empty?

**Functional:** Focus on happy path next. What is the core business logic?

**Edge Cases:** Consider all possible scenarios. Are there boundary conditions?

**Errors:** What happens when things break? Are errors and invalid inputs handled?