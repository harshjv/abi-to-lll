# 💣 ABI to LLL

> Highly experimental!

## Installation

```bash
npm i -g abi-to-lll
```

## Usage

```
Usage: abi-to-lll [options] <pathToAbi>

Options:

  -V, --version         output the version number
  -o, --output-dir <o>  Output dir. Defaults to ./build
  -h, --help            output usage information
```

## Demo

```bash
abi-to-lll -o ./build ./abi.json
```

## Example

### Input files
* [example/Dispatcher.abi.json](./example/Dispatcher.abi.json)
* [example/Dispatcher.sol](./example/Dispatcher.sol)

### Output files

* [example/build/contract.lll](./example/build/contract.lll)
* [example/build/lib/constants.lll](./example/build/lib/constants.lll)
* [example/build/lib/utilities.lll](./example/build/lib/utilities.lll)


# License

MIT
