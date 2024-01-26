# PR List Script
This script will iterate through all organizations your user has access to, and print the URLs of open pull requests.

## Requirements
To use this script, set the GH_PAT to your Github Personal Access Token and GH_HOST environment variable to the host (i.e. github.com).
jq and curl are prerequisites and should be installed on whatever machine it is run on.

## Usage
To run it on a local(non Windows) machine, be sure you have prerequisites set up, and run `./prs_to_review`.
To run it in docker, simply build the image with `docker build -t ghprs:1.0.0`, and run it with `docker run -e GH_PAT=$GH_PAT -e GH_HOST=$GH_HOST ghprs:1.0.0`. Be sure to set your GH_PAT and GH_HOST locally as noted above.