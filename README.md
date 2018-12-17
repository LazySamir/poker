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

## Initial Approach
Initially I thought of creating this app via Rails but soon realised this would be overkill given the requirements. Sinatra is lightweight and appropriate for simple apps like this one.

Although the instructions stated that a UI was not required for the basic brief, I planned to complete the 'gold' brief so decided to start with a html UI.

##### Domain Model
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

##### Database Model
I figured that for the 'gold' requirements (i.e. keeping track of games played and high scores) tables would be required, thus I modelled these too.

![Imgur](https://i.imgur.com/sLJ3zKK.jpg)

## Reflections & what I would do to improve it
Unfortunately, due to illness I wasn't able to spend as much time as I would have liked on this project. Due to time constraints I **prioritised** achieving **basic features** whilst **meeting all criteria** set.

#### Domain Model
There is definitely a lot of room for class extraction in this app. At the moment I do not believe they adhere to SRP. If I had more time I would:

Create a **Player Class** that knows it's own '*hand*' (which would be an instance of the **Hand Class**) and is responsible for keeping track of their 'high_scores'.

**Hand Class** would be responsible for scoring hands with the '*scorehand*' method extracted to the Hand Class.  

**Game Class** (renamed from Poker Class) is currently responsible for game related actions. Including allowing for customization and dealing cards. It's likely that some of this logic can be extracted to a **Dealer Class**, so **Game Class** is responsible for creating a customisable game (knowing params are valid)

The **Dealer Class** would be responsible for dealing cards to the players

**Deck Class** knows the value of all cards in the deck and is able picking random cards.

#### Meet additional functionality
##### Rank cards/hands by suit and values
This was an interesting challenge that I plan to continue working on.

*Current path to solution:*
Because each card in the deck is held as a 2 letter string it is possible to look up the first/second character (via string[0]) in associated ranking/scoring hashes. This would require a second hash ranking suits e.g. {'H' => 1, 'S' => 2, 'D' => 3, 'C' => 4}. I would iterate over hands/deck and create new ordered lists based on the values in these hashes

##### Allow user log in + track high scores
It's possible to manage these without a database, but tabes would allow for easier and more secure login authentication.
