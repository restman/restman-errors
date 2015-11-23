class RestError extends Error

  constructor: (@name = 'Internal', @status_code = 500)->
    @errors = []
    Error.captureStackTrace @, @
    return this

  add: (resource = '', field = '', code = '', message = '') ->
    @errors.push
      resource: resource
      field: field
      code: code
      message: message
    return this

module.exports = RestError
