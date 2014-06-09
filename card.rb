# A card has suit and rank.
class Card
  
  # Rank is 2-10, :J, :Q, :K, :A
  # Suit is :clubs, :diamonds, :hearts, :spades
  # rank, suit -> Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value =  case rank
              when :A then 11
              when :K then 10
              when :Q then 10
              when :J then 10  ## yuck
              else @rank
              end
  end
  
  attr_accessor :rank, :suit, :value
  
  def higher_than?(other_card)
    @value > other_card.value
  end
  ## I have questions about encapsulation.
  
end
