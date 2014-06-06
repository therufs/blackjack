# require 'card' ## pry doesn't like this? 

class Deck
  def initialize
    deck = []  ## this name makes me uncomfortable
    suits = [:clubs, :diamonds, :hearts, :spades]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    suits.each do |s|
      ranks.each do |r|
        card = Card.new(r, s)  ## it always uses the first arg twice!
        deck.push card
      end
    end
    @deck = deck
  end
  
  def deck
    @deck
  end
  
  def shuffle  ## KNUTH SHUFFLE
    i = 0
    l = @deck.length
    @deck.each do
      j = rand(i..l - 1)
      swap!(deck[i], deck[j])
      i += 1
    end
    @deck
  end
  
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
  
end
