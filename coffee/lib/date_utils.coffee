exports.formatMMDDYYYY = (date) ->
  if !exports.validateDate(date)
    return null
  dayOfMonth = date.getDate()
  month = date.getMonth() + 1
  year = date.getFullYear()
  "#{month}/#{dayOfMonth}/#{year}"

# preprocess a date and return null in case it's not valid
exports.validateDate = (date) ->
  if !date || isNaN(date.getDate())
    return null
  date

