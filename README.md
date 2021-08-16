# github-action-copy-files-folders-to-another-repos
Github actions workflow to copy folders from one repository to another repository

Inputs Needed 

Property Name | Description | Sample data |
------------- | ----------- | ------------|
SOURCE_DIR | Source directory to copy files | k8s/pkg |
DESTINATION_REPOS_BRANCHES | List of repos and branches| "ec-release/oci.git:disty ec-release/helmcharts.git:disty" |
COMMIT_MESSAGE | Commit message for checking in files in dest repo | |
