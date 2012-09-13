class Duration

  # Assume 365 days in year until we have context
  MS_IN_YEAR: 31536000000
  # Assume 30 day months until we have context (like calling ago or fromNow)
  MS_IN_MONTH: 2592000000
  MS_IN_WEEK: 604800000
  MS_IN_DAY: 86400000
  MS_IN_HOUR: 3600000
  MS_IN_MINUTE: 60000

  num: null
  unit: null

  constructor: (@num, @unit) ->

  milliseconds: ->
    @["MS_IN_#{@unit.toUpperCase()}"] * @num

  seconds: ->
    @milliseconds() / 1000.0

  minutes: ->
    return @num if @unit == "minute"
    @seconds() / 60.0

  hours: ->
    return @num if @unit == "hour"
    @minutes() / 60.0

  days: ->
    return @num if @unit == "day"
    @hours() / 24.0

  weeks: ->
    return @num if @unit == "week"
    @days() / 7.0

  # Assume 30 day months until we have context (like calling ago or fromNow)
  months: ->
    return @num if @unit == "month"
    return 12 * @num if @unit == "year"
    @days() / 30.0

  # Assume 365 days in year until we have context
  years: ->
    return @num if @unit == "year"
    @days() / 365.0

  ago: ->
    @["#{@unit}sBefore"](new Date)

  before: (date) ->
    @["#{@unit}sBefore"](date)

  # Works for simple calculations, like hour/day/week
  simpleBefore: (date) ->
    ms = date.getTime() - @milliseconds()
    date = new Date
    date.setTime(ms)
    date

  minutesBefore: (date) -> @simpleBefore(date)
  hoursBefore: (date) -> @simpleBefore(date)
  daysBefore: (date) -> @simpleBefore(date)
  weeksBefore: (date) -> @simpleBefore(date)

  monthsBefore: (date) ->
    monthNow = date.getMonth()
    dateThen = new Date
    dateThen.setMonth(monthNow - @num)
    dateThen

  yearsBefore: (date) ->
    yearNow = date.getFullYear()
    dateThen = new Date
    dateThen.setFullYear(yearNow - @num)
    dateThen

  fromNow: ->
    @["#{@unit}sAfter"](new Date)

  after: (date) ->
    @["#{@unit}sAfter"](date)

  simpleAfter: (date) ->
    ms = date.getTime() + @milliseconds()
    date = new Date
    date.setTime(ms)
    date

  minutesAfter: (date) -> @simpleAfter(date)
  hoursAfter: (date) -> @simpleAfter(date)
  daysAfter: (date) -> @simpleAfter(date)
  weeksAfter: (date) -> @simpleAfter(date)

  monthsAfter: (date) ->
    monthNow = date.getMonth()
    dateThen = new Date
    dateThen.setMonth(monthNow + @num)
    dateThen

  yearsAfter: (date) ->
    yearNow = date.getFullYear()
    dateThen = new Date
    dateThen.setFullYear(yearNow + @num)
    dateThen