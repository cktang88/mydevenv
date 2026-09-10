---
name: review-architecture
description: Review a PR or PR stack for simpler architecture, unnecessary complexity, and unsupported assumptions. Use when explicitly asked to assess the overall approach. Produces recommendations without editing code.
disable-model-invocation: true
---

# Review Architecture

Evaluate whether the change achieves its required behavior with the simplest
practical design. Preserve product requirements and account for the existing codebase.

## Target

Use the PR, stack, or branch supplied with the invocation. Otherwise use the
current PR or branch when unambiguous. Ask if the target or required behavior is unclear.

## Review

1. Read the requirements, full diff, and related callers and implementations.
   For a stack, examine both the combined design and dependencies between PRs.
   Look for existing concepts or abstractions the change could reuse.
2. Identify assumptions, special cases, and responsibilities that belong elsewhere.
   Explore which one or two changes could substantially reduce complexity, and
   whether changing an assumption would simplify the design. A greenfield design
   can reveal alternatives; account for migration cost before recommending one.
3. Use independent subagents to challenge the approach and its assumptions.
   Give them the requirements and relevant code, and ask for contrary evidence,
   missed interactions, and simpler alternatives. Require concrete support for
   objections; finding no useful change is a valid result.
4. Compare alternatives against the current design. Recommend a change only when
   its benefit justifies the implementation and maintenance cost.

Use lighter models for bounded code exploration when available; keep design
judgment and final synthesis with the strongest available reasoning model.
If independent review is unavailable, disclose that gap in the result.

## Finish

Return a short verdict and ranked recommendations. For each, cite exact code,
explain the affected behavior, and describe the smallest useful change and its
tradeoffs. List unresolved assumptions and how to test them. Use a small example
or diagram when it makes the design easier to understand.

This skill ends with recommendations. Leave the code unchanged.
