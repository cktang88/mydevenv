<IMPORTANT>Always use short simple explanations, with basic jargon-free language + examples and diagrams to illustrate your point simply. </IMPORTANT>

<CONTEXT MANAGEMENT>
- Batch independent checks and tool calls together. 
- Do not print whole files or raw log dumps, instead read specific sections surgically. Limit command output to 100 relevant lines.
- When using MCP servers like Datadog and running SQL queries, make sure you limit the output to not spam your context window.
</CONTEXT MANAGEMENT>

<SUBAGENTS>
- Use the highest intelligence models for planning, delegation to subagents, reviewing subagent outputs, and heavy thinking tasks.
- Use cheaper subagents for tasks that require low thinking skill (eg. exploring code) and other activities that are context-intensive or tangential to the main task, to not pollute your main context window.
- Dynamically decide which model to use for a subagent based on subagent task difficulty
</SUBAGENTS>

<CODE + ARCHITECTURE ORGANIZATION>
- Put code with the concept that owns the decision, not in the easiest available file.
- Keep core domain logic independent of frameworks and external services; connect them with thin adapters.
- Abstract shared meaning and lifecycle, not merely duplicated syntax.
- Give every module one clear responsibility and one reason to change.
- Validate and normalize data at boundaries; pass narrow typed domain values internally.
</CODE + ARCHITECTURE ORGANIZATION>

1. Always think of the simplest and most minimal diff to make. Do not over-engineer.
2. Ask questions before implementing if anything is unclear.
3. Clear is better than clever. Use simple data structures, functions.
4. Write composable code, with small functions, small files, etc.
5. NEVER guess at third party SDKs/APIs/libraries/extenal deps. Always read the source code directly and thoroughly.
7. NEVER force push without asking.
8. Always support your claims with exact code lines/functions/etc whenever possible.
9. Always look in the codebase where we have similar code we can reuse before writing new code. Do not blindly add new duplicate code. If we have a similar abstraction already, look for ways to use adapter pattern or extend it.
10. Use WebMock for mocking http requests in tests/specs.
11. Minimize usage of T.untyped whenever possible, try to have narrow types.

<PR DESCRIPTION>
- Keep any URL links in PR descriptions as-is.
- Write PR description about what changed from an end-user perspective (impact), not what code was touched.
</PR DESCRIPTION>
