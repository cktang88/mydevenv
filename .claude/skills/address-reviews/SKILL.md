---
name: address-reviews
description: Address PR reviews or fix PR review comments by checking the concerns, finding shared root causes, and implementing the smallest coherent fixes. Use whenever asked to address or fix PR reviews, even without a separate request for simplification or pattern analysis.
---

# Address Reviews

Resolve valid PR feedback with minimal, tested changes. Look for shared root
causes as part of addressing reviews, even when the user has not asked for a
higher-level simplification.

## Target

Use the supplied PR or the current branch's PR when unambiguous. Ask if the PR
cannot be identified. Read all available reviews and discussion, including
resolved or outdated threads, and compare their claims with the current diff.

## Address the feedback

1. Check whether each concern still identifies a real problem. Distinguish
   current issues from already fixed concerns, unsupported claims, and problems
   that predate this PR. Use existing review triage if available, verifying it
   against the current code.
2. Group supported concerns by shared cause, such as a missing boundary check,
   duplicated policy, or misplaced responsibility. Explain the causal connection;
   comments about the same file do not necessarily share a cause.
3. Look for existing code that already owns the relevant decision. Compare a
   shared fix with small local fixes and choose the least complex option
   that preserves required behavior. Keep unrelated issues separate.
4. Implement the supported fixes in the PR's branch or worktree. Proceed with
   the requested fixes without stopping at a plan. Ask only when a missing
   requirement or unresolved tradeoff prevents choosing the correct behavior.
5. Run checks appropriate to the changes, including focused regression coverage
   for changed behavior and affected interactions. Map each fix to the comments
   it addresses. Explain concerns left unchanged or needing follow-up.

For example, several callers repeating the same validation may suggest moving
that validation to their shared boundary, if the rule belongs there.

## Finish

Summarize the changes, supporting comment links and exact code references, and
validation results. Explain which comments are addressed and which remain open.
If there is no shared cause, resolve the supported concerns individually.

When the request includes updating the PR, commit and push the fixes to its
existing branch. Post replies or resolve review threads only when explicitly
requested or already authorized. For an analysis-only request, return
recommendations without editing code.
