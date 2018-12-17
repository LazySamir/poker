# Poker
A very simple version of Poker built with Sinatra.

### User Stories
```
As a user,
So I can relax in my spare time,
I want to play a simple game of Poker,

As a user,
So I can customise my experience,
I want to specify the number of players,

As a user,
So I don't have to work it out for myself,
I want the game to show how many points each player received

As a user,
So I still don't have to work it out for myself,
I want the game to declare a winner
```
### How to use
#### Download the app
```
$ git clone git@github.com:LazySamir/poker.git
$ cd poker
$ bundle
```
#### Start the server
```
$ cd poker
$ rackup
```

#### Use app
```
Visit localhost:9292
Click 'play'
Enter number of players and hand size
Click 'play'
See player hands, score and who wins.
```

### Initial Approach
Initially I thought of creating this app via Rails but soon realised this would be overkill given the requirements. Sinatra is lightweight and appropriate for simple apps like this one.

Although the instructions stated that a UI was not required for the basic brief, I planned to complete the 'gold' brief so decided to start with a html UI.

##### Initial Domain Model
Before starting I mapped out a brief domain model:
```
Poker
--> deal_cards
--> declare_winner

Deck
all_cards = [AH, 2H, 3H...]
--> shuffle(all_cards)

Player
CARD_SCORES = {'AH': 1, '2H': 2, '3H: 3 ...'}
@hand = []
@handscore = 0
--> score_hand(hand)
```
Poker Class is responsible for game actions. This deals the cards and declares the winner.

Deck Class is responsible for the deck of cards. It knows the contents of the deck and is able to shuffle them.

Player Class is responsible for the cards dealt to the player. It knows the cards that it holds and can work out the value of those cards. (I am not completely sure yet if deciding the value should be the role of Deck rather than Player).

##### Initial Database Model
I figured that for the 'gold' requirements (i.e. keeping track of games played and high scores) tables would be required, thus I modelled these too.

![Imgur](https://i.imgur.com/sLJ3zKK.jpg)
