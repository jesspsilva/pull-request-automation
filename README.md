# pull-request-automation

A script to automate the creation of pull requests from the terminal using Zsh and GitHub CLI.

## Features

- Lists all remote branches and allows the user to select the base branch by number.
- Opens the pull request template for editing in Visual Studio Code.
- Pushes the current branch to the remote repository.
- Creates a pull request with the edited template.

## Possible new features

- Automatically populates PR template details based on commit messages or branch name.
- Allows filling in other pull request data from the terminal, such as reviewers, assignees, labels, projects, and milestones.

## Requirements

- [Git](https://git-scm.com/)
- [Zsh](https://www.zsh.org/)
- [GitHub CLI (`gh`)](https://cli.github.com/)
- [Visual Studio Code](https://code.visualstudio.com/) (ensure the `code` command is available in PATH)

## Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/jesspsilva/pull-request-automation.git
    cd pull-request-automation
    ```

2. **Ensure that the `code` command is available in your PATH:**

    - Open Visual Studio Code.
    - Open the Command Palette (⇧⌘P on macOS or Ctrl+Shift+P on Windows/Linux).
    - Type and select `Shell Command: Install 'code' command in PATH`.

3. **Make the script executable:**

    ```sh
    chmod +x create_pr.sh
    ```

## Usage

1. **Navigate to your local Git repository where you want to create a pull request.**

2. **Run the script:**

    ```sh
    ./create_pr.sh
    ```

3. **Follow the prompts:**

    - Select the base branch by entering the corresponding number.
    - Edit the pull request template in Visual Studio Code. Save and close the file to proceed.
  
## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.
