require 'rubygems'
require 'pry'

class Card
  attr_accessor :suit, :face_value

  def initialize (s,fv)
    @suit = s
    @face_value = fv
  end

  def to_s
    "The #{face_value} of #{find_suit}"
  end

  def find_suit
    ret_val = case suit
                when 'H' then 'Hearts'
                when 'D' then 'Diamonds'
                when 'S' then 'Spades'
                when 'C' then 'Clubs'
              end
       ret_val
  end
end

class Deck
  attr_accessor :cards 
  
  def initialize
    @cards = []
    ['H', 'D', 'S', 'C'].each do |suit|
      ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'].each do |face_value|
            @cards <<  Card.new(suit,face_value)
      end
    end
    scramble!
  end

  def scramble!
    cards.shuffle!
  end

  def deal_one
    cards.pop
  end

  def size
    cards.size
  end
end

module Hand
  def show_hand
    puts "---- #{name}'s Hand---"
    cards.each do |card|
      puts "=> #{card}"
    end
    puts "=> Total: #{total}"
  end

  def total
    values = cards.map {|card| card.face_value}
    total = 0
    values.each do |val|
      if val == 'A'
        total += 11
      else
        total += val.to_i == 0 ? 10 : val.to_i
      end
    end

    values.select {|v| v == "A"}.count.times do
      total -= 10 if total >= Blackjack::BLACKJACK_AMOUNT
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def isBusted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize (n)
    @name = n
    @cards = []
  end

  def show_flop
    show_hand
  end
end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards =[]
  end

  def show_flop
  puts "---- Dealer's Hand---"
  puts "=> First card is hidden " 
  puts "=> #{cards[1]}"
  end
end

class Blackjack 
  attr_accessor :deck, :player, :dealer

  BLACKJACK_AMOUNT = 21
  DEALER_HIT_MIN = 17

  def initialize
    @deck = Deck.new 
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "What is your name?"
    player.name = gets.chomp
  end

  def deal_cards
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
  end

  def show_flop
    player.show_flop
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT 
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, the dealer has blackjack. #{player.name} loses." 
      else
        puts "You have blackjack! #{player.name} wins! "
      end 
      play_again?
    elsif player_or_dealer.isBusted?
      if player_or_dealer.is_a?(Dealer)
        puts "The dealer busted! #{player.name} wins!"
      else
        puts "Sorry, #{player.name} busted. #{player.name} loses!"
      end
      play_again?
    end    
  end

  def player_turn
    puts "---- #{player.name}'s Turn---"

    blackjack_or_bust?(player)

    while !player.isBusted?
      puts "Would you like to do? 1) hit 2) stay"
      answer = gets.chomp

      if !['1','2'].include?(answer)
        puts "Error, you must enter 1 or 2"
        next
      end
      
      if answer == '2'
        puts "#{player.name} chose to stay"
        break
      end

      if answer == '1'
        new_card = deck.deal_one
        puts "Dealing a new card: #{new_card}"
        player.add_card(new_card)
        puts "#{player.name}'s total is now: #{player.total}"
        
        blackjack_or_bust?(player)
      end
    end
    puts "#{player.name} stays at #{player.total}."
  end

  def dealer_turn
    puts "---- Dealer's turn ---"

    blackjack_or_bust?(dealer)
    while dealer.total < Blackjack::DEALER_HIT_MIN
      new_card = deck.deal_one
      puts "Dealing a new card to dealer: #{new_card}"
      dealer.add_card(new_card)
      puts "Dealer total is now #{dealer.total}"

      blackjack_or_bust?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulations, #{player.name} wins!"
    elsif player.total < dealer.total
      puts "Sorry, #{player.name} loses."
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    puts ""
    puts "Would you like to play again? 1) yes 2) no, exit"
    if gets.chomp == '1'
      puts "Starting new game..."
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye!"
      exit
    end
  end

  def start
    set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
    play_again?
  end
end

game = Blackjack.new
game.start