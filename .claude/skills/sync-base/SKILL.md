---
name: sync-base
description: Merge the latest base branch into a PR or worktree and account for upstream changes, including interactions without merge conflicts. Use when asked to bring a branch up to date.
---

# Sync Base

Merge the latest intended base into the working branch. Use the supplied base,
the PR's target branch, or the repository's default branch as appropriate.
Preserve uncommitted work and the existing branch history.

Consider the intent of each incoming commit and how it affects this PR, even
when Git reports no conflict. Adapt to moved code, new patterns, and changed
behavior where relevant. Preserve functionality unless it is clearly obsolete
or unnecessary, and explain any removal.

Verify the combined behavior with checks appropriate to the affected interactions.
Summarize meaningful adaptations, results, and anything unverified. Update the
remote PR branch when requested or already authorized.
