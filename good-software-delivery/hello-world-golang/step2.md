Let's take a look at the `Makefile`{{open}} in more detail.

`make` acts as our repo entrypoint. It creates and references the golang application as a docker image (go-hello-world) via `Dockerfile`{{open}}. It's used for `build` and `run` actions.

Calls `docker-compose` to drive the `test` action, and `create_table` / `create_tags` which work as a very basic artifact storage demo.

Ideally, all/most/more of the actions would be driven out of the `compose` file to further simplify the Makefile.
