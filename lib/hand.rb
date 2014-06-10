require 'deck'

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
    @cards = []  
    @value = 0
  end
  
  def array_of_hand_values
    values = []
    @cards.each do |card|  
      values.push(card.value) 
    end
    values
  end
  
  def high_ace? 
    array_of_hand_values.include?(11)
  end
  
  def reduce(ace) # ace is a Card  ## Could prob use some failsafes
    ace.value = 1
  end
  
  ## "why do you have a hand class?"
  
  ## "update when you need it" --> avoid problem where salesman sold 23 or 25 lbs of chix

  def total
    @value = 0
    unless @cards == []
      values = array_of_hand_values  ## try .any?
      @value = values.reduce(0, :+)  ## each { |e| out << yield(e) }
    end
    if high_ace? && @value > 21
      @cards.each do | card | ## omg rubocop docs!  <3 <3 <3
        reduce(card) if card.rank = :A ## this doesn't keep non-A cards from getting reduced
        break if array_of_hand_values.reduce(0, :+) <= 21
      end
    end
    @value = array_of_hand_values.reduce(0, :+)
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
