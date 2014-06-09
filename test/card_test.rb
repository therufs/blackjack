require "minitest/autorun"
require "./card"

class CardTest < MiniTest::Unit::TestCase
  def test_that_card_has_a_suit
    card = Card.new(:A, :spades)
    assert_equal card.suit, :spades
  end

  def test_that_card_has_the_right_suit
    spade = Card.new(:A, :spades)
    diamond = Card.new(:A, :diamonds)
    assert_equal spade.suit, :spades
    assert_equal diamond.suit, :diamonds
  end

  def test_that_card_has_a_rank
    card = Card.new(:A, :spades)
    assert_equal card.rank, :A
  end
  
  def test_that_card_has_the_right_value
    king = Card.new(:K, :spades)
    ace = Card.new(:A, :spades)
    ten = Card.new(10, :spades)
    
    assert_equal king.value, 10
    assert_equal ace.value, 11
    assert_equal ten.value, 10
  end
end
