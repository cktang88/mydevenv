---
name: review-architecture
description: Review a PR or PR stack for a simpler overall design and unsupported assumptions. Use when asked to assess the architecture or general approach.
---

# Review Architecture

Choose from the models available in the current tool, using these roles:

- Lightweight: mechanical inventories.
- Standard coding: caller, dependency, and ownership exploration.
- Strong reasoning: design alternatives and adversarial review.

Use the cheapest reliable option for each role across the available model list,
not just one step below the parent model. Escalate when the task or observed
results require it. Respect explicit user choices. Where supported, select the
worker's model and task-appropriate reasoning effort explicitly and provide a
self-contained handoff; check the tool's context-inheritance rules. Use only
controls the tool exposes. If model selection or delegation is unavailable,
continue with the available model or perform the scoped work locally.

Assess the PR or stack in the context of its requirements and related code.
Look for a simpler design that preserves the intended behavior and fits the
existing codebase.

For a stack, pin the base and tip and review their combined diff first. Trace
the data flow and shared owners across PRs, then check each layer's dependencies
and independent correctness.

After locating the affected boundaries, delegate independent caller, runtime, and
ownership questions concurrently while the main agent studies the combined design.
Give each agent a distinct question, pinned revisions, and existing evidence. Use
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
