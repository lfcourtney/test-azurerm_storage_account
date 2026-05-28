# OVERVIEW

This solution will deploy an Azure Storage Account into an existing Resource Group.

![](images/ad_storage_account.png)

It ignores various Tags auto-applied via Policy:

- Atlas_Project
- Capability
- Deployment-date
- OwnerEmailAddress
- Project
- Team

# PRE-REQS

- An existing Azure Resource Group.
- Visual Studio Code, Terraform, Azure CLI.

# GETTING STARTED

1. Clone this repository and open the folder in your terminal.
2. Log in to your Azure account:
   ```bash
   az login
   ```

- When you log in, Azure CLI terminal will prompt you to select a "default" subscription. You can view your active subscription profile by running:

  ```bash
  az account show --output table
  ```

- If you need to switch your subscription, run:

  ```bash
  az account set --subscription "YOUR_SUBSCRIPTION_ID"
  ```

# CONFIGURING VARIABLES

To deploy this infrastructure, you need to provide your personal Azure subscription and sandbox configurations. To avoid repetition, these instructions use the `terraform.tfvars` variables file, containing dummy data.

1. Initialise the working directory: Before setting up your variables, run the initialisation to download the necessary Azure providers:

```bash
terraform init
```

2. Fill out the values: Create a new file in the project root: `terraform.tfvars`. Copy the dummy content shown below into this file and update the dummy placeholders with your real environment configuration:

```bash
subscription_id = "your-actual-subscription-id-here"
resource_group = "your-sandbox-resource-group-name"
```

- Note that you can view the current subscription ID using Azure CLI. Run:

  ```bash
  az account show --query id -o tsv
  ```

⚠️ Important: `terraform.tfvars` will now contain your live subscription information. It must never be committed to source control. A `.gitignore` rule is included in this repository to automatically block this file from being pushed to GitHub.

# RUNNING TERRAFORM

1. Once your `terraform.tfvars` file has been populated, you are ready to proceed with the execution phase. Terraform will automatically detect this file and pass the variables into your commands:

```bash

# Plan the deployment to verify what will be built

terraform plan

# Apply the configuration to deploy the storage account to Azure

terraform apply --auto-approve

# Destroy the infrastructure when you are finished testing

terraform destroy --auto-approve
```
