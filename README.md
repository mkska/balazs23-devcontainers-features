# Dev Container Features: Balazs23/devcontainers-features

![Devcontainers](https://img.shields.io/static/v1?style=for-the-badge&message=Devcontainers&color=2496ED&logo=Docker&logoColor=FFFFFF&label=)

## Contents

This repository contains custom _collection_ of [Features](https://containers.dev/implementors/features/) for [VSCode dev containers](https://code.visualstudio.com/docs/devcontainers/containers) following the [dev container Feature distribution specification](https://containers.dev/implementors/features-distribution/).


### `bazel`

Running `Bazelisk` inside the built container will install `Bazel` latest version as it is recommended. Set `USE_BAZEL_VERSION` for specific version of Bazel

```jsonc
{
    "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
    "features": {
        "ghcr.io/balazs23/devcontainers-features/bazel:1": {
            "bazelisk": "v1.15.0"
        }
    },
    "containerEnv": { "USE_BAZEL_VERSION": "5.4.0" }
}
```

```bash
$ bazelisk version

...
```

#### docs
- [Bazel](https://bazel.build/start)
- [Bazelisk](https://github.com/bazelbuild/bazelisk/blob/master/README.md)

### `nx`

Next generation build system with first class monorepo support and powerful integrations. It requires `npm` so must use a container with `nodejs` installed first.

```jsonc
{
    "image": "mcr.microsoft.com/vscode/devcontainers/typescript-node:18-bullseye",
    "features": {
        "ghcr.io/balazs23/devcontainers-features/nx:1": {
            "version": "15.5.1"
        }
    }
}
```

```bash
$ nx init

...
```

#### docs
- [Nx](https://nx.dev/getting-started/intro)

