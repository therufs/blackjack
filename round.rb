# One round of blackjack, from dealing to settling up.
require './deck'
require './player'
require './dealer'
require 'pry'

class Round 
  
  def initialize(player, dealer) ## Player and Dealer are class instances
    @deck = Deck.new
    deck.shuffle
    @player = player
    @dealer = dealer
    @bet = 10
    @stand = false
    @winner
  end
  
  attr_accessor :deck, :bet, :stand, :winner ## could i get away with _reader here?
  
  def play
    binding.pry
    deal
    players_turn
    dealers_turn
  end
  
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
    binding.pry
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
  
  def players_turn
    until @player.hand.value > 21 || stand ## busted?(player) doesn't work here
      ask(@player)
    end
  end
  
  def dealer_plays
    dealer = @dealer
    puts "The dealer shows #{dealer.hand.cards[0].to_s}."
    until dealer.hand.value > 16
      puts "The dealer hits."
      hit(dealer)
      dealer.hand.total
    end
    evaluate
  end
  
  def payout
    case @winner
    when @player then @player.bank = @player.bank + @bet ## not a good representation 
    when @dealer then @player.bank = @player.bank - @bet
    end
    puts "You now have $#{@player.bank}.\n\n" 
  end
  
  def evaluate
    dealer = @dealer
    player = @player
    if dealer.hand.value > 21
      puts "The dealer busted! You win!"
      @winner = @player
    elsif dealer.hand.value > player.hand.value
      puts "The dealer wins with #{dealer.hand.value}!"
      @winner = @dealer
    elsif dealer.hand.value == player.hand.value
      puts "You tie at #{dealer.hand.value} and get your bet back."
    else 
      puts "The dealer had #{dealer.hand.value}. You win with #{player.hand.value}!"
      @winner = @player
    end
    payout
  end
  
  def dealers_turn 
    dealer = @dealer
    player = @player

    if player.hand.value > 21
      dealer.hand.total
      puts "The dealer wins with #{dealer.hand.value}."
      @winner = @dealer
      payout
    else
      dealer.hand.total
      dealer_plays
    end
  end
  
end
