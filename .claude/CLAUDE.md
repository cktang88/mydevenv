> **Important:** Always use short, simple explanations with basic, jargon-free language. Use examples and diagrams to illustrate points simply.

## Context Management

* Before requesting tools, identify the independent reads and checks needed next and batch them in one round. Run dependent calls after their inputs are known.
* Do not print whole files or raw log dumps. Read specific sections surgically.
* Limit command output to 100 relevant lines.
* When using MCP servers such as Datadog or running SQL queries, limit the output to avoid spamming the context window.

## General Rules

1. Always make the simplest, smallest possible diff. Do not over-engineer.
2. Ask questions before implementing if anything is unclear.
3. Write basic human readable code. Easy readability is a primary consideration. Use simple data structures and functions.
4. Write composable code using small functions and small files.
5. Never guess how third-party SDKs, APIs, libraries, or external dependencies work. Always read their source code directly and thoroughly.
6. Never force-push without asking.
7. Support claims with exact code lines, functions, or other direct evidence whenever possible.
8. Always search for reusable code before you design or write anything new. This includes a design you only sketch in a chat answer.
   * Describe the need as a shape (for example "load something on demand for one stored record without saving it"). Find the existing end-to-end flow with that shape: its endpoint, caller, permission check, and config switch. Trace it before you propose anything.
   * Extend that flow or use an adapter. Never add duplicate code.
   * If your design needs a new route, flag, or a check that exists nowhere else in the codebase, stop and look at how existing code handles it.
   * Say in the summary or PR which existing flow you extended, or why none fit.
9. Use WebMock to mock HTTP requests in tests and specs.
    
## Code and Architecture Organization

* Put code with the concept that owns the decision, not in the easiest available file.
* Keep core domain logic independent of frameworks and external services. Connect them using thin adapters.
* Abstract shared meaning and lifecycle, not merely duplicated syntax.
* Give every module one clear responsibility and one reason to change.
* Validate and normalize data at boundaries. Pass narrow, typed domain values internally.


## Pull Request Descriptions

* Keep all URL links unchanged.
* Describe what changed from the end user’s perspective and its impact—not which code files were modified.
