def calculate_total(hand)
  card_values = hand.map {|e| e[0]}
  total = 0
  card_values.each do |value|
    if value == 'A' #Aces
      total += 11
    elsif value.to_i == 0 #face cards
      total += 10
    else #number cards
      total += value.to_i
    end
  end

  #if over 21, change A value to 1
  card_values.select {|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

def hit_or_stay
  puts 'What would you like to do?'
  puts '                      1 - Hit'
  puts '                      2 - Stay'
  puts ''
end

card = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
suit = ['Diamonds', 'Hearts', 'Spades', 'Clubs']

deck = card.product(suit) * 2

puts 'Welcome to Blackjack'
puts ''
puts 'Please enter your name:'
puts ''
player_name = gets.chomp.downcase.capitalize
puts ''
puts "Welcome #{player_name}! Let's play some Blackjack!"
puts ''

#Main Program
while true
  deck.shuffle!.shuffle!.shuffle!

  player_hand = []
  dealer_hand = []

  player_total = 0
  dealer_total = 0

  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end

  player_total = calculate_total(player_hand)
  dealer_total = calculate_total(dealer_hand)

  puts "The dealer has #{dealer_total}. Here are the dealer's: "
  dealer_hand.each { |card| puts '                      ' + card[0] + " of " + card[1] }
  puts ''
  puts "#{player_name}, you have #{player_total}. These are your cards:"
  player_hand.each { |card| puts '                      ' + card[0] + " of " + card[1] }
  puts ''

  if player_total == 21
    puts "Blackjack! Congratulations #{player_name}, you won!"
  end

  #player hand
  while player_total < 22
    hit_or_stay
    action = gets.chomp
    if action == '2'
      puts ''
      puts "You stay #{player_name}"
      puts ''
      break
    elsif action == '1'
      #deal new card
      player_hand << deck.pop
      player_total = calculate_total(player_hand)
      puts ''
      puts "#{player_name}, you have a total of: #{player_total}"
      player_hand.each { |card| puts '                      ' + card[0] + " of " + card[1] }
      puts ''

      if player_total == 21
        puts ''
        puts "Blackjack!! You win #{player_name}!"
        puts ''
        break
      elsif player_total > 21
        puts ''
        puts "Bust! You are over 21...You Lose #{player_name}. Better luck next time #{player_name}!"
        puts ''
        break
      end
    else
      puts "Please select '1' or '2' "
    end
  end

  #repeat code above for dealer
  if dealer_total == 21
    puts "Dealer has Blackjack!! You lose! #{player_name} :("
  end

  while dealer_total < 17 && player_total < 21
    puts "The Dealer hits."
    dealer_hand << deck.pop
    dealer_total = calculate_total(dealer_hand)
    puts "Dealer has a total of: #{dealer_total}"

    if dealer_total == 21
      puts ''
      puts "Dealer has Blackjack!! You lose #{player_name}!"
      break
    elsif dealer_total > 21
      puts ''
      puts "Bust! Dealer is over 21. You win #{player_name}!"
      break
    end
  end

  if player_total != 21 && player_total < 21 && dealer_total < 21
    #determine the winner
    puts ''
    puts "The Dealer has #{dealer_total}"
    puts "The Dealer's cards are: "
    dealer_hand.each { |card| puts '                      ' + card[0] + " of " + card[1] }

    puts ''
    puts "#{player_name}, your total is #{player_total}"
    puts "#{player_name}, your cards are: "
    player_hand.each { |card| puts '                      ' + card[0] + " of " + card[1] }

    puts ""

    if dealer_total > player_total
      puts "The Dealer won! :("
    elsif dealer_total < player_total
      puts "You won #{player_name}!! Good job!"
    else
      puts "It's a push!"
    end
  end

  puts ''
  puts "Would you like to play again? 'y' or 'n'"

  while true
    replay = gets.chomp.downcase
    if replay == 'y'
      break
    elsif replay == 'n'
      puts "Thanks for playing Blackjack #{player_name}!"
      exit
    else
      puts "Please enter 'y' or 'n' "
    end
  end
  
  puts ''
  puts ''
  puts '-----------------------------------------------------------------'
  puts 'Next Game:'
  puts ''
end