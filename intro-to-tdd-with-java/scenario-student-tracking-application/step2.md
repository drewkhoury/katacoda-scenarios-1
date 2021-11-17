## Let's write our first bit of code

Now that we've written our test, we know our goal. We need to write the code required to make it go green.

Start by opening the file `src/main/java/Student.java`{{open}}.

Ah our Student class doesn't have any code in it, this is why it was failing in the previous step. Never fear, we'll write just enough code to get it green.

## Let's write our first bit of code

Our goal is to write the minimum code to pass the test, that's the "green" step. We'll refactor the code in future steps so our main aim here is to get something working.

Copy the following into the editor by hitting 'copy to editor':

<pre class="file" data-filename="src/main/java/Student.java" data-target="replace">
public class Student {
  public String displayStudentName(String firstName, String lastName) {
    return firstName + lastName;
  }
}
</pre>

## Run your first test - again (Green)

Let's now run test again, but this time we're expecting that this will be "red" or "pass" as we've written the code that will meet the requirements of the test.

Click execute to run your test suite:

`bash ./gradlew test`{{execute}}

Now it's time for the advanced stuff, refactoring!