Look at this PR or PR stack and analyze the general approach.

Use adversarial subagents to question general approach and test assumptions.

Also use adversarial subagents to do architecture review. Ensure this is the best/simplest implementation possible. Sample questions to ask:
  - Whats one or two things u would change if you had to cut complexity by 50%?
  - What underlying assumptions is the code carrying that must be tested further? Does changing an underlying assumption make implementation 2x easier?
  - Does the PR do a lot of unnecessary hacks that can be avoided with a different structure?
  - How would you implement it differently if you had to implement this feature greenfield?

With that in mind first go through and read the PRs and explore related/touching code. Then do the analysis with subagents. Finally give a simple very easy to understand report.

(Feel free to use cheaper subagents for code exploration/etc that don't need full intelligence but use full intelligence for planning + thinking)
