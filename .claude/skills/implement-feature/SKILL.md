---
name: implement-feature
description: Implement features with maximum reuse and minimal focused changes through a tested PR. Also use when debug-and-fix hands off a larger or complex fix.
---

# Implement Feature

Choose from the models available in the current tool, using these roles:

- Lightweight: known check commands.
- Standard coding: code exploration and scoped implementation.
- Strong reasoning: difficult design decisions and adversarial review.

Use the cheapest reliable option for each role across the available model list,
not just one step below the parent model. Escalate when the task or observed
results require it. Respect explicit user choices. Where supported, select the
worker's model and task-appropriate reasoning effort explicitly and provide a
self-contained handoff; check the tool's context-inheritance rules. Use only
controls the tool exposes. If model selection or delegation is unavailable,
continue with the available model or perform the scoped work locally.

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
