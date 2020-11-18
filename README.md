# Setup HHVM

`azejzz/setup-hhvm` give your a cross platform interface to set up the HHVM environment you need to test your code.

## inputs

| Name      | Description                                      |
|-----------|--------------------------------------------------|
| `version` | HHVM version ( e.g: '4.83', 'latest', 'nightly') |

## usage

```yaml
on: ["push"]

jobs:
  testing:
    runs-on: ${{ matrix.os }}

    strategy:
      matrix:
        hhvm: ["4.83", "4.84", "latest", "nightly"]
        os: ["macos-latest", "ubuntu-latest"]

    steps:
      - name: "checkout"
        uses: "actions/checkout@v2"

      - name: "setting up hhvm & composer"
        uses: "azjezz/setup-hhvm@develop"
        with:
          version: ${{ matrix.hhvm }}

      - name: "installing dependencies"
        run: "composer install"

      - name: "running hack static analyser"
        run: "hh_client"

      - name: "running unit test"
        run: "hhvm vendor/bin/hacktest tests"
```

### License

Setup-HHVM is open-sourced software licensed under the MIT-licensed.