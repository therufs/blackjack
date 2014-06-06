require 'deck'
require 'hand'
require 'money'
require 'bet'
require 'pot'
require 'bank'
require 'round'
require 'person'

class Game  
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @round = Round.new
    puts "Want to play a game?"
  end
  
  attr_accessor :player, :dealer
    
  def deal
    
  end
  
  def hit
  end
  
  def stand  ## seems dumb to stub/write a method that does nothing?
             ## BUT, less dumb to call .stand than take an input that 
             ## does nothing
  end
  
  def who_won?
  end
  
  def payout
  end
  
end

Game.new
puts "Game loaded"
