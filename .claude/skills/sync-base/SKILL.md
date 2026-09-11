---
name: sync-base
description: Merge the latest base branch into a PR or worktree and account for upstream changes, including interactions without merge conflicts. Use when asked to bring a branch up to date.
---

# Sync Base

Merge the latest intended base into the working branch. Use the supplied base,
the PR's target branch, or the repository's default branch as appropriate.
Preserve uncommitted work and the existing branch history.

For a stack, keep one brief record of the base SHA, layer heads, owners, open
findings, and verified checks. One integration owner propagates the base from
bottom to top and reviews each upstream delta against the combined stack.

Consider the intent of each incoming commit and how it affects this PR, even
when Git reports no conflict. Adapt to moved code, new patterns, and changed
behavior where relevant. Preserve functionality unless it is clearly obsolete
or unnecessary, and explain any removal.

For a stack, delegate focused checks and keep results in the shared record. The
integration owner coordinates final verification; repository hooks still apply.
Before the final push against a moving base, fetch once more and merge any new
base changes. Rerun checks invalidated by that delta; unrelated changes do not
restart the full architecture review.

Verify the combined behavior with checks appropriate to the affected interactions.
Summarize meaningful adaptations, results, and anything unverified. Update the
remote PR branch when requested or already authorized.
