Review the current diff for long-term maintainability — not just correctness.

## Scope

Review changes in the current git diff (`git diff` for unstaged, or `git diff --cached` for staged, or `git diff HEAD~1` for the last commit — pick whichever has content). If `$ARGUMENTS` is provided, treat it as a file path, branch, or PR number and review that instead.

Before reviewing, **read the changed files in full** (not just the diff hunks) so you understand surrounding context, existing patterns, and module boundaries.

Also read `CLAUDE.md` and any relevant `doc/` files to understand the project's established conventions before flagging inconsistencies.

## Review categories

Evaluate each changed file against these areas:

### 1. Readability
- Names explain intent
- Functions do one clear job
- Control flow is easy to follow
- Not too much nesting, branching, or indirection

### 2. Separation of concerns
- Business logic is not mixed with UI, transport, database, or framework glue
- Parsing, validation, orchestration, and persistence are not crammed into one function
- Shared logic is centralized, not copied

### 3. Complexity
- Large functions or classes
- Too many conditionals
- Hidden state changes
- Clever shortcuts that are hard to reason about
- Code that requires reading five files to understand one behavior

### 4. Coupling
- A module knows too much about other modules' internals
- Small changes force updates in many places
- Logic depends on globals, singletons, or implicit shared state
- APIs between components are vague or leaky

### 5. Testability
- Code is hard to test without spinning up half the app
- Functions depend on clocks, random values, network calls, or databases without clean injection points
- Important behavior has no tests, or tests are brittle and overly implementation-specific

### 6. Duplication
- Same logic repeated in multiple files
- Similar condition trees copied with tiny variations
- Repeated constants, transformations, or validation rules that should live in one place

### 7. Error handling
- Errors are swallowed
- Failures are ambiguous or inconsistent
- Edge cases are handled ad hoc
- Logging is either missing or too noisy to be useful

### 8. Data and API design
- Function signatures are confusing or overloaded
- Data structures are inconsistent
- Callers need to know too many rules to use something correctly
- Types, schemas, or contracts do not make invalid states hard to represent

### 9. Comments and documentation
- Comments explain *why*, not restate *what*
- Surprising behavior is documented
- Public interfaces have enough usage guidance
- Outdated comments are treated as a problem

### 10. Project structure and file placement
- Are files in the correct directory for their responsibility?
- Do folder boundaries reflect real ownership?
- Are related files grouped together?
- Is shared logic placed at the right level (not buried in a leaf feature folder)?
- Are there catch-all `utils`/`helpers`/`common` folders being used as dumping grounds?
- If you needed to change this behavior, would it be obvious which folder to go to?
- If you needed to add a related file, would the right home be obvious?

### 11. Change safety
- Are there tests around risky areas?
- Will a future engineer know where to extend behavior?
- Are feature flags, migrations, or backwards compatibility handled cleanly?
- Is there a safe place to make the next change?

## Severity levels

- **High:** Hard-to-test code around critical paths, hidden side effects, strong coupling across modules, duplicate business logic, unclear ownership of state, large functions with multiple responsibilities, files in fundamentally wrong locations
- **Medium:** Weak naming, missing docs around non-obvious behavior, inconsistent patterns, minor duplication, overly clever abstractions, files that could be better placed
- **Low:** Style nits, small readability improvements, optional refactors that don't materially affect future changes

## Output format

For each finding, use this structure:

> **Issue:** [What the problem is]
> **Where:** [File path and line number or function name]
> **Why it hurts maintainability:** [Concrete impact on future changes]
> **Suggested fix:** [Specific, actionable recommendation]
> **Severity:** High / Medium / Low

## Output structure

1. **Summary** — One paragraph: what was changed, overall maintainability assessment (good / needs work / concerning), and the most important thing to address.

2. **Findings** — Grouped by severity (High first, then Medium, then Low). Within each severity, group by category.

3. **What's done well** — Briefly call out 1-3 things the code does right from a maintainability perspective. Good patterns should be reinforced.

## Guidelines

- Do NOT turn this into a style checker. Focus on things that make the codebase harder to understand, extend, and safely modify.
- Do NOT flag things that are idiomatic to the project's established conventions (check `CLAUDE.md` and existing patterns first).
- Do NOT suggest changes that add complexity without clear maintainability benefit.
- Be specific — cite exact file paths, line numbers, and function names.
- Prioritize findings that will matter in 3-6 months, not cosmetic issues.
- If there are no meaningful findings, say so. A clean review is a valid outcome.
