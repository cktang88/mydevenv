---
name: implement-feature
description: Implement features with maximum reuse and minimal focused changes through a tested PR. Also use when debug-and-fix hands off a larger or complex fix.
---

# Implement Feature

Reuse any branch, worktree, diagnosis, and current evidence already established
for this task. Otherwise create a new branch and worktree from the freshly
fetched default branch (`main` where applicable). Understand the requested
behavior and have subagents explore gaps in how the system works today.

Have several strong reasoning subagents independently propose different
implementations, grounded in that exploration. Ask for code pointers, pseudocode,
and sketches of function signatures or key implementation pieces so the
alternatives are concrete enough to compare.

Look for substantial existing pieces to reuse. Share the tradeoffs and recommended
approach, incorporate feedback, and refine it as needed. Implement the smallest
clear change that fully delivers the feature; aim to write as little new code
as possible.

Leave unrelated bugs, optimizations, and extra behavior for follow-up unless the
requested feature cannot work without them. Report those findings in the summary.

Once implemented, use [review-architecture](../review-architecture/SKILL.md) and
apply worthwhile improvements. 

After that, be sure to remove any unnecessary or vestigial code as a result of material changes.

Have fresh adversarial subagents look for bugs and edge cases;
fix supported findings whose likelihood and impact justify the change. Run checks
appropriate to the feature and affected interactions.

Commit, push, and open or update the PR. Then use [verify-e2e](../verify-e2e/SKILL.md), address
any failures, and push the fixes. Use [address-reviews](../address-reviews/SKILL.md)
for available PR feedback as needed, and push the resulting fixes too.

Finish with the PR link, a short explanation of the approach and reuse, and
verification results or remaining gaps.
