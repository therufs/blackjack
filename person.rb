require './hand'

class Person
  
  def initialize
    @hand = Hand.new
    @bank = 100
  end
  
  attr_accessor :hand, :bank
  
  def bet(amt)
    Pot.total = Pot.total + amt
    @bank = @bank - amt
  end
  
  # def hit
  #   @hand = @hand.push(Round.deck.draw)
  # end
  
end
