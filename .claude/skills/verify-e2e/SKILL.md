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

Preflight the real boundary before expanding the test: boot the app, construct
one representative payload, exercise one real request, and check required
external operations with the worker's effective credentials. A read check does
not prove write access. Check relevant runtime differences before claiming a
production regression.

Have a fresh-context subagent write a small temporary script from this contract.
Use real local data and existing helpers. Avoid business-method stubs and
factories; state any necessary substitutions and their coverage limits.

Have a second adversarial subagent return one prioritized coverage review.
Resolve blockers, then run. Later reviews cover material changes to assertions,
resource scope, or cleanup; routine harness repairs do not restart the review.

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
