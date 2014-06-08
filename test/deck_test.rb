require "minitest/autorun"
require "./deck"
require "./player"

class CardTest < MiniTest::Unit::TestCase

  def test_deck_for_right_number_of_cards
    deck = Deck.new
    assert_equal deck.cards.length, 4 * 13
  end

  def test_deck_for_right_number_of_cards_in_suits
    deck = Deck.new
    spades = 0
    hearts = 0
    diamonds = 0
    clubs = 0
    deck.cards.each do |c|
      case c.suit
        when :spades then spades +=1
        when :hearts then hearts +=1
        when :diamonds then diamonds +=1
        when :clubs then clubs +=1
      end
    end
    assert_equal 13, spades
    assert_equal 13, hearts
    assert_equal 13, diamonds
    assert_equal 13, clubs
  end
  
  def test_deck_for_right_cards_per_suit
    deck = Deck.new
    spades = []
    hearts = []
    diamonds = []
    clubs = []
    deck.cards.each do |c|
      case c.suit
      when :spades then spades.push(c.rank.to_s)
      when :hearts then hearts.push(c.rank.to_s)
      when :diamonds then diamonds.push(c.rank.to_s)
      when :clubs then clubs.push(c.rank.to_s)
      end
    end
    
    sorted = %w[10 2 3 4 5 6 7 8 9 A J K Q]
    
    assert_equal spades.sort, sorted
    assert_equal hearts.sort, sorted
    assert_equal diamonds.sort, sorted
    assert_equal clubs.sort, sorted
        
  end
  
  def test_shuffled_deck_for_right_number_of_cards
    deck = Deck.new
    deck.shuffle
    assert_equal deck.cards.length, 52
  end
  
  def test_shuffled_deck_for_unique_cards
    ## I wish there was a way to re-use my previous test ? 
    deck = Deck.new
    deck.shuffle
    spades = []
    hearts = []
    diamonds = []
    clubs = []
    deck.cards.each do |c|
      case c.suit
      when :spades then spades.push(c.rank.to_s)
      when :hearts then hearts.push(c.rank.to_s)
      when :diamonds then diamonds.push(c.rank.to_s)
      when :clubs then clubs.push(c.rank.to_s)
      end
    end
    
    sorted = %w[10 2 3 4 5 6 7 8 9 A J K Q]
    
    assert_equal spades.sort, sorted
    assert_equal hearts.sort, sorted
    assert_equal diamonds.sort, sorted
    assert_equal clubs.sort, sorted
  end
  
  def test_that_deck_is_shuffled
    deck = Deck.new
    deck.shuffle
    refute deck.cards == Deck.new.cards
  end

  def test_that_draw_produces_a_card
    deck = Deck.new
    assert_equal deck.draw.class, Card
  end
  
  def test_that_draw_reduces_deck
    deck = Deck.new
    deck.cards.length.times { deck.draw }
    assert_equal deck.cards, []
  end
    
  def test_that_deal_creates_new_hand  ## awkward:  haven't really written or tested Player yet but need it for Deck tests (& haven't tested Hand but need it for Player)
    deck = Deck.new
    player = Player.new
    ace = Card.new(:spades, :A)
    player.hand.cards.push(ace)
    deck.deal(player)
    
    refute player.hand.cards.include?(ace)
  end
  
  def test_that_deal_creates_correct_hand
    deck = Deck.new
    player = Player.new
    deck.deal(player)
    
    assert_equal player.hand.cards.length, 2
    assert_equal player.hand.cards[0].class, Card
    assert_equal player.hand.cards[1].class, Card
  end
  
  def test_that_hit_card_goes_to_correct_place
    deck = Deck.new
    player = Player.new
    deck.deal(player)
    deck.hit(player)
    
    assert_equal player.hand.cards.length, 3
    assert_equal player.hand.cards[2].class, Card
  end

end
