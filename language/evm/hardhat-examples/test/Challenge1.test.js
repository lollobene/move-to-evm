const { BN, constants, expectRevert } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');
const { ethers } = require('ethers');
const { ZERO_ADDRESS } = constants;

const BasicCoin = artifacts.require('BasicCoinOriginal');
const Challenge1 = artifacts.require('Challenge1');

contract('Challenge 1', function (accounts) {
    const [deployer, user1, user2] = accounts;

    beforeEach(async function () {
        this.basicCoin = await BasicCoin.new({ from: deployer });
        this.challenge1 = await Challenge1.new(this.basicCoin.address, {
            from: deployer,
        });

        await this.challenge1.register();

        await this.basicCoin.mintTo('10000', this.challenge1.address, {
            from: deployer,
        });
    });

    describe('when everything is set up', function () {
        it('should revert on dropping resource', async function () {
            await expect(this.challenge1.dropResource()).to.be.revertedWith(
                '0x0000000000000006'
            );
        });
    });
});
