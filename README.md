# Terraform for Azure Kubernetes Service
If you have a need to quickly spin up Kubernetes clusters regularly, fork this repository and do the following things.

Dependencies:

* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* Bash (for the jq command, but you can leave that part off and find the value yourself if you can't use bash)

## GitHub Variable Setup
Log in to your azure account.
```az login```

Create a service principle for github and assign it a role.

```az ad sp create-for-rbac --name "github" --role contributor --scopes /subscriptions/{subscription_id} --sdk-auth```

Set output json block (including brackets) to `AZURE_CREDENTIALS` in GitHub secrets.

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

## Terraform Variable Setup

Check the variables.tf file. This contains the default values. It's likely that these values won't all work for you. To override these values, creating a file that ends in `.auto.tfvars` with the variables you'd like to override will be the simplest option. [More info here](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files).

## Run

Once you complete the sections above, you're good to go. Commit your changes and check the `Actions` tab in your GitHub repository. You should see a deployment underway.

The pipeline is set up to run through a `terraform plan` if a pull request occurs, but will run a `terraform apply` if a change occurs in the `master` branch. This is intentional and a nice way to validate that changes don't break anything before reaching `master`.