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
  end
        arr.select{|e| e == "Ace"}.count.times do
    total -= 10 if total > 21
  end
        
  
  total

end
puts "Welcome to BlackJack!"

puts "what is your name?"
p1name = gets.chomp

puts " ====== Dealing Cards ======"
puts ""

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
  puts "You have BlackJack... YOU WIN!"
  exit
end

  while p1total < 21 
    puts "What would you like to do? 1.) hit 2.) stay"
    hit_or_stay = gets.chomp

     if !['1', '2'].include?(hit_or_stay)
    puts "Error: Please Enter 1 or 2"
      next
    end
    
    if hit_or_stay == '2'
      puts "You chose to stay with a total of #{p1total}.. Dealer will now try to beat you"
    break
  end

new_card = deck.pop
  puts "dealing to player... You got: #{new_card}"
  playercards << new_card
  p1total = calculate_total(playercards)
  puts "Your total is now: #{p1total}"

   if p1total > 21 
      puts "Oops, sorry you busted with a total of #{p1total}"
      puts "====== Dealer Wins! ======"
      exit
    
    elsif p1total == 21
      puts "You have BlackJack You win!"   
      exit 
    end
end

if dealertotal == 21
  puts "Sorry dealer has BlackJack you lose!"
  exit
end

while dealertotal < 17
  new_dealer_card = deck.pop
  puts "Dealer recieved a #{new_dealer_card}"
  dealercards << new_dealer_card
  dealertotal = calculate_total(dealercards)
  puts "The dealer now has #{dealertotal}"

  if dealertotal == 21
    puts "Sorry, dealer has BlackJack... You lose!"
    exit
  elsif dealertotal > 21
    puts "Dealer busted... YOU WIN!"
    exit
  end
end

#compare hands between dealer & player

puts "Dealer cards are: "
dealercards.each do |card|
  puts "#{card}"
end
puts "--And a total of #{dealertotal}--"
puts ""

puts "#{p1name} cards are:"
playercards.each do |card|
  puts "#{card}"
end
 puts "--And a total of #{p1total}--"

if dealertotal > p1total
  puts "Sorry, but dealer wins!"

elsif dealertotal < p1total
  puts "Congrats!! You won!"

else 
  puts "Looks like a tie!"
end

exit









