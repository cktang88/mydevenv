---
name: sync-base
description: Merge the latest base branch into a PR or worktree and adapt to upstream changes, including behavior changes without merge conflicts. Use when explicitly asked to bring a branch up to date while preserving its intended functionality.
disable-model-invocation: true
---

# Sync Base

Bring the current change up to date with its base branch and preserve the intent
of both the PR and incoming changes.

## Target

Use the specified PR or worktree, or the current branch when unambiguous.
Use an explicitly supplied base branch, otherwise the PR's target branch,
otherwise the repository's default branch. Resolve the correct remote and ask
if the target is ambiguous. Preserve any uncommitted user work before merging.

## Integrate

1. Fetch the latest base branch. Read the PR's intended behavior and diff, and
   identify the incoming commits that are not already in the current branch.
2. For each incoming commit, assess whether its intent could affect the PR.
   Follow relevant callers, moved code, changed contracts, and behavior even
   when there is no textual merge conflict. Adapt to upstream patterns when
   they apply to the PR.
3. Merge the base into the working branch. Resolve conflicts and behavior
   interactions while preserving required functionality. Remove functionality
   only when evidence shows it is obsolete or unnecessary; explain the removal.
4. Run focused checks for the affected interactions and relevant repository
   checks. A clean merge alone is not evidence that the combined behavior works.

Use lighter models for bounded commit and code exploration when available;
keep decisions about interacting changes with the strongest available reasoning
model. Keep the existing branch history; do not rebase or force-push.

## Finish

Summarize the base revision integrated, meaningful interactions, adaptations,
and check results. If already up to date, say so without creating an empty commit.
Update the remote branch when pushing was requested or already authorized;
otherwise report that the result is local. Do not merge the PR into its base.
