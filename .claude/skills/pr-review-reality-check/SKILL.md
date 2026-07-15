---
name: pr-review-reality-check
description: Triage many PR review comments, especially automated Codex or AI review comments, by judging whether each comment identifies a realistic production problem, whether the problem was introduced by the current PR or already existed, and whether the smallest viable fix is worth its added complexity. Use when asked to evaluate noisy PR review feedback, decide which comments to fix versus leave alone, or produce evidence-backed responses to reviewer comments.
---

# PR Review Reality Check

## Goal

Evaluate PR review comments as engineering decisions, not as tasks to blindly satisfy. For each comment, answer:

1. Is this a real problem with a meaningful chance of being hit in production?
2. Was it introduced by this PR, or is it pre-existing behavior?
3. Is the minimal fix worth the added complexity, or is doing nothing the better choice?

Support every answer with concrete evidence from code, diffs, tests, logs, runtime behavior, docs, or product constraints.

## Workflow

1. Gather the raw review comments and PR context.
   - If a PR is not specified, infer it from the current branch when possible.
   - Prefer thread/comment URLs, file paths, line numbers, and the exact reviewer claim.
   - Read the PR diff against its merge base before judging comments.

2. Read repository instructions before acting.
   - Follow local agent files such as `AGENTS.md`, `CLAUDE.md`, or area docs.
   - Use the repository's preferred search and test commands.
   - Look for similar existing code before proposing new code.

3. Reconstruct each comment's claim.
   - Translate vague feedback into a falsifiable statement.
   - Identify the affected user path, data shape, state transition, job, API, or UI behavior.
   - Do not accept the claim just because a reviewer or automated tool wrote it.

4. Trace whether the issue can happen in production.
   - Follow the execution path from changed code to real callers.
   - Check guards, validations, permissions, feature flags, transactions, retries, background job timing, browser behavior, and API contracts.
   - Treat purely theoretical failures as low priority unless the blast radius is high or the path is easy to hit.

5. Decide whether it is from this PR.
   - Compare changed behavior against the base branch.
   - Use `git diff`, `git blame`, nearby tests, and existing call sites to distinguish introduced regressions from inherited design.
   - If the PR only exposes an existing flaw, say that explicitly.

6. Evaluate the minimal fix.
   - Prefer the smallest local change that removes a realistic production risk.
   - Recommend no-op when the risk is speculative, already handled elsewhere, outside PR scope, or the fix adds indirection, state, branching, or maintenance cost disproportionate to the risk.
   - Recommend follow-up work only when the issue is real but not appropriate for the current PR.

7. Implement only when asked.
   - If the user asks for triage, produce the evidence-backed triage and stop.
   - If the user asks to fix accepted comments too, make only minimal changes and run the narrowest relevant checks.

## Evidence Standards

Use exact references whenever possible:

- Code: `path/to/file.ext:line` plus the relevant function, class, or component name.
- Diff: changed file and whether the behavior is added, removed, or unchanged versus base.
- Tests: test names, assertions, or missing coverage that matter to the claim.
- Runtime evidence: command output summaries, screenshots, logs, traces, or reproduced behavior.
- External APIs and SDKs: read source or official documentation before relying on behavior.

Avoid unsupported language such as "seems fine" or "probably okay." Say what was checked and what remains uncertain.

## Classification

Use these labels consistently:

- `Real PR issue`: A realistic production problem introduced or materially worsened by this PR.
- `Real existing issue`: A realistic production problem, but not caused by this PR.
- `Low-likelihood/speculative`: Possible in theory, but unlikely under real production inputs or flows.
- `Already handled`: The concern is covered by existing validation, guards, tests, architecture, or product constraints.
- `Needs product/reviewer call`: The right behavior depends on intent that cannot be inferred from code.

For recommendation:

- `Fix now`: Minimal fix is clear and worth the complexity.
- `No-op`: Leaving the code as-is is the best engineering tradeoff.
- `Follow-up`: Real issue, but out of scope or too complex for this PR.
- `Ask`: Clarification is required before changing behavior.

## Output Format

Start with a short summary:

```markdown
Reviewed N comments. Recommended: X fix now, Y no-op, Z follow-up, W ask.
```

Then provide one section per comment:

```markdown
### Comment 1: <short claim>

- Reviewer claim: <one sentence, with link if available>
- Verdict: <classification>
- Source: <introduced by this PR | existing | unclear>
- Recommendation: <fix now | no-op | follow-up | ask>
- Evidence:
  - <exact code/diff/test/runtime reference>
  - <exact code/diff/test/runtime reference>
- Reasoning: <brief explanation of why the production likelihood and complexity tradeoff support the recommendation>
```

When recommending `No-op`, make the simplicity argument explicit. Doing nothing is a valid outcome when the evidence does not justify more code.
