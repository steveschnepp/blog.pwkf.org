---
layout: post
title: RoboRally Mods - Handicap
tags:
author: Steve SCHNEPP
---

I introduced my kids to [RoboRally](https://en.wikipedia.org/wiki/RoboRally) some time ago.
It's an old but iconic game involving some programming and lots of fun dealing with bugs.
We added our own additional rules set, effectively *modding* the game.

# Handicap

Since my oldest son was often winning, I
designed an handicap system to help balance the game.

* The winner of a game increase his handicap.
* The looser of a game decrease his handicap.
* Anyone in the middle does not change his handicap.

As soon as a player manages to reach the last waypoints at the end of a
register execution, we immediatly stop the game.  That player is declared
winner and every other player is ranked based on the order below. If a
comparison is equal, move to the next one.

1. Number of waypoints (bigger is better)
2. Distance to waypoints (smaller is better)
3. Current Energy blocks (bigger is better)
4. Amount of damage cards in the deck + trash (lower is better=

The effects of the handicap are:

Handicap | Name | Effects
---|---|---
-2 | **Play Just in time** | The player is not forced to fill registers in advance. He keeps his full 9-card hand and fills a register just before it is run.
-1 | **Swap remaining registers** | Just before executing a register the player can swap its content with an unexecuted one.
0 | **Nothing special** | _Fully regular game rules_.
1 | **Keep Discarded cards** | Cards not used for programming are not discarded, they are put back on the available deck. So, in the next round they are picked or again & again if not used. Even for SPAM & others nasty cards.
2 | **Damage Points** | Each time the player gets hit with any damage, he adds 1 damage point. He can only draw 9 minus damage points cards from the deck. If he has more than 4 damage points, he fills his registers with the small amount of cards he draw, and places SPAM in each empty one.
3 | **Spam Lover** | Same as level 2 but the forced SPAM cards are always added in the first registers, and not in the registers of the player's chosing.

Each time a player resets, he fully repairs, so he removes his damage points.
He still gets 2 SPAM added to his discard pile if he does not have the
*Firewall* upgrade.

# Batteries Recharge

Each time a player passes on a waypoint, even when not stopping on it, all the
empty batteries of the same plate are recharged.
