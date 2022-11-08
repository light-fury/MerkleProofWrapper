require("@nomicfoundation/hardhat-toolbox");
const {
  GAS_PRICE
} = process.env;

const gasPrice = GAS_PRICE ? Number(GAS_PRICE) : "auto"

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
        gasPrice: gasPrice
    },
    localhost: {
      url: 'http://127.0.0.1:8545'
    },
  },
  solidity: {
    compilers: [
      {
        version: '0.8.17',
        settings: {
          optimizer: {
            enabled: true,
            runs: 2000
          }
        },
      },
    ],
  },
  mocha: {
    timeout: 200000
  }
};
