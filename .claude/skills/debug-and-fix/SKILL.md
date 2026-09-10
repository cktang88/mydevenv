---
name: debug-and-fix
description: Investigate a production issue, verify its root cause, and deliver a tested fix as a PR. Use for requests to take an issue from investigation through a fix.
---

# Debug and Fix

Investigate using Datadog logs and traces, targeted read-only production database
queries, and local reproduction where useful. Build an explanation that connects
the observed failure to its cause in the code and data.

Have independent adversarial subagents try to disprove the explanation, find contradictory
evidence, or identify alternative causes. Follow the evidence and make any
remaining uncertainty clear.

Once the cause is supported, create a new worktree from the latest default branch
and implement the smallest effective fix. Verify it against the failure and run
appropriate repository checks. Commit, push, and open a PR.

Briefly report the cause, evidence, verification, and PR link. If the cause remains
uncertain or a check is unavailable, explain the gap and the next useful check.
