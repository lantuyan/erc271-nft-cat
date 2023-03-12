const hre = require("hardhat");

async function main() {
  
    const LanNFT = await hre.ethers.getContractFactory("LanNFT");
    const lanNFT = await LanNFT.deploy("LanNFT","LNFT");
    
    await lanNFT.deployed();
    console.log("Successfully deployed smart contract to",lanNFT.address);

    await lanNFT.mint("https://ipfs.io/ipfs/QmSWQu5XGKRXCEXwxM2xmdR3MxYFTzDpdAnL6XiSxQmLga");
    console.log("NFT successfully minted");
    await lanNFT.mint("https://ipfs.io/ipfs/QmfXv8gpchevxna4mp684461fyy6ACvDA1XJtaztctz3bC");
    console.log("NFT successfully minted");
    await lanNFT.mint("https://ipfs.io/ipfs/QmbS2eeE2WX8dXopBmKwniVeCfTfmgxgXgrXRkZJ4UeW9i");
    console.log("NFT successfully minted");
    await lanNFT.mint("https://ipfs.io/ipfs/QmX31k199hzUhppAH6F1SLY1N4ZkCd3qGtcMQxqcDhWqUe");
    console.log("NFT successfully minted");
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
