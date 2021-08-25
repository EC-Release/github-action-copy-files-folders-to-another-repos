# github-action-copy-files-folders-to-another-repos
Github actions workflow to copy folders from one repository to another repository

#### Inputs 

Property Name | Description | Sample data |
------------- | ----------- | ------------|
SOURCE_DIR | Source directory to copy files | k8s/pkg |
DESTINATION_REPOS_BRANCHES | List of repos and branches. Entries will be separated by space. <br/> E.g: {repo-name}:{branch-name} {repo-name}:{branch-name} | "ec-release/oci.git:disty ec-release/helmcharts.git:disty" |
COMMIT_MESSAGE | Commit message for checking in files in dest repo | |

#### Example usage

```yaml
- name: Copy generated files to destination repo
  uses: ec-release/github-action-copy-files-folders-to-another-repos@main
  env:
    API_TOKEN_GITHUB: ${{ secrets.API_TOKEN_GITHUB }}
    GIT_USEREMAIL: ${{ secrets.GIT_USEREMAIL }}
    GIT_USERNAME: ${{ secrets.GIT_USERNAME }}
  with:
    SOURCE_DIR: 'k8s/pkg'
    DESTINATION_REPOS_BRANCHES: 'github.com/ec-release/oci.git:disty github.com/ec-release/helmcharts.git:disty'
    COMMIT_MESSAGE: 'EC Bot Deployment'
```

#### Environment variables

`API_TOKEN_GITHUB`: Github token to checking files in destination repo

`GIT_USEREMAIL`: Git configuration

`GIT_USERNAME`: Git configuration

Refs:

[How to add environment secrets](https://docs.github.com/en/actions/reference/environments)

[Generate the github token](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token)
