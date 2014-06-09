require "minitest/autorun"
require "./round"
require "pry"

class RoundTest < MiniTest::Unit::TestCase
  
  def test_that_deck_is_shuffled
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer)
    deck = Deck.new
    refute deck.cards == round.deck.cards
  end
  
  def test_that_pot_is_empty
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer)
    assert_equal 0, round.pot
  end

  def test_that_players_hands_start_empty
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer)
    assert_equal [], player.hand.cards
    assert_equal [], player.hand.cards
  end
  
  def test_that_deal_gives_each_player_two_different_cards
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer) 
    ## there's probably a way to not have to type this over & over
    round.deal
    assert_equal 2, player.hand.cards.length
    assert_equal 2, dealer.hand.cards.length
    refute player.hand.cards == dealer.hand.cards
  end
  
  def test_hit
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer)
    round.deal
    ##  dealt = player.hand.cards  ## :(
    round.hit(player)
    
    assert_equal 3, player.hand.cards.length
    ##  refute player.hand.cards == dealt
  end
  
  def test_busted
    player = Player.new
    dealer = Dealer.new
    round = Round.new(player, dealer)
    
    ten = Card.new(10, :spades)
    nine = Card.new(9, :hearts)
    eight = Card.new(8, :clubs)
    
    player.hand.cards.push(ten)
    player.hand.cards.push(nine)
    player.hand.cards.push(eight)
    
    assert round.busted?(player)
  end
  
  

end
