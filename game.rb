require 'deck'
require 'hand'
require 'money'
require 'bet'
require 'pot'
require 'bank'
require 'round'
require 'person'
require 'pry'

## maybe Game should not be a class? 

player = Player.new ## Players start with an empty hand and $100. 
dealer = Dealer.new
round = Round.new(player, dealer) ## Round starts with a fresh, shuffled deck and an empty pot. 
puts "~~ Let's play blackjack! ~~"
  
round.deal

until player.hand.value > 21 || round.stand ## busted?(player) doesn't work here
  round.ask(player)
end

dealer.hand.total

if player.hand.value > 21
  puts "The dealer wins with #{dealer.hand.value}."
else
  puts "The dealer has #{dealer.hand.value}."
  until dealer.hand.value > 16
    puts "The dealer hits."
    round.hit(dealer)
    dealer.hand.total
  end
  if dealer.hand.value > 21
    puts "The dealer busted! You win!"
    # payout
  elsif dealer.hand.value > player.hand.value
    puts "The dealer wins with #{dealer.hand.value}!"
  elsif dealer.hand.value == player.hand.value
    puts "You tie at #{dealer.hand.value} and get your bet back."
  else 
    puts "The dealer had #{dealer.hand.value}. You win with #{player.hand.value}!"
  end
end

# tie:  get bet back
# win:  get bet * 2
# lose:  lose bet

## payout
