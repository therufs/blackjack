require 'card' ## pry doesn't like this?
require 'hand'

class Deck
#  include Enumerable
  
  attr_accessor :cards

  def initialize 
    cards = []  ## this name makes me uncomfortable
    suits = [:clubs, :diamonds, :hearts, :spades]
    ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]
    suits.each do |s|
      ranks.each do |r|
        card = Card.new(r, s)  
        cards.push card
      end
    end
    @cards = cards
  end
  
  # def each
  #   cards.each do |card|  ## now to use it! 
  #     yield card
  #   end
  # end

  def swap!(a, b)
    @cards[a], @cards[b] = @cards[b], @cards[a]
    @cards
  end

  def shuffle  ## KNUTH SHUFFLE ##
    i = 0
    l = @cards.length
    @cards.each do
      j = rand(i..l - 1)
      swap!(i, j)  ## there has got to be a better way to do this
      i += 1
    end
    @cards
  end

  def draw      ## deals off top now!  How respectable.
    @cards.shift
  end

  def deal(player)
    player.hand = Hand.new
    2.times { player.hand.cards.push(draw) }  ## draw is now a deck of cards 
  end
  
  def hit(player)
    player.hand.cards.push(draw)
  end
    

end
