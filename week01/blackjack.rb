def message msg
	puts "#{msg}"
end

def calculate_total(hand)
	arr = hand.map {|e| e[1] }
	total = 0
	arr.each do |value|
		if value == 'A'
			total += 11 
		elsif value.to_i == 0
			total += 10
		else
			total += value.to_i
	end
end

#correct for aces
arr.select {|e| e == "A"}.count.times do
	total -= 10 if total > 21
end

	total
end
 
suit = ['H', 'D' , 'S', 'C']
card = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suit.product(card)
deck.shuffle!

message 'Welcome to Blackjack!'
message ''
message 'Please practice responsible gambling...always go all in! :)'

message 'Please enter your name: '
player = gets.chomp
message "Welcome #{player.downcase.capitalize}!"

#deal cards

player_hand=[]
dealer_hand=[]

2.times do
	player_hand << deck.pop
	dealer_hand << deck.pop
end

dealer_total = calculate_total(dealer_hand)
my_total = calculate_total(player_hand)

#show cards

message "The dealer has: #{dealer_hand[0]} and #{dealer_hand[1]} for a total of #{dealer_total}"
message "You have: #{player_hand[0]} and #{player_hand[1]} for a total of: #{my_total}"

puts ""
puts "What would you like to do?"
puts "1) Hit"
puts "2) Stay"

action = gets.chomp

#if action == '1'
#	player_hand << deck.pop
#end


