const fs = require('fs-extra')
const path = require('path')
const _ = require('lodash')

const nunjucks = require('nunjucks')
const bytes4 = require('./util/bytes4')

const toHex = (num) => `0x${Number(num).toString(16)}`

const isDynamic = type => {
  return ([ 'bytes', 'string', '[' ].indexOf(type) !== -1)
}

nunjucks.configure(path.join(__dirname, 'templates'), {
  autoescape: true
}).addFilter('hex', toHex)

module.exports = (pathToAbi, outputDir) => {
  const abi = require(pathToAbi)

  if (fs.existsSync(outputDir)) throw new Error('Output directory exists')

  const libDir = path.join(outputDir, 'lib')

  fs.ensureDirSync(libDir)

  const context = {
    _constructor: false,
    functions: {},
    events: {},
    storage: []
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

      const newInputs = inputs.forEach((i, index) => {
        context.storage.push(`s_${i.name}`)

        i.dynamic = isDynamic(i.type)

        return i
      })

      context._constructor = _.assign({}, {
        sig,
        inputs: newInputs
      }, fn)
    } else if (fn.type === 'event') {
      const sig = `${name}(${argsType.join(',')})`
      context.events[name] = _.assign({}, {
        id: bytes4(sig),
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
