require 'deck'
require 'hand'
require 'money'
require 'bet'
require 'pot'
require 'bank'
require 'round'
require 'person'
require 'pry'

class Game
  def initialize
    @player = Player.new ## Players start with an empty hand and $100. 
    @dealer = Dealer.new
    puts "~~ Let's play blackjack! ~~"
    play
  end
    
  def play
    if @player.bank > 0 
      round = Round.new(@player, @dealer)  ## start with a fresh, shuffled deck 
      round.play
      ask
    else puts "You're broke!  The casino manager unceremoniously chucks you into the dusty street."
    end
  end
  
  def ask
    puts "Press Q to quit or Enter to play again." ## lies, it doesn't care what you put
    ans = gets.chomp
    case ans 
    when "q" || "Q" then puts "You swagger out of the casino with $#{@player.bank}."
    else play
    end
  end

end

game = Game.new

# tie:  get bet back
# win:  get bet * 2
# lose:  lose bet

## payout
