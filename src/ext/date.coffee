Date.prototype.plus = (duration) ->
  return unless duration.constructor.name == "Duration"
  duration.after(this)

Date.prototype.minus = (duration) ->
  return unless duration.constructor.name == "Duration"
  duration.before(this)