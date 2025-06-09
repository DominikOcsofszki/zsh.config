#  zsh Configuration & Tools

> A collection of custom zsh configurations, tools, and plugins to enhance the command-line experience.

##  Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)

---

##  Overview

This project provides a comprehensive zsh configuration tailored for productivity and customization.  It aims to streamline the command-line workflow by integrating helpful plugins, alias shortcuts, and optimized settings. The configuration includes popular tools like Powerlevel10k, fzf, and nvim integration to create a powerful and efficient development environment. This project is designed to be easily adaptable to different workflows and environments.

---

##  Features

- **Powerlevel10k Theme:**  Utilizes the Powerlevel10k zsh theme for a visually appealing and informative prompt.
- **Nvim Integration:** Configures seamless integration with Neovim for efficient code editing from the command line.
- **Custom Aliases:** Includes a set of custom aliases to simplify common commands and tasks.
- **Ollama Integration:**  Includes tools for seamless interaction with the Ollama AI model from the command line.
- **Custom Functions:** Provides custom zsh functions for advanced command-line utilities.

---

##  Installation

This project assumes you're using zsh as your shell.  Follow these steps to install and configure it:

1.  **BACK-UP**
```sh
mv ~/.config/zsh ~/.config/zsh.bak
mv ~/.zshenv ~/.zshenv.bak
```

2.  **Clone the Repository:**

```bash
git clone https://github.com/DominikOcsofszki/zsh.config.git ~/.config/zsh
cd ~/.config/zsh
ln -s  ~/.config/zsh/.zshenv ~/.zshenv
```

3.  **Install Dependencies (if necessary):**

    Some dependencies may require additional installation steps.
- Install brew:
```sh
/bin/ (`brew`)bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- Install Plugins
```sh
sh ~/.config/zsh/.zsh_plugins/install_all.sh
```
4.  **Reload zsh:**

    ```bash
    source ~/.zshrc
    ```

---

##  Configuration

*   **Powerlevel10k:** After sourcing `.zshrc`, run `p10k configure` to customize the theme.
*   **Other settings:** Further adjustments can be made directly within the `.zshrc` file.  Review the file for comments and options.

[README.md - Created with llm]
