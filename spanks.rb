puts "What year were you born in?"
year = gets.chomp
puts "====================="
puts "what number month were you born in?"
month = gets.chomp
puts "====================="
puts "what day were you born on?"
day = gets.chomp

year_now = 2014

month_now = 3

if month_now <= month.to_i
	how_old = year_now - year.to_i - 1
end

spanks = "SPANK\n" * how_old

puts "you are #{how_old} years old!"

puts "you get #{how_old} SPANKS!"

puts "#{spanks}"