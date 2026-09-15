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

Before refining the current structure, compare it with one materially different
end-to-end design. Search related code for an existing workflow or contract that
could accept the new behavior through a thin translator or orchestrator. Compare
the concrete inputs, data flow, ownership, and branches. Moving the same decisions
into another module is organization, not an architecture simplification.

After locating the affected boundaries, delegate independent caller, runtime, and
ownership questions concurrently while the main agent studies the combined design.
Give each agent the original request and requirements, a distinct question,
pinned revisions, and existing evidence. Use
their code references to assess the findings rather than repeating the exploration.

Before simplifying an implementation, check whether its behavior is needed.
For each costly special case, identify what requested outcome or existing
contract would fail without it. Consider removing it before adding helpers or
abstractions; tests added by this PR do not establish the requirement.

Question assumptions and special cases. What one or two changes would remove
most of the complexity? Would a different structure make the problem easier?
Use a greenfield design to explore alternatives, while accounting for the cost
of changing the existing implementation.

If the user repeats a simplification request or says the plumbing is still too
complex, treat the current framing as unproven. Re-derive the required outcomes
and repeat the boundary and composition comparison before doing another local
cleanup pass.

Use independent adversarial subagents to challenge the approach and assumptions
with concrete evidence. Assign reviews by concern, not automatically one per PR.
Keeping the current design is a valid conclusion.

Give a short, plain-language report with code references, useful recommendations,
and tradeoffs. This is a review; edit code only when requested.
