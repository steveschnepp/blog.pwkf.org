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

Handicap | Name |  Effects
---|---|---
-1 | **Player can swap cards** | Just before executing a register the player can swap its content with a yet unplayed one.
0 | **Nothing special** | It's the regular game rules.
1 | **The player keeps its dicarded cards for the next round** | They are not put back in the deck. Just waiting for the next round. This is similar to the Flash Memory upgrade, but mandatory. Even for SPAM & others nasty cards.
2 | **Damage Points** | Each time the player gets hit with any damage, he adds a damage point. He can only draw 9 minus damage points cards from the deck. If he has more than 4 damage points, he fills his registers with the small amount of cards he draw, and places SPAM in each empty one.
3 | **Spam Lover** | Same as level 2 but the forced empty SPAM are always in the beginning and not in the register of the player's chosing

Each time a player resets, he fully repairs, so he removes his damage points.
He still gets 2 SPAM added to his discard pile if he does not have the
*Firewall* upgrade.

# Batteries Recharge

Each time a player passes on a waypoint, even when not stopping on it, all the
empty batteries of the same plate are recharged.
