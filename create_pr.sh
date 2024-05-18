#!/bin/zsh

# Get the repository root directory
repo_root=$(git rev-parse --show-toplevel)

# Set the absolute path to the template file using the repository root
template="$repo_root/.github/pull_request_template.md"

# Get current branch
current_branch=$(git rev-parse --abbrev-ref HEAD)

# Get list of all open branches sorted by commit date
open_branches=($(git for-each-ref --sort=-committerdate refs/remotes/origin --format='%(refname:short)' | grep -v HEAD | cut -d'/' -f2-))

# Display numbered list of branches
echo "Choose the base branch:"
idx=0
for val in "${open_branches[@]}"; do
    idx=$((idx + 1))
    echo "$idx. $val"
done

# Prompt user to select a branch by number
echo -n "Enter the number of the base branch: "
read branch_number

# Validate the input
if ! [[ "$branch_number" =~ ^[0-9]+$ ]] || (( branch_number < 0 )) || (( branch_number >= ${#open_branches[@]} )); then
    echo "Invalid option. Please select a valid branch number."
    exit 1
fi

# Get the selected branch
selected_branch="${open_branches[$branch_number]}"

# Create a temporary copy of the template file
temp_template=$(mktemp)
cp "$template" "$temp_template"

# Open the temporary template in the code editor
code --wait "$temp_template"

# Push the current branch to the remote repository
git push origin $current_branch

# Open a pull request with the edited template
gh pr create --base $selected_branch --head $current_branch --title "$current_branch" --body "$(cat $temp_template)"

# Clean up temporary file
rm $temp_template
