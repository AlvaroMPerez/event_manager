require 'csv'

puts "Event manager initialized!"

file_path = "event_attendees.csv"

correct_numbers = []

CSV.foreach(file_path, headers: true, header_converters: :symbol) do |row|
  phone_number = row[:homephone]
  cleaned_number = phone_number.gsub(/\D/, '')

  # Less than 10 numbers

  if cleaned_number.length == 10
    correct_numbers << cleaned_number
  end

  # Eliminamos el primer número sí es 1
  if cleaned_number.length == 11 && cleaned_number.start_with?('1')
    rest_of_number = cleaned_number.slice(1..-1)
    correct_numbers << rest_of_number
  end
end

puts correct_numbers
