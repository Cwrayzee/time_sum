def time_sum(orig_time, min_to_add)
  hour, minutes_and_period = orig_time.split(':')
  minutes, period = minutes_and_period.split(' ')

  # what is valid?
  valid_hours = (1..12).to_a
  valid_minutes = (0..60).to_a
  valid_periods = %[AM PM]

  # normalize variables
  hour = hour.to_i
  minutes = minutes.to_i

  # valid input?
  is_valid_format = valid_hours.include?(hour)
  is_valid_format &&= valid_minutes.include?(minutes)
  is_valid_format &&= valid_periods.include?(period)
  raise 'invalid time format' unless is_valid_format

  # convert minutes in hour increments with remainder not full hour
  minutes_added = min_to_add % 60
  hours_added = min_to_add / 60

  temp_minutes = minutes + minutes_added
  hour_carry = temp_minutes / 60
  new_minutes = temp_minutes % 60

  afternoon_hour = 0
  afternoon_hour = 12 if period == 'PM'

  temp_hours  = (hour + hours_added + hour_carry + afternoon_hour)
  new_period = temp_hours % 24 >= 12 ? 'PM' : 'AM'

  new_hours = temp_hours
  new_hours = new_hours - 12 if temp_hours > 12
  new_hours = new_hours % 13

  "#{new_hours}:#{new_minutes} #{new_period}"
end