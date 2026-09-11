---
name: implement-feature
description: Implement features with maximum reuse and minimal focused changes through a tested PR. Also use when debug-and-fix hands off a larger or complex fix.
---

# Implement Feature

For Codex subagents, default to `gpt-5.6-terra` with medium reasoning for code
exploration and scoped implementation, and `gpt-5.6-luna` for known check commands.
Use `gpt-6-astra` for difficult design decisions and adversarial review. Choose a
higher tier only for a concrete difficulty; Sol is not the default explorer.
With a Codex model override, use `fork_turns="none"` and a self-contained handoff;
full-history forks inherit the parent model. On other tools, use comparable tiers.

Reuse any branch, worktree, diagnosis, and current evidence already established
for this task. Otherwise create a new branch and worktree from the freshly
fetched default branch (`main` where applicable). Understand the requested
behavior, then promptly delegate independent gaps in callers, existing reusable
code, and test coverage while the main agent maps the design. Give each agent a
bounded question, relevant paths and evidence, and a concrete result to return.
Review their evidence instead of repeating their searches.

For meaningful design tradeoffs, have strong reasoning subagents propose
different implementations concurrently, grounded in that exploration. Ask for
code pointers, pseudocode, and key signatures so alternatives are concrete enough
to compare. A settled, direct change does not need competing design proposals.

Look for substantial existing pieces to reuse. Share the tradeoffs and recommended
approach, incorporate feedback, and refine it as needed. Implement the smallest
clear change that fully delivers the feature; aim to write as little new code
as possible.

Delegate separable implementation work with explicit file ownership. Keep edits
to shared files with one owner. Start test preparation alongside implementation;
run checks against a stable revision and wait for their results before submission.
Reserve capacity for required fresh reviews; reuse existing agents for follow-up
work instead of exceeding the agent limit.

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
