# A card has suit and rank.
class Card
  
  # Rank is 2-10, :J, :Q, :K, :A
  # Suit is :clubs, :diamonds, :hearts, :spades
  # rank, suit -> Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
  
  attr_accessor :suit, :rank

  def value
    case rank
    when :A then 1   ## pro tem
    when :K then 10
    when :Q then 10
    when :J then 10  ## yuck 
    else @rank
    end
  end

  def higher_than?(other_card)
    self.value > other_card.value
  end
  ## I have questions about encapsulation.
  
end
