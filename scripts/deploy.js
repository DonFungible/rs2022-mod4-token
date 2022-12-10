const hre = require('hardhat')

async function main() {
  //! Base Contract
  const tokenContractFactory = await hre.ethers.getContractFactory(
    'Tokens'
  )
  const baseContract = await tokenContractFactory.deploy()
  await baseContract.deployed()
  console.log(`Base token deployed to ${baseContract.address}`)

  await baseContract.mint(0)
  await baseContract.mint(1)
  await baseContract.mint(2)

  //! Forged Contract
  const forgerContractFactory = await hre.ethers.getContractFactory(
    'Forger'
  )
  const forgerContract = await forgerContractFactory.deploy(
    baseContract.address
  )
  await forgerContract.deployed()

  console.log(`Forger deployed to ${forgerContract.address}`)
}

main().catch((error) => {
  console.error(error)
  process.exitCode = 1
})
