# my-devcontainers

Much of the tooling is based on https://github.com/devcontainers/template-starter/



### Testing Templates

This repo contains a GitHub Action [workflow](.github/workflows/test-pr.yaml) for testing the Templates. Similar to the [`devcontainers/templates`](https://github.com/devcontainers/templates) repo, this repository has a `test` folder.  Each Template has its own sub-folder, containing at least a `test.sh`.

For running the tests locally, you would need to execute the following commands -

```shell
./.github/actions/smoke-test/build.sh ${TEMPLATE-ID} 
./.github/actions/smoke-test/test.sh ${TEMPLATE-ID} 
```

Updating Documentation
This repo contains a GitHub Action workflow that will automatically generate documentation (ie. README.md) for each Template. This file will be auto-generated from the devcontainer-template.json and NOTES.md.