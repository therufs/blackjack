require "minitest/autorun"
require "./hand"

class CardTest < MiniTest::Unit::TestCase

  def test_that_an_empty_hand_has_value_of_zero
    hand = Hand.new
    assert_equal hand.value, 0
  end

  def test_that_an_empty_hand_has_no_cards
    hand = Hand.new
    assert_equal hand.cards, []
  end

  def test_that_high_ace_finds_high_aces
    hand0 = Hand.new
    hand1 = Hand.new
    hand2 = Hand.new
    hand3 = Hand.new
    ace = Card.new(:A, :clubs)
    three = Card.new(3, :hearts)
    two = Card.new(2, :diamonds)
    other_ace = Card.new(:A, :diamonds)
    hand0.cards.push(ace)
    hand0.cards.push(three)
    hand0.cards.push(two)
    hand1.cards.push(two)
    hand1.cards.push(ace)
    hand1.cards.push(three)
    hand2.cards.push(two)
    hand2.cards.push(three)
    hand2.cards.push(ace)
    hand3.cards.push(ace)
    hand3.cards.push(other_ace)
    
    assert hand0.high_ace?
    assert hand1.high_ace?
    assert hand2.high_ace?
    assert hand3.high_ace?
  end
  
  def test_that_high_aces_doesnt_find_low_aces
    hand = Hand.new
    ace_hand = Hand.new
    empty = Hand.new
    ten = Card.new(10, :clubs)
    queen = Card.new(:Q, :diamonds)
    three = Card.new(3, :spades)
    ace = Card.new(:A, :hearts)
    hand.cards.push(ten)
    hand.cards.push(queen)
    hand.cards.push(three)
    ace_hand.cards.push(ace)
    ace.value = 1
    
    refute hand.high_ace?
    refute ace_hand.high_ace?
    refute empty.high_ace?
  end
  
  def test_that_total_does_good_math
    hand0 = Hand.new
    hand1 = Hand.new
    hand2 = Hand.new
    c_ace = Card.new(:A, :clubs) 
    ten = Card.new(10, :spades)
    six = Card.new(6, :hearts)
    h_ace = Card.new(:A, :hearts)
    s_ace = Card.new(:A, :spades)
    hand0.cards.push(c_ace)
    hand0.cards.push(ten)
    hand0.cards.push(six)
    hand0.total
    hand1.cards.push(ten)
    hand1.cards.push(six)
    hand1.total
    hand2.cards.push(h_ace) ## for discussion:  this was a dumb and subtle mistake
    hand2.cards.push(s_ace)
    hand2.cards.push(six)
    hand2.total
    
    assert_equal 17, hand0.value
    assert_equal 16, hand1.value
    assert_equal 18, hand2.value ## math is hard :/
  end
  
  def test_reduce
    hand = Hand.new
    ace = Card.new(:A, :spades)
    hand.reduce(ace)
    
    assert_equal 1, ace.value
  end
  
end
