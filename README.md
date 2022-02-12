# go-repository-template

[![Test Status](https://github.com/atreya2011/go-repository-template/workflows/test-build/badge.svg?branch=master)][actions]

[actions]: https://github.com/atreya2011/go-repository-template/actions?workflow=test

## How to use

1. When creating a new repository choose `atreya2011/go-repository-template` to create a new repository based on the template
2. Clone the repository locally
3. Run `./cleanup.sh` which will find `go-repository-template` and replace it with the repository name in all the appropriate files and delete itself after completion
4. Delete this `How to use` section from the README and make other changes if necessary
5. Follow the necessary steps mentioned in the `Development` section below
6. Push changes to GitHub

## Development

- Install the necessary tools by executing `make install-tools`
- Install pre-commit by either using homebrew or `make pre-commit-install`
- If you install pre-commit using homebrew run the following after install

```bash
rm -rf .git/hooks && pre-commit install && pre-commit install --hook-type commit-msg
```

## Build

```bash
make build
```

## Test

```bash
make test
```
