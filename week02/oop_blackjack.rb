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
  @@BLACKJACK = 21

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
      total -= 10 if total > @@BLACKJACK
    end

    total
  end

  def add_card(new_card)
    cards << new_card
  end

  def isBusted?
    total > 21
  end
end

class Player
  include Hand

  attr_accessor :name, :cards

  def initialize (n)
    @name = n
    @cards = []
  end

end

class Dealer
  include Hand

  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards =[]
  end
end


deck = Deck.new
player = Player.new("Chris")
player.add_card(deck.deal_one)
player.add_card(deck.deal_one)
player.show_hand
player.add_card(deck.deal_one)
player.show_hand
puts player.isBusted?

dealer = Dealer.new
dealer.add_card(deck.deal_one)
dealer.add_card(deck.deal_one)
dealer.show_hand