const { ethers } = require('hardhat')
const { expect } = require('chai')
const { BigNumber, utils } = ethers

context('Unit tests', function () {
  beforeEach(async function () {
    // Deploy contract
    const mintContractfactory = await ethers.getContractFactory(
      'Tokens'
    )
    this.contract = await mintContractfactory.deploy()
    await this.contract.deployed()

    // Get contract users
    const signers = await ethers.getSigners()
    this.signers = {
      admin: signers[0],
      random1: signers[1],
      random2: signers[2],
      random3: signers[3],
    }

    // Get expected test variables
    this.expected = {
      maxSupply: 1000,
      maxMints: 5,
    }
  })

  describe('Minting', function () {
    it('Should mint tokens', async function () {
      // Mint tokens
      await this.contract.mint(0)
      await this.contract.mint(1)
      await this.contract.mint(2)

      // Get token balance
      const balance = await this.contract.balanceOf(
        this.signers.admin.address
      )

      // Check balance
      expect(balance).to.equal(3)
    })
  })
})
