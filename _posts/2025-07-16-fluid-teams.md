---
layout: post
title: The Rise of Fluid Teams
tags: best-practices development
author: Steve SCHNEPP
permalink: /:categories/:year/:title:output_ext
---

Every project I have been on has the same unresolved tension: you need stable,
trusted ownership of the codebase, and you also need to move fast on features.
[Agile](https://en.wikipedia.org/wiki/Agile_software_development) solves the
second, not the first. *Fluid teams* are my attempt at solving both at once.

The design splits every team into two distinct kinds with very different
charters.

## Ephemeral Feature Teams

An Ephemeral Feature Team (EFT) is assembled for the duration of a single
epic, then dissolved. That is not a bug — it is the point.

EFT are **not** long lasting, by design.
{: .panel .tip }

Dissolving the team after the epic closes forces new pairings. New pairings
mean knowledge spreads, silos don't calcify, and people stop defending code
they wrote two years ago. The EFT is given full latitude to design, build, and
ship. It can include whoever the epic actually needs: a firmware engineer, a
UX person, a DBA. Not whoever happens to be on the permanent squad.

The trade-off is that EFTs have no merge authority over the shared codebase.
They cannot land code unilaterally.

## Stable Technology Teams

A Stable Technology Team (STT) is the counterweight. It is formed by senior
engineers with a long-term stake in a specific area of the codebase: the
rendering subsystem, the data pipeline, the auth layer.

An STT is formed by *experts* responsible for *areas of code* with a *long-term
perspective*.
{: .panel .tip }

The STT owns merges. That is its entire power. It reviews every pull request
that touches its area, and it can block anything that does not meet the bar.
In exchange, it owns every bug in that area too. Veto power comes with
maintenance responsibility. The two are inseparable by design.

That constraint is what keeps the STT from becoming a bureaucratic bottleneck.
If they block carelessly, they inherit the problem. If they approve too
loosely, the maintenance burden still falls on them. The incentives are
aligned.

## Structure at a Glance

|          | EFT                  | STT                     |
|----------|----------------------|-------------------------|
| Duration | Short (epic-scoped)  | Long                    |
| Focus    | Features             | Codebase integrity      |
| Authority | Ships features      | Controls merges         |
| Weakness | Needs STT sign-off   | Owns every bug          |
| Seniority | Junior/Senior       | Senior/Expert           |

## Where It Breaks Down

The obvious failure mode is EFT versus STT friction. Feature teams feel
*impeded*, technology teams see *short-term hacks* being pushed at them. Both
perceptions are accurate. That friction is not a defect — it is the
mechanism that produces quality. But it requires mutual respect to function,
and mutual respect does not emerge automatically.

The structural fix is a **promotion path from EFT to STT**. Newcomers enter
via EFTs, learn the codebase by submitting work for STT review, and gradually
earn the context required to join a technology team. The EFT phase is
effectively a structured apprenticeship. Those who are struggling surface
quickly, because their PRs are reviewed by people who own the consequences.

The second failure mode is STT ossification. A technology team that never
rotates becomes territorial. Rotation cadence is a tunable — the right
interval depends on the codebase churn rate — but it needs to exist.

A good STT review is not *"this is not how I would have written it"*. It is
*"this will break in these specific conditions"*. Keeping that distinction
clear is the main job of whoever manages the boundary between the two team
types.
