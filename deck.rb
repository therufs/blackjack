# require 'card' ## pry doesn't like this?

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
  
  def deck
    @deck
  end

  def swap!(a, b)
    @deck[a], @deck[b] = @deck[b], @deck[a]
    @deck
  end

  def make_shuffled  ## KNUTH SHUFFLE ##
    i = 0
    l = @deck.length
    @deck.each do
      j = rand(i..l - 1)
      swap!(i, j)         ## this is hells of ugly
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
    hand = []
    2.times do 
      hand.push draw 
    end
    hand
  end

end
