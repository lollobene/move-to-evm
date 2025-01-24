const { BN, constants, expectRevert } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');
const { ethers } = require('ethers');
const { ZERO_ADDRESS } = constants;

const BasicCoin = artifacts.require('BasicCoinOriginal');
const Challenge2 = artifacts.require('Challenge2');

contract('Challenge 2', function (accounts) {
    const [deployer, user1, user2] = accounts;

    let mintAmount = '100';

    beforeEach(async function () {
        this.basicCoin = await BasicCoin.new({ from: deployer });
        this.challenge2 = await Challenge2.new(this.basicCoin.address, {
            from: deployer,
        });

        await this.challenge2.register();

        await this.basicCoin.mintTo(mintAmount, this.challenge2.address, {
            from: deployer,
        });
    });

    describe('when everything is set up', function () {
        let initialAmount = '10';
        let finalAmount = '100';
        it('should revert when manipulating a resource', async function () {
            await expect(
                this.challenge2.manipulateResource(initialAmount, finalAmount)
            ).to.be.revertedWith('0x0000000000000006');
        });
    });
});
