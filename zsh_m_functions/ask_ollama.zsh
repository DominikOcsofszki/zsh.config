readme_ollama() {
	local MODEL="gemma3:$1b-it-qat"
  local OLLAMA_URL="http://localhost:11434/api/generate"
  local DIFF=$( tree -a -L2)

  if [[ -z "$DIFF" ]]; then
    echo "No staged changes to commit."
    return 1
  fi

local SYSTEM_PROMPT="
TEMPLATE
create README info from input
============================================
# 🧠 Project Title

> Short one-liner explaining the project purpose.

## 📝 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference) (if applicable)
- [Examples](#examples)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

---

## 📖 Overview

Brief explanation of:
- What this project does.
- Why it exists.
- Key goals or use cases.

**Prompt to LLM:**  
*“Summarize the purpose and functionality of this project in 3–4 sentences.”*

---

## 🚀 Features

- Feature 1 
- Feature 2 
- Feature 3 

**Prompt to LLM:**  
*“List the main features of this project in bullet points.”*

---

## 🛠 Installation

'''bash
# Clone the repo
git clone https://github.com/yourusername/yourproject.git
cd yourproject

# Install dependencies
pip install -r requirements.txt


"
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
