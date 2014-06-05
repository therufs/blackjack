require 'card'
require 'deck'
require 'hand'
require 'money'
require 'bet'
require 'pot'
require 'bank'
require 'round'

class Game  ## need either a better name for Game or a word for "play a lot of games"
  
  def deal
  end
  
  def hit
  end
  
  def stand  ## seems dumb to stub/write a method that does nothing?
  end
  
  def who_won?
  end
  
  def payout
  end
  
end
