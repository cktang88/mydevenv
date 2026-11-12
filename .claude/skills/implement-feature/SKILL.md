---
name: implement-feature
description: Builds a requested code change end to end as a tested draft PR, scaled to its size. Use whenever the user asks to build, add, implement, wire up, prototype, or change code, or to make or open a PR for it. This includes short go-aheads after a discussion or diagnosis, such as "yes do it", "lets do option B", "go ahead", "fix it", "ship it", or "make a draft PR for that", and it includes small changes, proofs of concept, and quick illustrations. Also use when debug-and-fix hands off a fix. Not for questions, read-only investigation, or review-comment fixes on an existing PR.
---

# Implement Feature

Scale the steps to the change. Every change, including a proof of concept or a
quick illustration, gets four cheap steps, because past changes went wrong where
these were skipped: the acceptance check, the reuse-first search, focused tests,
and a review-architecture pass before the PR opens or updates. "Quick" shortens
the build, not these steps.

The heavier steps (subagent exploration, competing designs, adversarial review,
verify-e2e) earn their cost when the change is likely to exceed about 200
non-generated changed lines, touches a shared or risky path such as
authorization, billing, deletion, or migrations, or the user asks for
thoroughness. Below that, do the same thinking yourself. A subagent starts
without this conversation's context and returns only a summary, so delegate
questions that span many files or can run while you do other work, and answer a
handful of lookups directly.

Derive a short acceptance check from the original request and accepted constraints.
Separate required behavior and mechanisms from suggested solutions. Include what
would distinguish the requested change from old behavior or a rejected workaround.

For each added behavior, identify the user request or existing contract that
requires it. Agent proposals, implementation, and newly added tests do not
establish requirements. If removing that behavior still satisfies the request
and preserves existing contracts, omit it.

Use [reuse-first](../reuse-first/SKILL.md) before any design, including one
sketched in conversation. When asked to reuse a named mechanism, trace its input
producer through execution before adding another path. If it conflicts with
another accepted constraint, state that conflict rather than silently changing
the acceptance check.

Reuse any branch, worktree, diagnosis, and current evidence already established
for this task. Otherwise create a new branch and worktree from the freshly
fetched default branch (`main` where applicable). Understand the requested
behavior and map the design. For a larger change, delegate independent gaps in
callers, existing reusable code, and test coverage while you map it. Give each
agent a bounded question, the original request and acceptance check, relevant
paths and evidence, and a concrete result to return. Label assumptions
explicitly and pass along any user-set scope or change budget. Workers report
work that would exceed these limits instead of expanding the assignment
themselves. Review their evidence instead of repeating their searches.

For meaningful design tradeoffs, have strong reasoning subagents propose
different implementations concurrently, grounded in that exploration. Ask for
code pointers, pseudocode, and key signatures so alternatives are concrete enough
to compare. A settled, direct change does not need competing design proposals.

Share the tradeoffs and recommended approach, incorporate feedback, and refine
it as needed. Implement the smallest clear change that fully delivers the
feature; aim to write as little new code as possible.

For a larger change, delegate separable implementation work with explicit file
ownership and keep edits to shared files with one owner. Start test preparation
alongside implementation; run checks against a stable revision and wait for
their results before submission. Reserve capacity for required fresh reviews;
reuse existing agents for follow-up work instead of exceeding the agent limit.

Leave unrelated bugs, optimizations, and extra behavior for follow-up unless the
requested feature cannot work without them. Report those findings in the summary.

Once implemented, use [review-architecture](../review-architecture/SKILL.md) on
your own diff before the PR opens or updates, and apply the worthwhile
simplifications. Then remove code that those changes made unnecessary.

For a larger or risky change, have fresh adversarial subagents look for bugs and
edge cases. For a small one, reread the diff once as a skeptical reviewer. Fix
supported findings whose likelihood and impact justify the change. Run checks
appropriate to the feature and affected interactions.

Commit, push, and open or update the PR. For a larger change or one with
behavior that tests cannot show, use [verify-e2e](../verify-e2e/SKILL.md),
address any failures, and push the fixes. Use
[address-reviews](../address-reviews/SKILL.md) for available PR feedback as
needed, and push the resulting fixes too.

Compare the final change and verification evidence with the acceptance check.
Report an unmet requirement as unmet, even if the checks pass.

Finish with the PR link, a short explanation of the approach and which existing
flow it extends, and verification results or remaining gaps, including any step
above that was skipped and why.
