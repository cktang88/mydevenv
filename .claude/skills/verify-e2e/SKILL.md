---
name: verify-e2e
description: Independently verify a PR or worktree against the local application and real local data using a temporary end-to-end script. Use when asked for runtime proof of changed behavior, including outputs, side effects, and before/after evidence.
---

# Verify End to End

Demonstrate that the change delivers its expected behavior in the local
environment, including its interactions with existing code.

## Target

Use the supplied PR or worktree, or the current branch when unambiguous.
Establish the expected behavior, comparison revision, and local application and
database before testing. Ask if the target or environment is unclear.

## Verify

1. Start a subagent without inherited conversation history. Give it the target,
   requirements, repository instructions, and local setup details so it can read
   the code and write a temporary end-to-end script independently.
2. Exercise the real local application and local database with real local data.
   Assert expected outputs, generated artifacts, and state changes. Include the
   happy path, relevant failure paths, and interactions affected by the diff.
   Avoid stubs and factories unless necessary; explain any substitution and the
   coverage it prevents. Keep all test mutations in the local environment and
   restore affected data or use an isolated local copy for repeatable runs.
3. Have another subagent review and update the script against the requirements
   and diff, looking for missing assertions and important uncovered behavior.
4. Run the same script and assertions before and after the change with equivalent
   starting data. For a fix, show that the regression check fails for the expected
   reason before the fix and passes afterward. Setup or connection failures do
   not count. If the change preserves behavior, verify both revisions and explain
   why a failing baseline is not expected.

If a comparison, environment, or independent review is unavailable, report the
missing evidence and complete the checks that remain possible. Do not report
full verification when a required check was skipped.

## Finish

Report scenarios, assertions, before/after results, artifact locations, local
data cleanup, and remaining gaps. Include the script path and rerun command.
Keep the temporary script uncommitted; this skill does not fix application code.
