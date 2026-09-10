---
name: address-reviews
description: Address PR reviews or fix PR review comments by first identifying overarching patterns, structural root causes, and simpler approaches, then implementing coherent fixes. Use whenever asked to address or fix PR reviews, even without a separate request for simplification or pattern analysis.
---

# Address Reviews

Step back and understand what the reviews collectively reveal about the design.
The primary task is to recognize the underlying structure and root causes, then
find a higher-level or simpler fix that addresses the concerns cleanly. Do this
before editing code, even when the user only asks to fix review comments.

## Target

Use the supplied PR or the current branch's PR when unambiguous. Ask if the PR
cannot be identified. Read all available reviews and discussion, including
resolved or outdated threads, and compare their claims with the current diff.

## Understand the pattern before fixing

1. Read the reviews as a whole alongside the PR's intent and related code.
   Identify where concerns keep pointing: repeated assumptions, special cases,
   unclear ownership, or interactions that are hard to reason about. Summarize
   the overarching patterns before turning comments into individual work items.
2. Trace each pattern to the underlying structure. Follow data flow and decision
   ownership to explain why these symptoms recur. Identify the shared cause,
   such as a rule enforced in the wrong place or an unnecessary state distinction.
   Comments about the same file alone do not establish a shared cause.
3. Test that diagnosis against the current code and review evidence. Distinguish
   real concerns from already fixed or unsupported claims, and identify problems
   that predate this PR. Reuse existing triage when available. Revise the proposed
   pattern if the evidence does not support it.
4. Ask whether a higher-level change would remove the cause and simplify the
   implementation: move a decision to its owner, reuse an existing abstraction,
   or remove unnecessary branching. Compare that approach with local fixes,
   including its cost and effect on required behavior. Prefer the simplest
   coherent solution; keep unrelated concerns separate instead of forcing them
   into a new abstraction.
5. Briefly explain the root cause, chosen approach, and which comments it
   addresses, with code evidence. Then implement the requested fixes in the PR's
   branch or worktree. Continue through implementation without stopping for plan
   approval; ask only when missing requirements prevent choosing correct behavior.
6. Validate that the chosen change removes the underlying problem and preserves
   required behavior. Run appropriate checks, including focused regression
   coverage for affected interactions. Map the results to the review concerns
   and explain anything left unchanged or needing follow-up.

For example, several callers repeating the same validation may suggest moving
that validation to their shared boundary, if the rule belongs there.

## Finish

Lead with the overarching pattern, structural root cause, and why the chosen
approach is simpler. Then summarize changes, supporting comment links and exact
code references, and validation results. Explain which comments are addressed
and which remain open. If no shared cause is supported, explain why local fixes
are appropriate.

When the request includes updating the PR, commit and push the fixes to its
existing branch. Post replies or resolve review threads only when explicitly
requested or already authorized. For an analysis-only request, return
recommendations without editing code.
