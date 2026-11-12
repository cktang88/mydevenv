---
name: review-architecture
description: Checks whether a design, plan, PR, or PR stack is the simplest approach that fits the existing code, and reports simpler alternatives with code references. Use whenever the user doubts an approach or its size, with wording such as "is there a simpler, easier, or better way", "why is this so complex", "why is this PR so big", "are we reusing existing code", "is this the canonical way", "is this worth it", or "review this approach". Also use on your own work before opening or updating a PR that is over about 100 non-generated changed lines or that adds a new route, service, job, flag, or abstraction, and before presenting a design with real tradeoffs. Not for line-by-line bug hunting or for triaging review comments.
---

# Review Architecture

The subject can be a PR, a stack, a plan, or a design that exists only in the
conversation. It can be your own work; review it as if someone else wrote it.

Scale the review. For a diff under about 200 non-generated lines or a short
plan, do it yourself in one pass: read the whole diff, run the
[reuse-first](../reuse-first/SKILL.md) search for an existing flow with the same
shape, and answer the questions below. Use subagents for a stack, a large diff,
or independent questions that can run at the same time. A subagent starts
without this conversation's context and returns only a summary, so a handful of
lookups is faster done directly.

Assess the subject against the original request, accepted constraints, and
related code. Separate required outcomes and mechanisms from suggested fixes.
An explicitly required mechanism is part of correctness. A different path with
the same output still leaves that requirement unmet.
Look for a simpler design that preserves the intended behavior and fits the
existing codebase.

Count what the change adds: routes, services, jobs, flags, config keys,
generated files, and special-case checks. For each one, name the existing code
that could have carried it, or the reason none could.

For a stack, pin the base and tip and review their combined diff first. Trace
the data flow and shared owners across PRs, then check each layer's dependencies
and independent correctness.

For a stack or a large diff, after locating the affected boundaries, delegate
independent caller, runtime, and ownership questions concurrently while you
study the combined design. Give each agent the original request and
requirements, a distinct question, pinned revisions, and existing evidence. Use
their code references to assess the findings rather than repeating the exploration.

Before simplifying an implementation, check whether its behavior is needed.
For each costly special case, identify what requested outcome or existing
contract would fail without it. Consider removing it before adding helpers or
abstractions; tests added by this PR do not establish the requirement.

Question assumptions and special cases. What one or two changes would remove
most of the complexity? Would a different structure make the problem easier?
Use a greenfield design to explore alternatives, while accounting for the cost
of changing the existing implementation.

Challenge the approach and its assumptions with concrete evidence. For a stack
or a large or risky design, use independent adversarial subagents, assigned by
concern and not automatically one per PR. Otherwise argue the opposite case
yourself: what would a reviewer who wants half the code say? Keeping the current
design is a valid conclusion.

Give a short, plain-language report with code references, useful recommendations,
and tradeoffs. When the user asked for the review, edit code only if they ask.
When you run this on your own work from implement-feature or debug-and-fix,
apply the worthwhile simplifications and say what changed.
