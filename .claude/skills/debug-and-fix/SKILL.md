---
name: debug-and-fix
description: Investigate a production issue, verify its root cause, and deliver a tested fix as a PR. Use for requests to take an issue from investigation through a fix.
---

# Debug and Fix

Investigate using Datadog logs and traces, targeted read-only production database
queries, and local reproduction where useful. Build an explanation that connects
the observed failure to its cause in the code and data.

As soon as independent questions are clear, delegate code/history tracing and
runtime evidence gathering concurrently while the main agent tests the leading
hypothesis. Pass the symptom, time range, relevant paths, and established evidence;
ask for concise findings with source locations and remaining uncertainty. Do not
wait for a complete diagnosis before delegating or repeat an agent's searches.

Have independent adversarial subagents try to disprove the explanation, find contradictory
evidence, or identify alternative causes. Follow the evidence and make any
remaining uncertainty clear.

Once the cause is supported, use
[implement-feature](../implement-feature/SKILL.md) before coding if the fix needs
nontrivial design tradeoffs or is expected to exceed 200 non-generated changed lines
(additions plus deletions, including tests). If the actual diff crosses that
threshold later, use it before opening or updating the PR. Carry forward the
confirmed diagnosis and evidence.

For a small, direct fix, use a new worktree from the latest default branch unless
one already exists for this task. Implement the smallest effective fix, verify it
against the failure, run appropriate checks, and commit, push, and open or update
the PR.

Give test preparation and execution to a separate agent while the main agent
works on the fix. Keep edits to each file with one owner, coordinate runs against
a stable revision, and collect the actual results before submission. Reserve
capacity for required fresh reviews; reuse existing agents for follow-up work
instead of exceeding the agent limit.

Briefly report the cause, evidence, verification, and PR link. If the cause remains
uncertain or a check is unavailable, explain the gap and the next useful check.
