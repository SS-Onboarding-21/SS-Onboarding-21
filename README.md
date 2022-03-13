# Terraform configuration to two groups of GCP instances
One instance and a count(2) of instances

---
## Requirements:
### System:
- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started#install-terraform)
### Program:
- Assign instance public key path
- Assign GCP credentials
## Run

---
## Meet the requirements:
### Install Terraform:

1. Find the [appropriate package](https://www.terraform.io/downloads.html) for your system and download it as a zip archive

2. After downloading Terraform, unzip the package. Terraform runs as a single binary named _terraform_. Any other files in the package can be safely removed and Terraform will still function.

Finally, make sure that the _terraform_ binary is available on your _PATH_. This process will differ depending on your operating system.

3. [This Stack Overflow article](https://stackoverflow.com/questions/1618280/where-can-i-set-path-to-make-exe-on-windows) contains instructions for setting the PATH on Windows through the user interface.


### Assign instance public key path
We suggest two ways of how to do that:
1. In _Jenkins-host/variables.tf_, _nodes\variables.tf_ files, in public_key_path variable,
> variable "public_key_path" {
>
>   description = "Path to file containing public key"
>
>   //default     = "C:\\Users\\kvozn/.ssh/id_rsa.pub"
>
>}

uncomment and change _default_ value to your public key _location_ and use
```
terraform init
terraform plan
terraform apply --auto-approve -no-color
```
Also, change _ssh_user_ variable, or it will be called _user_ by default

or

2. Use command parameters to assign the variable:
```
terraform plan -var="public_key_path=C:\\Users\\kvozn/.ssh/id_rsa.pub"
terraform apply -var="public_key_path=C:\\Users\\kvozn/.ssh/id_rsa.pub" --auto-approve -no-color
```
> If you have any keys, generate them:
> ```
> ssh-keygen
> ```

### Assign GCP credentials
1. Get [GCP credentials](https://docs.aviatrix.com/HowTos/CreateGCloudAccount.html#step-4-create-credential-file).
2. Set their location to GOOGLE_APPLICATION_CREDENTIALS environment variable or in
   [credentials](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#credentials)
   parameter in [Google Provider Configuration](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference#credentials).

In Linux you can do:
```
export GOOGLE_APPLICATION_CREDENTIALS=$path
```
> If you upload creds file to gcp Linux machine manually, you can use:
> ```
> export path=~/credentials.json; export GOOGLE_APPLICATION_CREDENTIALS=$path
> ```
> and check it with:
> ```
> echo $GOOGLE_APPLICATION_CREDENTIALS
> ```

---
## Run
1. Get code:
```
git clone https://github.com/SS-Onboarding-21/SS-Onboarding-21.git
cd SS-Onboarding-21
git checkout SS-8-Kateryna-Terraform
```
2. Apply Terraform instruction:
```
cd nodes
terraform init
terraform plan
terraform apply --auto-approve -no-color
```
3. To destroy with Terraform, run:
```
terraform destroy --auto-approve -no-color
```
or
```
terraform destroy -var="public_key_path=C:\\Users\\kvozn/.ssh/id_rsa.pub" --auto-approve -no-color
```




