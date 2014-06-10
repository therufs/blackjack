Command-line blackjack game.
$ ./bin/blackjack

Run tests: 
$ rake

====

Card and Hand are Comparable. 
Hand and Deck are Enumerable. 
Player and Dealer inherit from Person; at present this is entirely cosmetic. 


TODO: 

* write UI tests for round
* more tests for game
* change "dealer" to "house"
* figure out what's up with things getting replaced with jacks (or aces...?)
* put lib code into /lib
* get rid of unused class files 
* clean up comments
* pacify Rubocop

General improvements:

* Do better at wishing for methods
* Try writing tests before methods! :o
