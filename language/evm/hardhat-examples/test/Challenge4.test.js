const { BN, constants, expectRevert } = require('@openzeppelin/test-helpers');
const { expect } = require('chai');
const { ethers } = require('ethers');
const { ZERO_ADDRESS } = constants;

const BasicCoin = artifacts.require('BasicCoinOriginal');
const Challenge4 = artifacts.require('Challenge4');

contract('Challenge 4', function (accounts) {
    const [deployer, user1, user2] = accounts;

    beforeEach(async function () {
        this.basicCoin = await BasicCoin.new({ from: deployer });
        this.challenge4 = await Challenge4.new(this.basicCoin.address, {
            from: deployer,
        });

        await this.challenge4.register();
    });

    describe('when everything is set up', function () {
        let amount = '100';
        it('should revert when forging a resource', async function () {
            await expect(
                this.challenge4.forgeResource(amount)
            ).to.be.revertedWith('0x0000000000000006');
        });
    });
});
