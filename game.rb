require 'deck'
require 'hand'
require 'money'
require 'bet'
require 'pot'
require 'bank'
require 'round'
require 'person'

## maybe Game should not be a class? 

player = Player.new ## Players start with an empty hand and $100. 
dealer = Dealer.new
round = Round.new(player, dealer) ## Round starts with a fresh, shuffled deck and an empty pot. 
puts "~~ Let's play blackjack! ~~"
  
round.deal
round.ask(player)



## player hits until stand or bust
## dealer hits until stand or bust

## hands compared
## payout
