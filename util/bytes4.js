const Web3 = require('web3')

const divBy = 2 ** 224

module.exports = (string) => {
  const sha3 = Web3.utils.sha3(string)
  const hash = Number(parseInt(Number(sha3) / divBy)).toString(16)
  return `0x${hash}`
}
