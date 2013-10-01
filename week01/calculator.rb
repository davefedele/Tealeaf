def message(msg)
  puts "=> #{msg}"
end

message 'Welcome to the calculator app'
message ''

message 'Please enter the first number: '
num1 = gets.chomp

message 'Please enter the second number: '
num2 = gets.chomp

while true
  message 'Choose the arithmetic operator:'
  message '1 - Addition'
  message '2 - Subtraction'
  message '3 - Multiplication'
  message '4 - Division'

  operator = gets.chomp

  if operator == '1'
    result = num1.to_i + num2.to_i
    break
  elsif operator == '2'
    result = num1.to_i - num2.to_i
    break
  elsif operator == '3'
    result = num1.to_i * num2.to_i
    break
  elsif operator == '4'
    result = num1.to_f / num2.to_f
    break
  else
    message ''
    message 'Please choose 1-4 only!'
  end
end

message "The result is: #{result}"