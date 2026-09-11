---
name: verify-e2e
description: Verify a PR or worktree with an independent temporary test against the real application and representative data.
---

# Verify End to End

For Codex subagents, default to `gpt-5.6-terra` with medium reasoning for scenario
design and harness repairs, and `gpt-5.6-luna` for known check commands. Use
`gpt-6-astra` for adversarial coverage review. Choose a higher tier only for a
concrete difficulty; Sol is not the default test runner.
With a Codex model override, use `fork_turns="none"` and a self-contained handoff;
full-history forks inherit the parent model. On other tools, use comparable tiers.

First record a short run contract: exact commit, behavior under test, entrypoint,
expected observable result, local data/services, required external resources,
authorization, and cleanup. Reuse established setup and permissions.

Keep application data isolated. When the feature requires external services,
use authorized disposable test resources. Resolve a genuine authorization gap
early while continuing independent preparation. Do not build a separate local
substitute by default; state exactly what a partial check can prove.

Keep one fresh-context subagent responsible for preflight, a small temporary
scenario script, and its first run. Prefer an existing runner; extend only the
missing setup, deadline, resource tracking, recovery, or cleanup steps.

Dispatch that owner once the behavior and entrypoint are known. The main agent
can inspect representative cases and prior evidence in parallel. Pass established
setup details and failures so the owner does not repeat discovery.

Before expanding verification, exercise one real application request through its
normal input producer. Confirm setup records, runtime selection, provider
authentication, and required external operations with the worker's effective
credentials. Read access does not prove write access. Resolve prerequisite
failures before expanding. If this reproduces the target defect, preserve the
failing check; fix and rerun it only if authorized. Check runtime differences
before claiming a production regression.

Do not stub behavior under test. Prefer production import or seed helpers.
Fixtures or factories may create isolated setup records without stubbing the
tested production path or its validation. Validate the resulting state and
disclose skipped setup callbacks or other substitutions as coverage limitations.

Have a second adversarial subagent return one prioritized coverage review once the
contract and assertions are available, while the owner prepares isolated fixtures
and services. Resolve blockers before the affected runs. The owner handles routine
harness repairs and reruns affected checks. Request another review only when changes to assertions,
resource scope, or cleanup materially alter coverage or risk.

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
