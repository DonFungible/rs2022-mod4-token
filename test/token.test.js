const { ethers } = require('hardhat')
const { expect } = require('chai')
const { BigNumber, utils } = ethers

context('Unit tests', function () {
  beforeEach(async function () {
    // Deploy contract
    const factory = await ethers.getContractFactory('Template')
    this.contract = await factory.deploy()
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
})
