#!/bin/bash

# Check if GH_PAT and GH_HOST are set, exit if so.
if [ -z "$GH_PAT" ] || [ -z "$GH_HOST" ]; then
    echo "Please set the GH_PAT and GH_HOST environment variables."
    exit 1
fi

# GitHub API endpoint for getting user organizations
orgs_url="https://api.$GH_HOST/user/orgs"

# Fetch the list of organizations using curl and jq
organizations=$(curl -s -H "Authorization: Bearer $GH_PAT" "$orgs_url" | jq -r '.[].login')

# Iterate through each organization
for org in $organizations; do

    echo "Organization: $org"

    # Get repositories in org
    repos_url="https://api.$GH_HOST/orgs/$org/repos"
    # Get pull urls for org in current scope
    repositories=$(curl -s -H "Authorization: Bearer $GH_PAT" "$repos_url" | jq -c '.[].pulls_url')

    # Print the PR URLs from each repository under the org
    echo "Open pull requests:"
    echo "$repositories" | while read repo ; do
        trimmed_url=$(echo "$repo" | sed 's/{\/number}//g' | sed 's/"//g')
        pulls=$(curl -s -H "Authorization: Bearer $GH_PAT" "$trimmed_url")
        echo $(echo "$pulls" | jq -c '.[].html_url') | while read pull ; do
            echo "   $pull"
        done
     done
done
