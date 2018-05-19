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

  const context = {
    _constructor: false,
    functions: {},
    events: {}
  }

  abi.forEach(fn => {
    const { type, name, inputs } = fn
    const argsType = inputs.map(input => input.type)

    if (type === 'function') {
      const sig = `${name}(${argsType.join(',')})`

      context.functions[name] = _.assign({}, {
        id: bytes4(sig),
        sig
      }, fn)
    } else if (fn.type === 'constructor') {
      const sig = `constructor(${argsType.join(',')})`

      context._constructor = _.assign({}, {
        sig
      }, fn)
    } else if (fn.type === 'event') {
      const sig = `${name}(${argsType.join(',')})`
      context.events[name] = _.assign({}, {
        sig
      }, fn)
    }
  })

  const contract = nunjucks.render('contract.lsp', { context })
  const constants = nunjucks.render(path.join('lib', 'constants.lsp'), { context })
  const utilities = nunjucks.render(path.join('lib', 'utilities.lsp'), { context })

  fs.writeFileSync(path.join(outputDir, 'contract.lsp'), contract)
  fs.writeFileSync(path.join(libDir, 'constants.lsp'), constants)
  fs.writeFileSync(path.join(libDir, 'utilities.lsp'), utilities)
}
