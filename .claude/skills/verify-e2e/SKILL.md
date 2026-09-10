---
name: verify-e2e
description: Verify a PR or worktree with an independent temporary end-to-end script using the local application and real local data. Use when asked for runtime verification of a change.
---

# Verify End to End

Have a subagent with fresh context write a temporary end-to-end script for the
PR or worktree. Give it the requirements and local setup details, and use the
real local application and database. Assert expected outputs, artifacts, and
mutations across the happy path, relevant failures, and affected interactions.
Avoid stubs and factories unless necessary; explain any coverage they replace.

Have another subagent review the script's coverage against the change, then run
it. For a bug fix, show that the same check fails for the expected reason before
the fix and passes afterward, using equivalent starting data. For other changes,
verify the intended behavior without forcing an artificial failing baseline.

Keep test effects local and restore affected data or use an isolated local copy.
Leave the temporary script uncommitted.

Report results and gaps, including any missing independent checks. Include the
script path, rerun command, and relevant artifacts.
