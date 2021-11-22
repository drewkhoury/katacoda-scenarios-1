
---
## Time to refactor

Welcome to the last stage of the TDD cycle, <span style="color:blue">refactoring</span>. During this stage, we revisit the unit test and code we have previously written to refactor:
- Update our unit tests to adhear to the [arrange-act-assert](https://automationpanda.com/2020/07/07/arrange-act-assert-a-pattern-for-writing-good-tests/) pattern
- Remove any hard-coded values
- Update our `Student` class and `displayStudentFullName` method

### StudentTest.java
Open the `src/test/java/StudentTest.java`{{open}} file.

We can begin by following the arrange-act-assert pattern to ensure we are writing good tests. We do this by adding the following comment lines to our unit test:
```java
// arrange
// act
// assert
``` 

To adhere to this pattern, we must seperate out our `new Student()` object instantiation and put it on its own line. 

Copy the updated test method with comments to the `StudentTest.java` file:
<pre class="file" data-filename="src/test/java/StudentTest.java" data-target="replace">
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class StudentTest {

  @Test
  public void givenStudentFirstLasName_ThenReturnFullName() {
    // arrange
    Student student = new Student();

    // act
    String studentName = student.displayStudentFullName("John", "Smith");

    // assert
    assertEquals("JohnSmith", studentName);
  }
}
</pre>

Our unit test looks much better now and it is more clear to other developers what we are trying to accomplish. The arrange-act-assert pattern forces us to write tests that focus on independent, individual behaviors by separating setup actions from the main actions.

### Rerun our unit test
We will rerun our unit test from Step 1 to ensure we did not break our code during our unit test refactoring.

`bash ./gradlew test`{{execute}}

```gradle
BUILD SUCCESSFUL in 2s
3 actionable tasks: 2 executed, 1 up-to-date
```

As expected, our unit test is still working and our code passes. Now to move onto the actual `Student` class and begin refactoring it.