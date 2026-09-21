---
layout: post
title: GitHub Issue Discussions Belong in Code Comments
tags: tooling git software-craft code-quality
author: Steve SCHNEPP
---

I spent three hours last month hunting through deleted GitHub issues trying to understand why a particular loop had such a strange boundary condition.
The issue was closed.
The repo had moved.
The original author had left.
The context was gone.

So here is the practice I have settled on: when an issue's resolution touches the code, the explanation goes *in the code*, not in the issue thread.

## Why GitHub Issues Disappear

Issues seem permanent until they aren't.
Repositories get archived.
Issues get deleted by automation.
Accounts close.
Organizations restructure.

Code lives in the repo, in backups, in git history.
Code moves with deploys.
Code appears in `git blame`.
Code gets indexed by IDEs.

When someone reads the code two years from now and thinks "why is this here?", they need the answer in the code.
Not in a URL that might 404.

## The Practice

When a GitHub issue leads to code changes, add a comment to the code referencing the issue and explaining the decision.
The issue can then link back to the commit.

**Don't do this:**

```c
// TODO: see issue #1234
```

The person reading this in six months won't have issue #1234 in their head.

**Do this:**

```c
// Issue #1234: off-by-one in the outer loop.
// Usercount wraps past INT_MAX after ~550 days of continuous operation.
// The original boundary at <= length would silently corrupt the checkpoint on wraparound.
i < users.length - 1  // not <=
```

Or for complex logic, pull the decision into a comment block:

```c
// Issue #1234: We iterate up to length-1 instead of length because the
// checkpoint format stores the iteration count in a 32-bit field.
// Wraparound after ~550 days silently corrupts the file.
for (int i = 0; i < users.length - 1; i++) {
  // ...
}
```

## Durability Hierarchy

Most durable to least:

1. **Code itself** — survives zipping, export, migration, tool changes, platform shifts.
2. **Code comments** — moves with the code, visible on every read.
3. **Git commit messages** — lost in shallow clones, zip exports, history-less migrations. Still, [git makes a decent safety net]({% post_url 2013-04-04-do-not-fear-git-rebase-make-snapshots %}) when you keep the history.
4. **External references** — GitHub issues, JIRA, wikis. Lost when platforms change, accounts close, tools migrate.

Anything below code is betting a platform exists unchanged forever.
It won't.

## Why This Matters

The code is what runs.
The comment explains why.

Not in a deleted GitHub issue.
Not in an archived JIRA ticket.
Not in a deprecated tool.
Not in git history lost during migration, refactoring, or squashing.

The issue is *discussion*; the code comment is the *decision*.
{: .panel .tip }

## What Belongs in the Issue, Then?

Issues capture the *debate*.

- "Should we cap at length-1 or add a special case?"
- "I tested three approaches; here's the perf data"
- Counterproposals and rejections
- Links to related bugs

This is context for the *decision*, not the *decision itself*.
The decision lives in code.

The worst outcome is when the explanation lives only in a call or a chat thread.
Only the people who attended are aware, the same way [an inline email reply]({% post_url 2025-04-18-reply-inline-is-harmful %}) only serves the two people already in the conversation.
Everyone else reads the code and guesses.

And when someone does ask why a line is there, thank them.
If one person asks, a dozen others were wondering but too shy to ask.
That question deserves an answer everyone can see.
So write the answer where everyone looks: in the code.

## Code Comments as Living Documentation

Code comments are *current* explanation for *current* code, not an archive.

If a comment becomes obsolete, remove it.
Don't mark it "obsolete — see #1234" or "this used to be necessary before X".
That is just noise.

`git blame` and `git log` answer "when did this change and why?".
Code comments answer "why does this line exist *right now*?".

Keep comments in sync with code, or delete them.

## When to Keep Historical Notes

A comment sometimes documents a *continuing constraint* that only looks obsolete:

```java
// We still cap at INT_MAX even though Java 8+ handles larger streams.
// Reason: this must run on deployed systems stuck on Java 6 for legacy reasons.
// See issue #5678 for deprecation plan (target 2027).
```

That is a forward-looking note, not a tombstone.
It explains why the constraint still applies *now*.
Remove it the day the constraint disappears.

## The Real Win

The practice forces clarity.
Writing a comment for a future reader is harder than writing in an issue thread.
It makes you articulate the *decision*, not the *debate*.

Six months later, that decision is still there.
The issue can disappear.
The code remains.
