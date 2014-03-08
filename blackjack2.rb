def calculate_total(cards)
  arr = cards.map {|e| e[0]}

  total = 0

  arr.each do |value|
    if value == 'Ace'
      total += 11
    elsif value.to_i == 0
      total += 10
    else total += value.to_i
    end
        if arr.include?("Ace") && total > 21
          total -= 10
          end
        end
  
  total

end
puts "Welcome to BlackJack!"

puts "what is your name?"

p1name = gets.chomp

cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King','Ace']

suit = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

deck = cards.product(suit) #this is the same as using a suit.each do |suit|
						   #cards.each do |cards|
						   # deck << [suit, cards]   both build a deck of cards

# next need shuffle deck

deck.shuffle!

# -- Deal cards next --

playercards = []
 					#sets an empty hand for both player and dealer
dealercards = []

playercards << deck.pop #deal 1 to player
dealercards << deck.pop #deal 1 to dealer
playercards << deck.pop #deal 1 to player
dealercards << deck.pop #deal 1 to dealer

dealertotal = calculate_total(dealercards)
p1total = calculate_total(playercards)

# Show cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]} for a total of #{dealertotal}"
puts p1name + " has: #{playercards[0]} and #{playercards[1]} for a total of #{p1total}"
puts ""

if p1total == 21
  puts "You have BlackJack!!"
elsif p1total < 21
  puts "What would you like to do? 1) Hit 2) Stay"
hs = gets.chomp
end

if hs == '1'
    playercards << deck.pop
    p1total = calculate_total(playercards)
    puts "You got delt a #{playercards[2]} You now have #{p1total}"

end

if p1total > 21
    puts "you busted!"
  puts ""
  puts "-------Dealer Wins--------"
end

if hs == '2'
  p1total = calculate_total(playercards)
  puts "You stayed with a total of #{p1total}"
end

while dealertotal <= 21
  dealercards = deck.pop
dealertotal = calculate_total(dealercards)
break
end 






