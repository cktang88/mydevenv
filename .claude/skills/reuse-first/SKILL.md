---
name: reuse-first
description: Finds the existing flow to extend before any new code is designed or written. Use before proposing a design, even in a chat answer or a drafted reply, and before adding an endpoint, route, service, job, flag, helper, or component. For doubts about a design or PR that already exists, such as "is there a simpler way", use review-architecture, which runs this search.
---

# Reuse First

Run this before a design exists. A design sketched in a chat answer counts: once
it is written down, later searches only look for parts it can call.

State the need as a shape, not a feature: who triggers it, what goes in, what
comes back, and what gets stored. For example, "load something on demand for one
stored record without saving it", not "add a transcript endpoint".

Search for existing end-to-end flows with that shape. Look at the code next to
where the new code would go, the other callers of the pieces you plan to call,
and how similar data already reaches the same consumer. Read the comments on
candidates; they often state the exact rule you are about to reinvent. For a
broad search, delegate concurrent read-only exploration with one distinct
question per agent.

Trace the closest one or two flows end to end before proposing anything: entry
point, caller, authorization, config switch, storage, and tests.

For every rule the change needs (which record, who may, when it applies), find
how existing code decides the same question and use that. A check that appears
nowhere else in the codebase is a warning, not a solution.

Prefer, in this order: use the flow as it is, configure it, extend it with a
small branch or parameter, wrap it with an adapter, write new code. New code
needs a stated reason why each candidate does not fit. Keep existing callers'
behavior unchanged when the new path is off.

Stop and search again when the design needs any of these:

- a new route, endpoint, job, or service next to an existing one
- a new flag, config key, or generated file
- a new discriminator or special-case check
- the words "its own small X"

Report which flow the change extends, what it adds, and which candidates were
rejected and why. If nothing fits, say so and name what was searched.
