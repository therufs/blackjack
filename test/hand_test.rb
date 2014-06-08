require "minitest/autorun"
require "./hand"

class CardTest < MiniTest::Unit::TestCase

  def test_that_total_does_good_math
    hand = Hand.new
    ace = Card.new(:A, :clubs) ## what do if aces mutable?
    ten = Card.new(10, :spades)
    six = Card.new(6, :hearts)
    hand.cards.push(ace)
    hand.cards.push(ten)
    hand.cards.push(six)
    hand.total
    
    assert_equal 17, hand.value
  end 
  
  def test_that_an_empty_hand_has_no_value
    hand = Hand.new
    assert_equal hand.value, 0
  end

end
