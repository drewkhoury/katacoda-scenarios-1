## Time to refactor

### StudentTest.java
Open the file `src/test/java/StudentTest.java`{{open}}

Begin by adding comments to identify each stage of the test.

Copy file to editor:
<pre class="file" data-filename="src/test/java/StudentTest.java" data-target="replace">
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class StudentTest {

  @Test
  public void givenStudentName_ThenReturnDisplayName() {
    // arrange
    Student student = new Student();

    // act
    String studentName = student.displayStudentName("John", "Smith");

    // assert
    assertEquals("JohnSmith", studentName);
  }
}
</pre>

### Student.java
Start by opening the file `src/main/java/Student.java`{{open}}

Begin refactoring by adding class attributes and updating method to use them.

Copy file to editor:
<pre class="file" data-filename="src/main/java/Student.java" data-target="replace">
public class Student {  
  String firstName;
  String lastName;
  String displayName;  

  public String displayStudentName(String firstName, String lastName) {
    displayName = firstName + lastName;
    return displayName;
  }
}
</pre>

### Rerun our test from Step 1
Now we will rerun our test from Step 1 to ensure we did not break our code.

`bash ./gradlew test`{{execute}}