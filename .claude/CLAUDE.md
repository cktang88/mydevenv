> **Important:** Always use short, simple explanations with basic, jargon-free language. Use examples and diagrams to illustrate points simply.

## Context Management

* Batch independent checks and tool calls together.
* Do not print whole files or raw log dumps. Read specific sections surgically.
* Limit command output to 100 relevant lines.
* When using MCP servers such as Datadog or running SQL queries, limit the output to avoid spamming the context window.

## Subagents

* Use the highest-intelligence models for planning, delegating to subagents, reviewing subagent output, and other heavy-thinking tasks.
* Use cheaper subagents for tasks requiring less reasoning, such as exploring code, and for context-intensive or tangential work that could pollute the main context window.
* Dynamically choose the subagent model based on the difficulty of the task.

## Code and Architecture Organization

* Put code with the concept that owns the decision, not in the easiest available file.
* Keep core domain logic independent of frameworks and external services. Connect them using thin adapters.
* Abstract shared meaning and lifecycle, not merely duplicated syntax.
* Give every module one clear responsibility and one reason to change.
* Validate and normalize data at boundaries. Pass narrow, typed domain values internally.

## General Rules

1. Always look for the simplest, smallest possible diff. Do not over-engineer.
2. Ask questions before implementing if anything is unclear.
3. Clear is better than clever. Use simple data structures and functions.
4. Write composable code using small functions and small files.
5. Never guess how third-party SDKs, APIs, libraries, or external dependencies work. Always read their source code directly and thoroughly.
6. Never force-push without asking.
7. Support claims with exact code lines, functions, or other direct evidence whenever possible.
8. Before writing new code, look for similar code in the codebase that can be reused. Do not blindly add duplicate code. If a similar abstraction already exists, consider extending it or using an adapter.
9. Use WebMock to mock HTTP requests in tests and specs.
10. Minimize the use of `T.untyped`. Prefer narrow types whenever possible.

## Pull Request Descriptions

* Keep all URL links unchanged.
* Describe what changed from the end user’s perspective and its impact—not which code files were modified.
