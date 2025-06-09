gen_commit_msg() {
	local MODEL="gemma3:$1b-it-qat"
	# echo $MODEL
  # local MODEL="gemma3:1b-it-qat"
  # local MODEL="gemma3:4b-it-qat"
  # local MODEL="gemma3:12b-it-qat"
  local OLLAMA_URL="http://localhost:11434/api/generate"
  local DIFF=$(git diff --cached)

  if [[ -z "$DIFF" ]]; then
    echo "No staged changes to commit."
    return 1
  fi

# local SYSTEM_PROMPT="
# You are a helpful assistant that writes concise and Conventional Commit-style Git commit messages. 
# Given a git diff, output a single-line commit message in this format:
#
# <type>(<optional scope>): <short imperative summary>
#
# Use the imperative mood (e.g., 'add', 'fix', 'update') and avoid unnecessary punctuation or commentary. 
# Common types include: feat, fix, docs, style, refactor, test, chore, build, ci, perf, revert.
#
# Only return the commit message — no explanations, reviews, or additional text.
# "
#
# local SYSTEM_PROMPT="
# You are an assistant that writes precise, Conventional Commit-style Git commit messages.
#
# Given a git diff, respond with a multi-line commit message only, in this format:
# <type>(<optional scope>): <imperative summary>
# ========================
# RULES:
# Summarize changes in around 50 characters or less
#
# More detailed explanatory text, if necessary. Wrap it to about 72
# characters or so. In some contexts, the first line is treated as the
# subject of the commit and the rest of the text as the body. The
# blank line separating the summary from the body is critical (unless
# you omit the body entirely); various tools like 'log', 'shortlog'
# and 'rebase' can get confused if you run the two together.
#
# Explain the problem that this commit is solving. Focus on why you
# are making this change as opposed to how (the code explains that).
# Are there side effects or other unintuitive consequences of this
# change? Here's the place to explain them.
#
# Further paragraphs come after blank lines.
#
#  - Bullet points are okay, too
#
#  - Typically a hyphen or asterisk is used for the bullet, preceded
#    by a single space, with blank lines in between, but conventions
#    vary here
#
# If you use an issue tracker, put references to them at the bottom,
# like this:
#
# Resolves: #123
# See also: #456, #789
# ==================
#
# Use imperative mood (e.g., 'add', 'update', 'remove'). No punctuation at the end. No extra output or explanations — only the commit message.
# DO ONLY CREATE THE COMMIT MESSAGE!!!
# "
local SYSTEM_PROMPT="
You are an assistant that writes precise, Conventional Commit-style Git commit messages.

Given a git diff, respond with a single-line commit message only, in this format:
<type>(<optional scope>): 
<imperative summary>
#========================
RULES:
# Title: Summary, imperative, start upper case, don't end with a period
# No more than 50 chars. #### 50 chars is here:  #

# Remember blank line between title and body.

# Body: Explain *what* and *why* (not *how*). 
# Wrap at 72 chars. ################################## which is here:  #

# Include at least one empty line before it. Format: 
#
# How to Write a Git Commit Message:
# https://chris.beams.io/posts/git-commit/
#
# 1. Separate subject from body with a blank line
# 2. Limit the subject line to 50 characters
# 3. Capitalize the subject line
# 4. Do not end the subject line with a period
# 5. Use the imperative mood in the subject line
# 6. Wrap the body at 72 characters
# 7. Use the body to explain what and why vs. how
#==================

"
# Include task ID (Jira issue).
  local PAYLOAD=$(jq -n \
    --arg model "$MODEL" \
    --arg system "$SYSTEM_PROMPT" \
    --arg prompt "$DIFF" \
    '{model: $model, stream: false, system: $system, prompt: $prompt}')

  local RESPONSE=$(curl -s -X POST "$OLLAMA_URL" \
    -H "Content-Type: application/json" \
    -d "$PAYLOAD" | jq -r .response)

  echo $RESPONSE
}
