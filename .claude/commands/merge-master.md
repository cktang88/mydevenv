Update this worktree/PR with the latest changes from master.

For each commit in master you must determine if those changes may influence this diff's changes, even if they didn't cause any explicit merge conflicts.

Be sure to understand the INTENT behind each commit and make sure our PR is compatible with those changes. For example, if master refactored something or moved classes/funcs/files, make sure we're following that new pattern with our code. Likewise any changes in functionality in master may interact with the diff of this PR, make sure we're accounting for all of those.

Do not drop any functionality unless clearly unnecessary/outdated.

(Feel free to use cheaper subagents to query github for changes and query codebase but use full intelligence for planning + heavy thinking about interactions)

