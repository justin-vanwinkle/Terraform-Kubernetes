# terraform-k8s
Quickly spin up a Kubernetes cluster using Azure Kubernetes Service

Log in to your azure account.
```az login```

Create a service principle for github and assign it a role.
```az ad sp create-for-rbac --name "github" --role contributor --scopes /subscriptions/{subscription_id} --sdk-auth```
Set output to `AZURE_CREDENTIALS` in GitHub secrets.
From that same output, set the following secrets in Github using the values of the similar named output fields:

* `ARM_CLIENT_ID`
* `ARM_CLIENT_SECRET`
* `ARM_SUBSCRIPTION_ID`
* `ARM_TENANT_ID`

Run these commands (replace tokens with your values).
```az storage account create --name {storage_account_name} --resource-group {resource_group_name}```
```az storage container create --name tfstate --account-name {storage_account_name}```
```az storage account keys list -g {resource_group_name} -n {storage_account_name} | jq -r ".[0].value"```

Set the output of the last command to `TF_ARM_ACCESS_KEY` in GitHub secrets.