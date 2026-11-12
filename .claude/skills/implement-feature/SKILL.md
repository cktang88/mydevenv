---
name: implement-feature
description: Builds a requested code change end to end as a tested draft PR, scaled to its size. Use whenever the user asks to build, add, implement, wire up, prototype, or change code, or to make or open a PR for it. This includes short go-aheads after a discussion or diagnosis, such as "yes do it", "lets do option B", "go ahead", "fix it", "ship it", or "make a draft PR for that", and it includes small changes, proofs of concept, and quick illustrations. Also use when debug-and-fix hands off a fix. Not for questions, read-only investigation, or review-comment fixes on an existing PR.
---

# Implement Feature

Every change gets these four steps, including a proof of concept or a quick
illustration. They are cheap, and past changes went wrong where they were skipped.

1. Acceptance check. Write what the request requires and what would tell the
   change apart from the old behavior. Add only behavior that the request or an
   existing contract requires; your own design ideas and new tests are not
   requirements.
2. [reuse-first](../reuse-first/SKILL.md) before any design. When the user names
   a mechanism to reuse, use it; if it conflicts with another constraint, say so
   instead of quietly changing the goal.
3. The smallest clear change with focused tests, on a fresh branch and worktree
   unless one already exists for this task.
4. [review-architecture](../review-architecture/SKILL.md) on your own diff
   before the PR opens or updates. Apply the worthwhile simplifications.

Then open or update the draft PR.

Add the heavier steps when the change is likely to pass about 200 changed lines,
touches a risky path such as authorization, billing, deletion, or migrations, or
the user asks for thoroughness: subagents for exploration that spans many files,
competing designs for real tradeoffs, a fresh adversarial review, and
[verify-e2e](../verify-e2e/SKILL.md). Give each subagent the original request,
the acceptance check, and any scope limit.

Leave unrelated bugs and improvements for follow-up and list them.

Finish with the PR link, which existing flow the change extends, the
verification results, and any step above that was skipped and why. Report an
unmet requirement as unmet even when the checks pass.
