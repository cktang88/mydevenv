---
name: review-architecture
description: Review a PR or PR stack for a simpler overall design and unsupported assumptions. Use when asked to assess the architecture or general approach.
---

# Review Architecture

Assess the PR or stack against the original request, accepted constraints, and
related code. Separate required outcomes and mechanisms from suggested fixes.
An explicitly required mechanism is part of correctness. A different path with
the same output still leaves that requirement unmet.
Look for a simpler design that preserves the intended behavior and fits the
existing codebase.

For a stack, pin the base and tip and review their combined diff first. Trace
the data flow and shared owners across PRs, then check each layer's dependencies
and independent correctness.

After locating the affected boundaries, delegate independent caller, runtime, and
ownership questions concurrently while the main agent studies the combined design.
Give each agent the original request and requirements, a distinct question,
pinned revisions, and existing evidence. Use
their code references to assess the findings rather than repeating the exploration.

Question assumptions and special cases. What one or two changes would remove
most of the complexity? Would a different structure make the problem easier?
Use a greenfield design to explore alternatives, while accounting for the cost
of changing the existing implementation.

Use independent adversarial subagents to challenge the approach and assumptions
with concrete evidence. Assign reviews by concern, not automatically one per PR.
Keeping the current design is a valid conclusion.

Give a short, plain-language report with code references, useful recommendations,
and tradeoffs. This is a review; edit code only when requested.
