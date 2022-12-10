require('@nomicfoundation/hardhat-toolbox')
require('@nomiclabs/hardhat-ethers')
require('@nomiclabs/hardhat-solhint')
require('hardhat-gas-reporter')
require('solidity-coverage')
require('dotenv').config()
require('@nomiclabs/hardhat-etherscan')

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: '0.8.17',
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
  networks: {
    hardhat: {},
    goerli: {
      url: 'https://eth-goerli.g.alchemy.com/v2/pIoZiBiDw97rP6btS4pCf7-T8-zXY1DY',
      accounts: [process.env.PRIVATE_KEY],
    },
    mumbai: {
      url: 'https://polygon-mumbai.g.alchemy.com/v2/qqwrXnCbRHpRyGhQX4Ya8bxXLIIdX0HF',
      accounts: [process.env.PRIVATE_KEY],
    },
  },
}
