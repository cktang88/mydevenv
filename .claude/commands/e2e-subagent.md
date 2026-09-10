From a new subagent with empty context, write a tmp e2e script that fully exercises this PR/worktree using my local environment and local db on real data. Ensure all expected artifacts/mutations are asserted.
Then have a subagent review and update the script to ensure that it covers all parts of the PR, especially edge cases + interactions with existing code. Ensure both the happy path and non-happy paths.
Do not use stubs/factories unless absolutely necessary.

Finally run the e2e script using a red/green testing method to ensure this PR/worktree actually fixes the issue.

When finished, give a full report of results and artifacts.

DO NOT commit the tmp e2e script.
