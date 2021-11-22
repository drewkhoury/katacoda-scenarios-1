
---
## Project File Structure

The project file structure is listed below. We will be working in `Student.java` and `StudentTest.java`. We will not need to edit any of the other files for this scenario.

```
project
+-- gradle
|
+-- src
|   +-- main
|       +-- java
|           -- Student.java
|   +-- test
|       +-- java
|           -- StudentTest.java
+-- build.gradle
+-- gradlew
+-- gradle.bat
+-- settings.gradle
```

## StudentTest.java
Let's start by opening up our `src/test/java/StudentTest.java`{{open}} file to begin writting our JUnit code.

As we can see, there's not not much here yet except for a few import statements and an empty `StudentTest` class. Before we begin, we should look at our first requirement so we know what test we need to write first.

**Requirement:**
- Create a method that will concatenate a student's first and last name and return the new string

### Writing our first test

For our first test, we're going to create a new test method called `givenStudentFirstLasName_ThenReturnFullName`. This test method will assert that `studentFullName` is equal to the concatination of the student's first and last name when we call our `student.displayStudentFullName` method 

- **NOTE** There is no code in our `Student.java` file so we expect this test will fail

Copy the test method below to the `StudentTest.java` file:

<pre class="file" data-filename="src/test/java/StudentTest.java" data-target="replace">
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class StudentTest {
  @Test
  public void givenStudentFirstLasName_ThenReturnFullName() {
    String studentFullName = new Student().displayStudentFullName("John", "Smith");
    assertEquals("JohnSmith", studentFullName);
  }
}
</pre>
