_CACHE = {}

((exports) ->
  _set = (key, value, timeout) ->
    clearTimeout(_CACHE[key].timeout) if _CACHE[key]?
    _rm = -> delete _CACHE[key]
    _CACHE[key] =
      value: value
      timeout : setTimeout _rm, timeout * 1000

  _get = (key) -> if _CACHE[key]? then _CACHE[key].value else null

  _remove = (key) ->
    if _CACHE[key]?
      clearTimeout(_CACHE[key].timeout)
      delete _CACHE[key]
      true
    else
      false

  Cache =
    set: _set
    get: _get
    remove: _remove

  if typeof define is "function" and define.amd
    define -> Cache
  else
    exports.Cache = Cache

  module.exports = Cache if module? and module.exports?

) this