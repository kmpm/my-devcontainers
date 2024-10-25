This template references an image that was [pre-built](https://containers.dev/implementors/reference/#prebuilding) to automatically include needed devcontainer.json metadata.

* **Image**: mcr.microsoft.com/devcontainers/go ([source](https://github.com/devcontainers/images/tree/main/src/go))
* **Applies devcontainer.json contents from image**: Yes ([source](https://github.com/devcontainers/images/blob/main/src/go/.devcontainer/devcontainer.json))

It also adds a nats-server service called nats with a custom config 
that can be found in `.devcontainer/services/nats/nats-server.conf`

The nats server is set up with multi tenancy and 2 accounts.

- `SYS` account is for admin tasks and it has a user `admin` with password `admin`.
- `APP` account is for other tasks and there is a `guest` user that does not require
  authentication and an `app` user with password `app`
  