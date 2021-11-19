
---
### Student.java

We can now start refactoring the `src/main/java/Student.java`{{open}} file.

Begin refactoring by adding class attributes and updating the method to use them.

Copy the method below to the `Student.java` file:
<pre class="file" data-filename="src/main/java/Student.java" data-target="replace">
public class Student {  
  String firstName;
  String lastName;
  String displayName;  

  public String displayStudentFullName(String firstName, String lastName) {
    displayName = firstName + lastName;
    return displayName;
  }
}
</pre>

### Rerun our unit test
Let's rerun our unit test one more time to ensure we did not break our code.

`bash ./gradlew test`{{execute}}

```gradle
BUILD SUCCESSFUL in 2s
3 actionable tasks: 3 executed
```

Another successful build!

The success of this last test demonstrates just how empowering TDD is. We now have the confidence to go back and refactor our code as needed because we have unit tests written against a known working state. If during the refactor stage we run our tests again and one of them is failing, we get immediate feedback and know we broke something.

We have now completed one full cycle of TDD. At this point, we would start all over again and begin writing another unit test that fails, followed by writing just enough code to get it to go green and then refactor.