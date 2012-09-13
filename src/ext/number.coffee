Number.prototype.minute = Number.prototype.minutes = ->
  new Duration(@valueOf(), "minute")

Number.prototype.hour = Number.prototype.hours = ->
  new Duration(@valueOf(), "hour")

Number.prototype.day = Number.prototype.days = ->
  new Duration(@valueOf(), "day")

Number.prototype.week = Number.prototype.weeks = ->
  new Duration(@valueOf(), "week")

Number.prototype.month = Number.prototype.months = ->
  new Duration(@valueOf(), "month")

Number.prototype.year = Number.prototype.years = ->
  new Duration(@valueOf(), "year")