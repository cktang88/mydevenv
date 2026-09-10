---
name: address-reviews
description: Address or fix PR reviews by finding overarching patterns and structural root causes, then implementing the simplest coherent fix. Applies to ordinary review-fixing requests without a separate request for simplification.
---

# Address Reviews

Read the reviews together with the PR and related code. Before editing, step
back: what do the concerns collectively reveal about the underlying structure?
Is there a higher-level or simpler fix that resolves several concerns cleanly?

Trace recurring symptoms to their cause. Look for misplaced decisions, repeated
rules, or assumptions that make the implementation harder than it needs to be.
Ground the diagnosis in current code and evidence; review comments can be wrong
or already addressed.

Compare a structural simplification with local fixes, using existing abstractions
where they fit. Preserve required behavior and keep unrelated concerns separate.
For example, repeated validation in callers may belong at their shared boundary.

Implement the simplest supported approach and run checks appropriate to the
change. Briefly explain the root cause, why the approach helps, which comments
are addressed, and remaining gaps, with concrete references. Complete any
requested PR updates; for an analysis-only request, return recommendations.
