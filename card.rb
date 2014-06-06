# A card has suit and rank.
class Card
  
  # Rank is 2-10, :J, :Q, :K, :A
  # Suit is :clubs, :diamonds, :hearts, :spades
  # rank, suit -> Card
  def initialize(rank, suit)
    @rank = rank
    @suit = rank
  end
  
  def suit
    @suit
  end
  
  def rank
    @rank
  end
  
  def higher_than?(other_card)
    self.value > other_card.value
  end
  
  def value
    case rank
    when :A then 1    ## pro tem
    when :K then 13
    when :Q then 12
    when :J then 11
    else @rank
    end
  end
  
  ## I have questions about encapsulation.
  
end