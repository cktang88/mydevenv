---
name: debug-and-fix
description: Finds the cause of a failure, then the cause behind that cause, and delivers a tested fix as a draft PR. Use whenever something is failing, erroring, flaky, slow, stuck, timing out, or giving wrong results and the user wants to know why or wants it fixed, with wording such as "why is this failing", "figure out why and fix it", "root cause this", "debug and fix", "fix these errors", or "investigate", or with a pasted error, log, failing CI run, or ticket. Use it for a diagnosis without a fix too, and for failures in CI, tools, and third-party frameworks as well as production. For a requested change with no failure to explain, use implement-feature.
---

# Debug and Fix

Investigate using logs and traces, targeted read-only production database
queries, and local reproduction where useful. Build an explanation that connects
the observed failure to its cause in the code and data.

## Second-order why

The first cause that explains the symptom is usually one level too shallow, and
a fix at that level tends to come back as the next bug. Before proposing a fix,
ask why once more and write the chain down: symptom, direct cause, the cause of
that cause, and the code or system that owns it. Then check the diagnosis and
the planned fix against these questions. Each one is something a user has had to
ask after a shallow fix.

- Does the fix prevent the failure, or only describe it better? A clearer error,
  an earlier rejection, a retry, or a longer timeout leaves the cause in place.
- Is this one instance of a shape? When two or more fixes look alike, or the fix
  names one agent, provider, customer, or file, look for the missing concept or
  the owner of the shared table and fix it there.
- Why is this limit, default, or number what it is? Find who set it and whether
  it is applied twice.
- What is an existing patch, workaround, or special case compensating for?
  Removing the need is better than moving the patch.
- Why did the last fix in this area miss this case, and what else would the same
  gap miss?
- Which mechanisms are still unread? Check the owning tool's or framework's
  source and docs for a native setting, hook, or lifecycle before hand-rolling
  one.
- How big is the problem compared with the fix? Count the affected runs or
  users before building.

Fix at the level that owns the cause. When that level is outside what you can
change now, such as an upstream project, ship the smallest stopgap, label it as
a stopgap, and open or link the upstream fix. Several failures get one
investigation of their shared cause before any per-failure fix.

## Evidence and delegation

Delegation earns its cost when independent questions span many files or
systems, or can run while you test the leading hypothesis. A subagent starts
without this conversation's context and returns only a summary, so answer a
handful of lookups directly. When you delegate code or history tracing and
runtime evidence gathering, pass the symptom, time range, relevant paths, and
established evidence, and ask for concise findings with source locations and
remaining uncertainty. Review the findings instead of repeating the searches.

Try to disprove the explanation: look for contradictory evidence and
alternative causes. For an incident that spans systems or a costly fix, give
this to independent adversarial subagents. Follow the evidence and make any
remaining uncertainty clear.

## Fix

Once the cause is supported, use
[implement-feature](../implement-feature/SKILL.md) before coding if the fix needs
nontrivial design tradeoffs or is expected to exceed 200 non-generated changed lines
(additions plus deletions, including tests). If the actual diff crosses that
threshold later, use it before opening or updating the PR. Carry forward the
confirmed diagnosis and evidence.

For a small, direct fix, use a new worktree from the latest default branch unless
one already exists for this task. Use [reuse-first](../reuse-first/SKILL.md) before
adding any new path. Implement the smallest fix that removes the cause, verify it
against the failure, run appropriate checks, and commit, push, and open or update
the PR. Before a PR over about 100 changed lines opens, run
[review-architecture](../review-architecture/SKILL.md) on it.

For a larger fix, give test preparation and execution to a separate agent while
you work on the fix. Keep edits to each file with one owner, coordinate runs
against a stable revision, and collect the actual results before submission.
Reserve capacity for required fresh reviews; reuse existing agents for follow-up
work instead of exceeding the agent limit.

Report the chain (symptom, direct cause, underlying cause), which level the fix
addresses, the evidence, the verification, and the PR link. If the cause remains
uncertain, a deeper level is left unfixed, or a check is unavailable, say so and
name the next useful check.
