---
name: verify-e2e
description: Verify a PR or worktree with an independent temporary test against the real application and representative data.
---

# Verify End to End

First record a short run contract: exact commit, behavior under test, entrypoint,
expected observable result, local data/services, required external resources,
authorization, and cleanup. Reuse established setup and permissions.

Keep application data isolated. When the feature requires external services,
use authorized disposable test resources. Resolve a genuine authorization gap
early while continuing independent preparation. Do not build a separate local
substitute by default; state exactly what a partial check can prove.

Have one fresh-context subagent own prerequisite checks, a small temporary
scenario script, and its first run. Reuse verified machinery for deadlines,
process ownership, durable resource IDs, recovery, and exact cleanup. Scenario
code should contain inputs, actions, and assertions.

Preflight one minimal real application request through its normal input producer
before building a larger test. Check required setup records, the selected runtime
environment, provider authentication, and external operations with the worker's
effective credentials. A standalone cloud probe does not prove the application
path; read access does not prove write access. Resolve prerequisite failures
before expanding. If a fix is authorized and the smoke reproduces the target
defect, fix it and rerun the same check. Check runtime differences before
claiming a production regression.

Do not stub behavior under test. Prefer production import or seed helpers.
Existing fixture or factory helpers may construct isolated setup records if they
do not install active stubs or mocks that replace the production path under test.
Validate the resulting state and disclose skipped setup callbacks as coverage
limitations. Loading a factory library is not itself using it. State other
necessary substitutions and their coverage limits.

Have a second adversarial subagent return one prioritized coverage review.
Resolve blockers, then run. The owner can repair routine harness issues and rerun
affected checks. Further review is for material changes to coverage or risk,
including assertions, resource scope, and cleanup. It is not a new authorization
gate; existing permissions still govern execution.

Start with one real happy-path smoke and the suspected failure. Negative cases
must prove the intended cause. Async waits must fail on unexpected terminal
states and use reliable runtime evidence. Expand only to affected interactions;
run independent cases concurrently within a stated resource limit.

For a fix, show the same failing check pass afterward with equivalent data.
Run the affected matrix after the fix; do not automatically repeat every
unaffected case on both sides. Rerun only checks invalidated by later changes.

Plan cleanup before dispatch and record owned resource IDs as they appear.
Restore local changes or retain an isolated copy. Remove owned external test
resources, including stored versions where applicable. Keep shared resources
untouched. Leave scripts uncommitted.

Report the result, confirmed failures, environment/harness issues, gaps, script
path, rerun command, and relevant artifacts in one concise report.
