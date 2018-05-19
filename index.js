const fs = require('fs-extra')
const path = require('path')
const _ = require('lodash')

const nunjucks = require('nunjucks')
const bytes4 = require('./util/bytes4')
nunjucks.configure(path.join(__dirname, 'templates'), {
  autoescape: true
})

module.exports = (pathToAbi, outputDir) => {
  const abi = require(pathToAbi)

  if (fs.existsSync(outputDir)) throw new Error('Output directory exists')

  const libDir = path.join(outputDir, 'lib')

  fs.ensureDirSync(libDir)

  const fnMap = {}

  abi.filter(fn => fn.name).forEach(fn => {
    const { inputs } = fn
    const argsType = inputs.map(input => input.type)
    const sig = `${fn.name}(${argsType.join(',')})`

    fnMap[fn.name] = _.assign({}, {
      id: bytes4(sig),
      sig
    }, fn)
  })

  const contract = nunjucks.render('contract.lsp', { fnMap })
  const constants = nunjucks.render(path.join('lib', 'constants.lsp'), { fnMap })
  const utilities = nunjucks.render(path.join('lib', 'utilities.lsp'), { fnMap })

  fs.writeFileSync(path.join(outputDir, 'contract.lsp'), contract)
  fs.writeFileSync(path.join(libDir, 'constants.lsp'), constants)
  fs.writeFileSync(path.join(libDir, 'utilities.lsp'), utilities)
}
