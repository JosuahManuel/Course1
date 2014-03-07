def say(msg)
	puts "=> #{msg}"
end

say "what is your first number?"
num1 = gets.chomp

say "what is your second number?"
num2 = gets.chomp

say "1.) add 2.) subtract 3.) multiply 4.) divide"

operator = gets.chomp

  if operator == '1'
    result = num1.to_i + num2.to_i

  elsif operator == '2'
    result = num1.to_i - num2.to.i

  elsif operator == '3'
    result = num1.to_i * num2.to_i

  else operator == '4'
    result = num1.to_f / num2.to_f
  end

say "your results are #{result}"
    
    