---
name: review-architecture
description: Review a PR or PR stack for a simpler overall design and unsupported assumptions. Use when asked to assess the architecture or general approach.
---

# Review Architecture

Assess the PR or stack in the context of its requirements and related code.
Look for a simpler design that preserves the intended behavior and fits the
existing codebase.

Question assumptions and special cases. What one or two changes would remove
most of the complexity? Would a different structure make the problem easier?
Use a greenfield design to explore alternatives, while accounting for the cost
of changing the existing implementation.

Use independent adversarial subagents to challenge the approach and assumptions with
concrete evidence. Keeping the current design is a valid conclusion.

Give a short, plain-language report with code references, useful recommendations,
and tradeoffs. This is a review; edit code only when requested.
