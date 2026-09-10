---
name: synthesize-review
description: Find shared root causes across a PR's review comments and recommend the smallest coherent fixes. Use when asked to identify recurring review patterns or a higher-level simplification. Produces a plan without editing code or posting replies.
---

# Synthesize Review

Find the underlying problems that explain several review comments and propose
fixes that address those problems together.

## Target

Use the supplied PR or the current branch's PR when unambiguous. Ask if the PR
cannot be identified. Read all available reviews and discussion, including
resolved or outdated threads, and compare their claims with the current diff.

## Synthesize

1. Check whether each concern still identifies a real problem. Distinguish
   current issues from already fixed concerns, unsupported claims, and problems
   that predate this PR. Use existing review triage if available, verifying it
   against the current code.
2. Group supported concerns by shared cause, such as a missing boundary check,
   duplicated policy, or misplaced responsibility. Explain the causal connection;
   comments about the same file do not necessarily share a cause.
3. Look for existing code that already owns the relevant decision. Compare a
   shared fix with small local fixes and recommend the least complex option
   that preserves required behavior. Keep unrelated issues separate.
4. Map each proposed fix to the comments it addresses and explain how to verify
   the resulting behavior. Identify concerns requiring clarification or follow-up.

For example, several callers repeating the same validation may suggest moving
that validation to their shared boundary, if the rule belongs there.

## Finish

Return the main patterns, supporting comment links and exact code references,
and a short ordered fix plan. Explain which comments each fix would resolve and
which remain separate. If no shared cause is supported, say so.

This skill ends with recommendations. Leave code and review discussions unchanged.
