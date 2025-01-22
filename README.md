# Let's Move to EVM: Secure Compilation with IRM

This repository is a fork of the [original Move language repository](https://github.com/move-language/move).
It contains our work on the MoveToEVM compiler for CCS submission #573, enhanced with an Inlined Reference Monitor (IRM) to ensure Move’s safety guarantees are preserved in the Ethereum Virtual Machine (EVM) environment.

## Installation

If you haven't already, open your terminal and clone [the Move repository](https://github.com/move-language/move):

```bash
git clone https://github.com/move-language/move.git
```

Go to the `move` directory and run the `dev_setup.sh` script:

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

To build the Move CLI and enable the Move on EVM compiler, use the following command with Cargo:

```
cargo install --path language/tools/move-cli --locked --features evm-backend
```

This will build the Move CLI with the EVM backend enabled.

You can check that it is working by running the following command:

```bash
move --help
```

You should see something like this along with a list and description of a
number of commands:

```
move-cli 0.1.0
Diem Association <opensource@diem.com>
MoveCLI is the CLI that will be executed by the `move-cli` command The `cmd` argument is added here
rather than in `Move` to make it easier for other crates to extend `move-cli`

USAGE:
    move [OPTIONS] <SUBCOMMAND>

OPTIONS:
        --abi                          Generate ABIs for packages
...
```

## Compiling a Move Module

After building the compiler, you can compile a Move module for the EVM architecture with the following command:

```
move build --arch ethereum [--force]
```

The --force option can be used to overwrite existing build outputs.

Be careful to run the command from inside a Move module project folder. Some examples can be found at path `language/evm/hardhat-examples/contracts`.

## Tests

### Requirements

To run the tests, ensure that both Node.js and npm are installed on your system.

### Installing npm dependencies

Before running the tests, navigate to the hardhat-examples folder and install the required dependencies by running: `npm install`

### Running tests

You can execute the tests using Hardhat by running the following command: `npx harhdat test [path/to/test]`

Replace [path/to/test] with the specific test file you want to run, or omit it to execute all tests.
