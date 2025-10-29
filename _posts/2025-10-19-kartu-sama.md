---
layout: post
title: Kartu Sama - Rules
tags: card-game
author: Steve SCHNEPP
---

Kartu Sama is a card game I invented with my children. It’s similar to UNO but played with a regular 54-card deck.
It’s designed to be quick and fun, but not as hectic as UNO since there are no time-sensitive actions.

## Setup

1. Shuffle the cards.
2. Deal 3 cards to each player, then 2 more.
3. Place 1 card face up — this will be the discard pile.
4. Deal 3 more cards.
5. Place the remaining cards face down — this will be the draw pile.

## Gameplay

A game can be played by counting the accumlated points or by simply counting the number of rounds won.

### Start of Turn

1. Play one card from your hand onto the discard pile, face up.
   It must share a common trait with the top discard card — either the same rank or the same suit.
2. If the player has no valid card to play, they draw 2 cards and skip their turn.
3. If the player had only one card before drawing, they draw *nb_players − 1* additional cards.
4. The round ends when a player must draw but the deck is empty, or when a player plays their last card.
5. It ends immediately. Drawn cards still count.
6. Players total the points of the cards remaining in their hands.

### Scoring

* Number cards score their face value.
* Face cards (J, Q, K) score 1 point.
* Aces score 11 points.

In a **points game**, players add up their points each round.
In a **victory game**, the winner of a round is determined as follows:

1. The player with the lowest total points.
2. If tied, the player with the most cards.
3. If still tied, the player with the lowest master card.

## Variants

The core tenet of rules is rather flexible, and does accomodate nicely with some variants that one can
leverage to adjust the playing experience to its audience.

### Joker Variant

* A player may discard a Joker on any card, but must then discard *nb_players* additional cards that
  follow the discard rules. Jokers can be stacked.
* If the player cannot play the required additional cards, they draw *nb_players × 2* cards.
* Jokers score 20 points 
   
### Using a 32-card cards deck

Using a 32-card deck has the same rules, but leads to much shorter rounds.
Since only the higher number values are present, so it is a little more intense. 

### Using multiple 54-card decks

One can also use multiple 54-card decks to enable longer rounds, or when there are a significant amount of players.
Ideally the back side of the cards should be identical, but that's not really required as having different
back coloring gives away some information that can be strategically used.


## Naming explanation

"Kartu Sama" means "Same Card" in Indonesian, which nicely fits the theme of the game & the blog since
the Java island is in Indonesia.
