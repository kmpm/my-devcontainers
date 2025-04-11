
# Go & NATS.io (go-nats)

Use and develop Go + NATS.io. Includes appropriate runtime args, Go, common tools, extensions, and dependencies.

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| imageVariant | Go version: | string | 1.24-bookworm |
| natsVariant | Version of nats server | string | 2.11 |

This template references an image that was [pre-built](https://containers.dev/implementors/reference/#prebuilding) to automatically include needed devcontainer.json metadata.

* **Image**: mcr.microsoft.com/devcontainers/go ([source](https://github.com/devcontainers/images/tree/main/src/go))
* **Applies devcontainer.json contents from image**: Yes ([source](https://github.com/devcontainers/images/blob/main/src/go/.devcontainer/devcontainer.json))

It also adds a nats-server service called nats with a custom config 
that can be found in `.devcontainer/services/nats/nats-server.conf`

The nats server is set up with multi tenancy and 2 accounts.

- `SYS` account is for admin tasks and it has a user `admin` with password `admin`.
- `APP` account is for other tasks and there is a `guest` user that does not require
  authentication and an `app` user with password `app`
- MQTT is also enabled with a user in the APP account. Username `mqtt`and password `pass`

If you need docker-in-docker you could try to add that feature `ghcr.io/devcontainers/features/docker-in-docker:2`


---

_Note: This file was auto-generated from the [devcontainer-template.json](https://github.com/kmpm/my-devcontainers/blob/main/src/go-nats/devcontainer-template.json).  Add additional notes to a `NOTES.md`._
