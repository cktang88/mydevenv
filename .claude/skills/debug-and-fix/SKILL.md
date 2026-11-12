---
name: debug-and-fix
description: Finds the cause of a failure, then the cause behind that cause, and delivers a tested fix as a draft PR. Use whenever something is failing, erroring, flaky, slow, stuck, timing out, or giving wrong results and the user wants to know why or wants it fixed, with wording such as "why is this failing", "figure out why and fix it", "root cause this", "debug and fix", "fix these errors", or "investigate", or with a pasted error, log, failing CI run, or ticket. Use it for a diagnosis without a fix too, and for failures in CI, tools, and third-party frameworks as well as production. For a requested change with no failure to explain, use implement-feature.
---

# Debug and Fix

Build an explanation that connects the observed failure to its cause in the code
and data, using logs, traces, read-only production queries, and a local
reproduction where useful. Try to disprove it before you trust it.

## Second-order why

The first cause that explains the symptom is usually one level too shallow, and
a fix at that level comes back as the next bug. Write the chain: symptom, direct
cause, the cause of that cause, and what owns it. Then check the fix against
these questions. Each one comes from a past fix that was too shallow.

- Does the fix prevent the failure, or only describe it better? A clearer error,
  an earlier rejection, a retry, or a longer timeout leaves the cause in place.
- Is this one instance of a shape? If the fix names one agent, provider,
  customer, or file, or two fixes look alike, fix the missing concept instead.
- Why is this limit, default, or number what it is? Who set it, and is it
  applied twice?
- What is an existing patch or special case compensating for? Removing the need
  beats moving the patch.
- Why did the last fix in this area miss this case?
- Which mechanisms are still unread? Check the owning tool's source and docs for
  a native setting, hook, or lifecycle before hand-rolling one.
- How big is the problem compared with the fix? Count affected runs or users.

Fix at the level that owns the cause. If that level cannot change now, ship the
smallest stopgap, call it a stopgap, and link the real fix. Several similar
failures get one shared investigation before any per-failure fix.

## Fix

For a small, direct fix: [reuse-first](../reuse-first/SKILL.md), the smallest
change that removes the cause, a check against the original failure, and a draft
PR. Use [implement-feature](../implement-feature/SKILL.md) when the fix needs
design tradeoffs or passes about 200 changed lines.

Report the chain, which level the fix addresses, the evidence, the verification,
and the PR link. Say what is still uncertain or left unfixed.
