---
name: address-reviews
description: Address, fix, or evaluate PR reviews by finding shared root causes, checking realistic impact and whether the PR caused the issue, and choosing fixes worth their complexity. Applies to ordinary review requests, including noisy AI feedback.
---

# Address Reviews

Read the reviews together with the PR and related code. Before editing, step
back: what do the concerns collectively reveal about the underlying structure?
Is there a higher-level or simpler fix that resolves several concerns cleanly?

Use the original request and full review thread, including clarifications, to
identify the acceptance criteria. Separate required behavior and mechanisms from
suggested fixes. Check the chosen solution against those criteria before editing
and before reporting a comment addressed.

Group comments by shared root cause, including across PRs in a stack. Keep every
comment ID, investigate each cause once at the pinned PR or stack tip, and check
the introducing layer for attribution. Delegate independent unresolved groups
concurrently as soon as they are identified, while the main agent examines shared
structure. Pass the original request, acceptance criteria, relevant comments,
revisions, and existing evidence. Reuse
evidence while the relevant code remains unchanged; check findings without
repeating the entire investigation. A single narrow group can stay with one owner.

Trace recurring symptoms to their cause: misplaced decisions, repeated rules,
or assumptions that make the implementation harder than it needs to be.

Check claims against real callers, data, and existing guards. Compare with the
base branch to distinguish problems introduced or worsened by this PR from
pre-existing behavior. Weigh realistic likelihood and impact, including serious
rare failures; a reviewer or AI assertion alone is not evidence.

Compare structural simplification with local fixes, reusing existing abstractions
where they fit. Preserve required behavior and weigh the benefit against added
complexity. Leaving code unchanged is valid for handled or speculative concerns,
or when the fix costs more than it helps. Keep unrelated existing issues as follow-ups.

Implement the simplest worthwhile fixes. Delegate independent fixes with explicit
file ownership and give known check commands to a separate agent. Collect results
against the final revision before submission. Briefly
explain the root causes, changes, concerns left unchanged or deferred, and any
remaining gaps, with concrete code or runtime evidence. Complete requested PR
updates; for an analysis-only request, return recommendations.
