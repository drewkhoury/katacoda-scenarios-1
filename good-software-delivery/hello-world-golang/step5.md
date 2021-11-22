Let's have a look at the application itself. The application in this demo is very basic for now, with just enough code to spin up a web server and show basic unit testing.

Open the main file:
`src/main.go`{{open}}

Open the test file:
`src/main_test.go`{{open}}

![Golang](./assets/footer-gopher.jpg)

More info:

The application is self-contained in the `src/` directory to make it as clear as possible where all the application source files live and to avoid confusion with any of the pipeline related files.

The application is the smallest and simplist demo we could build, consisting of `main.go` and `main_test.go` which show a "hello world" message in your browser along with a simple demo of code coverage testing.

This particular demo is not intented to mimic a real world application, which would be far more complex, but rather "just enough application logic" to show how it fits together with the pipeline and other practices.

We may produce other appliations in the future that demo other practices (such as BDD, multiple applications, backend and frontend).

# Make your own changes

You can make changes to the application, and build, test or deploy it again.

`make build`{{execute}}

`make test`{{execute}}

`make run`{{execute}}

Once the app is running, you can browse it via: `curl localhost:8080`{{execute}}
