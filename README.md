# Description

1. How would you structure your Terraform project if you have multiple environments and use different cloud providers?

This project uses workspaces to use different environments, there are three workspaces that have been created `dev`, `stage` and `production`, when we want to deploy a configuration to any of the environment we can select it by `terraform workspace select dev` and use `terraform plan` & `terrafom apply` to deploy the resources, each environment has a different terraform state file so terraform will deploy new infrastructure on each environment.

To use different providers there is a specification on the `providers.tf` file with different providers to use, when using different providers we need to use the reources type for each one of them.

2. Write a Terraform script with the below requirements:
    ● Creates a ubuntu aws ec2-instance
    ● Install ansible
    ● Execute an ansible playbook

On the `resources.tf` file, I have specified the creation of a vpc, subnet, a network itnerface and used this infra to create an ec2 instance and configure it to have installed ansible and execute an ansible script at the end.
To get the ami for the ec2 instance I executed:
`aws ssm get-parameters --names \
   /aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id`
   