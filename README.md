# Let's Move to EVM: Secure Compilation with IRM

This repository is a fork of the [original Move language repository](https://github.com/move-language/move).
It contains our work on the MoveToEVM compiler for CCS submission #573, enhanced with an Inlined Reference Monitor (IRM) to ensure Move’s safety guarantees are preserved in the Ethereum Virtual Machine (EVM) environment.

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
