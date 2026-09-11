---
name: sync-base
description: Merge the latest base branch into a PR or worktree and account for upstream changes, including interactions without merge conflicts. Use when asked to bring a branch up to date.
---

# Sync Base

For Codex subagents, default to `gpt-5.6-terra` with medium reasoning for upstream
code exploration and `gpt-5.6-luna` for known check commands. Use `gpt-6-astra` for
difficult semantic conflicts. Choose a higher tier only for a concrete difficulty;
Sol is not the default explorer. With a Codex model override, use
`fork_turns="none"` and a self-contained handoff; full-history forks inherit the
parent model. On other tools, use comparable tiers.

Merge the latest intended base into the working branch. Use the supplied base,
the PR's target branch, or the repository's default branch as appropriate.
Preserve uncommitted work and the existing branch history.

For a stack, one integration owner keeps a brief record of base and layer SHAs,
open findings, and the revisions each check covers. Propagate the base bottom to
top and assess each upstream delta against the combined stack.

Once the base and tip are pinned, delegate independent upstream impact checks by
affected area while the integration owner handles the merge. Pass the pinned SHAs,
changed paths, and prior findings. Impact agents read those snapshots with
`git show`/`git diff` or an isolated checkout; keep Git mutations with the
integration owner. Give test preparation and known check commands to a separate
agent, and collect results against a stable revision before pushing.

Consider the intent of each incoming commit and how it affects this PR, even
when Git reports no conflict. Adapt to moved code, new patterns, and changed
behavior where relevant. Preserve functionality unless it is clearly obsolete
or unnecessary, and explain any removal.

Verify the combined behavior with checks appropriate to the affected interactions.
Before the final push against a moving base, fetch and merge the latest delta.
Rerun checks it invalidates; unrelated changes do not restart the architecture
review.

Summarize meaningful adaptations, results, and anything unverified. Update the
remote PR branch when requested or already authorized.
