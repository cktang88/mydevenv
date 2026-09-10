---
name: debug-and-fix
description: Investigate a production issue using Datadog, database evidence, and local reproduction, then verify the cause, implement a minimal fix in a new worktree, and open a PR. Use when asked for the full investigation-to-PR workflow.
---

# Debug and Fix

Explain why the reported failure happens, verify that explanation, and deliver
the smallest tested fix as a PR.

## Target

Use the issue and repository supplied with the invocation or established in the
conversation. Identify expected behavior, observed behavior, affected examples,
and the relevant time window. Ask for missing details that prevent investigation.

## Investigate and verify

1. Trace the affected code path. Use the Datadog MCP server for relevant logs,
   traces, and stack traces, and read-only production database queries for data
   evidence. Bound queries to the affected records and time window. Reproduce in
   the local environment when that will test the explanation.
2. Build a causal explanation from trigger to failure. Separate observed facts
   from hypotheses and compare plausible alternative explanations.
3. Have independent subagents challenge the explanation using the raw evidence
   and code. Ask them to find contradictions, missed interactions, and alternative
   causes. Resolve supported objections before treating the cause as established.

Use lighter models for bounded evidence gathering when available; keep causal
analysis and final synthesis with the strongest available reasoning model.
If access or independent review is unavailable, report what could not be checked.
If the cause remains uncertain, finish with the evidence and next useful check
instead of making a speculative fix.

## Fix and deliver

1. Fetch the latest default branch of the target repository and create a new
   worktree and branch from it. Verify that the cause still applies there.
2. Reuse existing patterns to implement the smallest fix. Add or update a focused
   regression check that fails for the expected reason before the fix and passes
   afterward. Run relevant existing checks for affected interactions.
3. Commit the fix, push the new branch, and open a PR. Explain the user-visible
   failure, its cause, the changed behavior, and the verification evidence.

Finish with the root cause, supporting references, validation results, any
remaining gaps, and the PR link. Keep explanations short and concrete.
