errors = require '../'

error = errors.BadRequest 'BadRequest message', 'resource', 'field'

console.log error
