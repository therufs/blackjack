# One round of blackjack, from dealing to settling up.
require './deck'
require './player'
require './dealer'
require 'pry'

class Round 
  
  def initialize(player, dealer) ## Player and Dealer are class instances
    @deck = Deck.new
    deck.shuffle
    @pot = 0
    @player = player
    @dealer = dealer
    @bet = 10
    @stand = false
  end
  
  attr_accessor :deck, :pot, :bet, :stand ## could i get away with _reader here?
  
  def deal 
    deck.deal(@player)
    deck.deal(@dealer)  ## ruby ilu
  end
  
  def hit(player)
    deck.hit(player)
  end
  
  def busted?(player)
    player.hand.total
    player.hand.value > 21
  end
  
  def try_hit(player)
    hit(player)
    if busted?(player) 
      puts "Busted!  You got the #{player.hand.cards.pop} for a total of #{player.hand.value}."
    else ask(player) ## NO GOOD, can't handle >5 cards
    end
  end
  
  def ask(player)  
    showcards = []
    @player.hand.cards.each { |c| showcards.push c.to_s }
    puts "You have #{showcards} for a total of #{player.hand.total}."
    puts "Do you want to [h]it or [s]tand?"
    msg = gets.chomp
    case msg
    when "h" || "H" then try_hit(player)
    when "s" || "S" then @stand = true
    else puts "I didn't understand that.  Type h to hit or s to stand."
      ask(player)
    end
  end
  
end
