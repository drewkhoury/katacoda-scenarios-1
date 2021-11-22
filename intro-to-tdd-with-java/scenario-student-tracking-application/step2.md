
---
Congratulations! We've written our first test.

Let's complete the first stage of TDD by running our test. We are expecting this test to fail, or be <span style="color:red">red</span>.

### Running our first test <span style="color:red">(RED STAGE)</span>

Type the following command into the consule to run our first test:

`bash ./gradlew test`{{execute}}

### Failure is an option
```gradle
BUILD FAILED in 12s
2 actionable tasks: 2 executed
```

*This is an example error message. Do not worry if your error message looks a little different.*

In fact, failure is our only option as this is exactly what we are expecting. The `student.displayStudentFullName` method does not exist yet which means this test should and will fail.

Now we're ready for the next stage of TDD. We need to write just enough code in the `Student` class to make the test pass, or go <span style="color:green">green</span>.