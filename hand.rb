require 'deck'

class Hand
  def initialize
    @cards = []  ## array of cards
    @value = 0
  end
  
  attr_accessor :cards, :value
  
  def total  ## still no way to deal with aces >:/ ... 
    vals = @cards.map { |c| c.value }
    vals.each do |v|
      @value += v
    end
    @value
  end
  
  def evaluate
    if @value > 21
      puts "You bust!"
      ## ask if you want to play another round
    else 
      puts "Hit or stand?  Your total is #{@value}."
      ## hit or stand
    end
  end
  
  
  
end
