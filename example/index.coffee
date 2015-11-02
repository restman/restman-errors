errors = require '../'

error = errors.BadRequest 'resource', 'field', 'code', 'message'

console.log error
