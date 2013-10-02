def message msg
	puts "#{msg}"
end

def stay_or_hit(name)
	puts ""
	puts "#{name}, what would you like to do?"
	puts "1) Hit"
	puts "2) Stay"
	puts ""
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

#create 2 decks and shuffle
deck = suit.product(card) * 2
deck.shuffle!

message 'Welcome to Blackjack!'
message ''
message 'Please practice responsible gambling...always go all in! :)'

message ''
message 'Please enter your name: '
player = gets.chomp.downcase.capitalize
message "Welcome #{player}!"

player_hand=[]
dealer_hand=[]

#deal cards
2.times do
	player_hand << deck.pop
	dealer_hand << deck.pop
end

#calculate total
dealer_total = calculate_total(dealer_hand)
player_total = calculate_total(player_hand)

#show cards
message ''
message "The dealer has: #{dealer_hand[0]} and #{dealer_hand[1]} for a total of #{dealer_total}"
message "#{player}, you have: #{player_hand[0]} and #{player_hand[1]} for a total of: #{player_total}"
message ''

if player_total == 21
	message "Blackjack!! You win #{player}!"
	exit
end

while player_total < 22
	stay_or_hit(player)
	action = gets.chomp

	if action == '2'
		#message "You have a total of: #{player_total}"
		break
	end	

	player_hand << deck.pop
	player_total = calculate_total(player_hand)
	message "#{player}, you have a total of: #{player_total}"

	if player_total == 21
		message "Blackjack!! You win #{player}!"
		exit
	elsif player_total > 22
		message "Bust! You are over 21. Better luck next time #{player}!"
		exit
	end
end

#repeat code above for dealer
if dealer_total == 21
	message "Dealer has Blackjack!! You lose! #{player} :("
	exit
end

while dealer_total < 17
	message "The Dealer hits."
	dealer_hand << deck.pop
	dealer_total = calculate_total(dealer_hand)
	message "Dealer has a total of: #{dealer_total}"

	if dealer_total == 21
		message "Dealer has Blackjack!! You lose #{player}!"
		break
	elsif dealer_total > 21
		message "Bust! Dealer is over 21. You win #{player}!"
		break
	end
end

#determine the winner
message ''
message "The Dealer has #{dealer_total}"
message "The Dealer's cards are: "
dealer_hand.each do |card|
	puts "=> #{card}"
end

message ''
message "#{player}, your total is #{player_total}"
message "#{player}, your cards are: "
player_hand.each do |card|
	puts "=> #{card}"
end

message ""

if dealer_total > player_total
	message "The Dealer won! :("
elsif dealer_total < player_total
	message "You won #{player}!! Good job!"
else
	message "It's a push!"
end