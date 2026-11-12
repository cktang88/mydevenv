---
name: review-architecture
description: Checks whether a design, plan, PR, or PR stack is the simplest approach that fits the existing code, and reports simpler alternatives with code references. Use whenever the user doubts an approach or its size, with wording such as "is there a simpler, easier, or better way", "why is this so complex", "why is this PR so big", "are we reusing existing code", "is this the canonical way", "is this worth it", or "review this approach". Also use on your own work before opening or updating a PR that is over about 100 non-generated changed lines or that adds a new route, service, job, flag, or abstraction, and before presenting a design with real tradeoffs. Not for line-by-line bug hunting or for triaging review comments.
---

# Review Architecture

The subject can be a PR, a stack, a plan, or a design that exists only in the
conversation, including your own work. Read all of it first. For a stack, review
the combined diff from base to tip.

Answer these with code references:

- Does it meet the original request? A required mechanism is part of
  correctness, so a different path with the same output does not meet it.
- Is there an existing flow it should extend? Run
  [reuse-first](../reuse-first/SKILL.md).
- What does it add (routes, services, jobs, flags, config, special cases), and
  what requested outcome would fail without each one? Tests added by the change
  do not prove a need.
- What one or two changes would remove most of the complexity? Would a different
  structure make the problem easier?

Keeping the current design is a valid conclusion. Use subagents only for a stack
or a large diff with independent questions.

Give a short, plain report with recommendations and tradeoffs. Edit code only if
the user asks, or when you run this on your own work before a PR.
