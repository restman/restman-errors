_ = require 'lodash'
RestError = require './error'

CODES =
  BadRequest: 400
  UnAuthorized: 401
  Forbidden: 403
  ResourceNotFound: 404
  Conflict: 409
  Invalid: 422
  Internal: 500

restErrors = {}

_.each CODES, (statusCode, name) ->
  restErrors[name] = (resource = '', field = '', code = '', message = '') ->
    restError = new RestError name, statusCode
    if resource
      restError.add resource, field, code, message
    restError

restErrors.parseJoi = (resource, joiError) ->
  return unless joiError
  return unless resource
  restError = new RestError 'Invalid', 422
  _.each joiError.details, (detail) ->
    restError.add resource, detail.path, 'invalid', detail.message
  restError

restErrors.RestError = RestError

module.exports = restErrors



