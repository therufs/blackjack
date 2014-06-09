require './deck'
require 'pry'

class Hand
  def initialize
    @cards = []  ## array of cards
    @value = 0
  end
  
  attr_accessor :cards, :value
  
  def high_ace?
    values = []
    @cards.each do |card| 
      values.push(card.value)  ## could prob be better (needs to be better in fact)
    end
    values.include?(11)
  end
  
  def reduce(ace) # ace is a Card  ## Could prob use some failsafes
    ace.value = 1
  end
  
  def total
    @value = 0
    vals = @cards.map { |c| c.value }
    vals.each do |v|
      @value += v
    end
    for card in @cards ## "Use next to skip iteration." ???
      if high_ace? && @value > 21 && card.rank = :A
        reduce(card)
        total
      end
    end
    @value
  end
  
  ## can't figure out how to test this so i think it doesn't belong here
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
