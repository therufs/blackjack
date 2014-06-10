require './deck'
require 'pry'

class Hand
  include Enumerable
  include Comparable

  attr_accessor :cards, :value

  def each
    cards.each do |card|
      yield card
    end
  end
  
  def <=>(other)
    self.value <=> other.value
  end
  
  def initialize
    @cards = []  ## array of cards
    @value = 0
  end
  
  def high_ace?
    values = []
    @cards.each do |card|  ## HERE BE THE PROBLEM.  probably. 
      values.push(card.value)  ## could prob be better (needs to be better in fact)
    end
    values.include?(11)
  end
  
  def reduce(ace) # ace is a Card  ## Could prob use some failsafes
    ace.value = 1
  end
  
  ## "why do you have a hand class?"
  
  def total
    @value = 0
    unless @cards == []
      vals = @cards.map { |c| c.value }
      @value = vals.reduce(0, :+)
    end
    @cards.each do | card | ## omg rubocop docs!  <3 <3 <3
      next unless high_ace? && @value > 21 && card.rank = :A
        reduce(card)
        total
      end
    @value ## this is calling the whole @value mess again
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
