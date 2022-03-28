# make sure terraform CLI is installed
terraform

# format the tf files
terraform fmt

# validate the template
terraform validate

# plan and save the infra changes into tfplan file
terraform plan -out tfplan

# show the tf plan file
terraform show -json tfplan >> tfplan.json

# show only the changes
cat tfplan.json | jq -r '(.resource_changes[] | [.change.actions[], .type)'
cat tfplan.json || jq '[.resource_changes[] | {type: .type, name: .change.action}]'

# apply the infra changes
terraform apply tfplan

# the delete the infra
terraform destory
