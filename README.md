# Let's Move to EVM: Secure Compilation with IRM

This repository contains the implementation of the IRM-based Move to EVM compiler.
It is a fork of the [original Move language repository](https://github.com/move-language/move).

## Installation

If you haven't already, open your terminal and clone [this repository](https://github.com/lets-move-to-evm/lets-move-to-evm):

```bash
git clone https://github.com/lets-move-to-evm/lets-move-to-evm.git
```

Go to the `lets-move-to-evm` directory and run the `dev_setup.sh` script:

```bash
cd move
./scripts/dev_setup.sh -yptd
```

Follow the script's prompts in order to install all of Move's dependencies.

The script adds environment variable definitions to your `~/.profile` file.
Include them by running this command:

```bash
source ~/.profile
```

## Building the compiler

To build the compiler, use the following command with Cargo:

```
cargo install --path language/tools/move-cli --locked --features evm-backend
```

This will build the Move CLI with the EVM backend enabled.

## Compiling a Move Module

After building the compiler, you can compile a Move module for the EVM architecture with the following command:

```
move build --arch ethereum [--force]
```

The --force option can be used to overwrite existing build outputs.

## Why the Original Compiler Fails

The original Move-to-EVM compiler does not preserve Move’s key guarantees, such as resource safety, in adversarial or untyped environments. This can lead to significant vulnerabilities in the compiled contracts. For example, the contracts `Challenge*.sol` in `language/evm/hardhat-examples/contracts` demonstrate scenarios where the original compiler fails, showing how resource misuse and safety violations can occur.

## Tests

### Requirements

To run the tests, ensure that both Node.js and npm are installed on your system.

### Installing npm dependencies

Before running the tests, navigate to the hardhat-examples folder and install the required dependencies by running: `npm install`

### Running tests

You can execute the tests using Hardhat by running the following command: `npx harhdat test [path/to/test]`

Replace [path/to/test] with the specific test file you want to run, or omit it to execute all tests.
