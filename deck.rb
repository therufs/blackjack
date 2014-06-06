require 'card' ## pry doesn't like this?
require 'hand'

class Deck
  def initialize
    deck = []  ## this name makes me uncomfortable
    suits = [:clubs, :diamonds, :hearts, :spades]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    suits.each do |s|
      ranks.each do |r|
        card = Card.new(r, s)  
        deck.push card
      end
    end
    @deck = deck
  end
  
  attr_accessor :deck

  def swap!(ary, a, b)
    ary[a], ary[b] = ary[b], ary[a]
    ary
  end

  def make_shuffled  ## KNUTH SHUFFLE ##
    i = 0
    l = @deck.length
    @deck.each do
      j = rand(i..l - 1)
      swap!(@deck, i, j)  ## there has got to be a better way to do this
      i += 1
    end
  end

  def shuffle
    make_shuffled
    @deck
  end

  def draw      ## deals off bottom like a CHEATER
    @deck.pop
  end

  def deal
    hand = Hand.new
    2.times do 
      Hand.cards.push draw 
    end
    hand
  end
  
  def hit
  end
    

end
