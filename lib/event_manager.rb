require 'csv'

puts "Event manager initialized!"

file_path = "event_attendees.csv"

correct_numbers = []

hour_counts = Hash.new(0)

CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
  phone_number = row[:homephone]
  cleaned_number = phone_number.gsub(/\D/, '')

  register_date = row[:regdate]

  # Less than 10 numbers
  if cleaned_number.length == 10
    correct_numbers << cleaned_number
  end

  # Eliminamos el primer número sí es 1
  if cleaned_number.length == 11 && cleaned_number.start_with?('1')
    rest_of_number = cleaned_number.slice(1..-1)
    correct_numbers << rest_of_number
  end

  # regdate for adds
  formated_register_date = DateTime.strptime(register_date, "%m/%d/%y %H:%M")
  hour = formated_register_date.hour
  hour_counts[hour] += 1

end
most_frecuent_hour = hour_counts.max_by {|hour, count| count}
puts "most frecuent hour is #{most_frecuent_hour[0]} and it repeats #{most_frecuent_hour[1]} times"
