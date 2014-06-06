# One round of blackjack, from dealing to settling up.
require 'deck'
require 'player'
require 'dealer'

class Round 
  
  def initialize
    @deck = Deck.new.shuffle
    @pot = 0
  end
  
  attr_accessor :deck ## could i get away with _reader here?
  
  def deal ## will need to deal 2 hands
    @player.hand = Deck.new.deal
    @dealer.hand = Deck.new.deal
    ## handle bets 
  end
  
  def hit
  end
  
  def stand  ## seems dumb to stub/write a method that does nothing?
  end
  
  def who_won?
  end
  
  def payout
  end
  
end
