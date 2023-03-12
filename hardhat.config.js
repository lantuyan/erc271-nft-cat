
// /** @type import('hardhat/config').HardhatUserConfig */
// module.exports = {
//   solidity: "0.8.18",
//   networks:{
//     mumbai:{
//       url: process.env.MUMBAI_URL,
//       accounts: [process.env.MUMBAI_PRIVATE_KEY]
//     }
//   }
// };

// require('dotenv').config();
// require("@nomiclabs/hardhat-ethers");
// require("@nomiclabs/hardhat-etherscan");
// module.exports = {
//   solidity: {
//     version: "0.8.18",
//     settings: {
//       optimizer: {
//         enabled: true,
//         runs: 200
//       }
//     }
//   },
//   defaultNetwork: "matic",
//   networks: {
//     hardhat: {
//     },
//     matic: {
//       url: "https://rpc-mumbai.maticvigil.com",
//       accounts: [process.env.MUMBAI_PRIVATE_KEY]
//     }
//   },
//   etherscan: {
//     apiKey: process.env.POLYGONSCAN_API_KEY
//   }

// }
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-ethers");
// const privateKey = "0xb4c0042371f3a9e76fba83c92069f25b512dc9ea6e008a4ec734da29d4c33722";
const url_networks = "https://polygon-rpc.com";
// "https://rpc-mumbai.maticvigil.com"
module.exports = {
  defaultNetwork: "matic",
  networks: {
    hardhat: {
    },
    matic: {
      url: url_networks ,
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: process.env.API_KEY,
 },
  solidity: {
    version: "0.8.18",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
}