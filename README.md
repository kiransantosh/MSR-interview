# MSR-interview
         Below are the details of the test. The test is divided into 6 steps, beginning with setting up the infrastructure to installing software and configuring the servers. Our preferred infrastructure automation tools are Terraform and Ansible, but it’s not mandatory to use them. Feel free to use the tools of your choice.  
## Usage<a name="usage"></a>

1. Create two EC2 Instances in AWS Cloud using,
               Additional Information
•	Instance Type of both instance is t2.micro
•	Operating System for both instances Ubuntu Server 16.04 LTS
•	Hostname of Instance 1 : MSR-test-Instance-1
•	Hostname of Instance 2 : MSR-test-Instance-2
              Preferred tools but not mandatory – Terraform
```
Go to MSR-terraform directory

terraform init
terraform get
terraform plan
terraform apply

Note: Using terraform backend uploading tfstate file to s3 bucket
```

2.Once these two servers are provisioned, ensure the below following software packages are installed using configuration management tool in both the provisioned instances.

             Additional Information
•	NVM – Version 0.33.2
•	Node – 8.12.0
•	Docker – 18.06 or latest
•	Docker Compose – 1.13 or latest
•	Openssl – latest version
•	Git – latest version
           Preferred tools – Chef / Puppet / Salt stack / Ansible. 
```
[placeholder]
```

3. [placeholder]

```
# [placeholder]
[placeholder]

# [placeholder]
[placeholder]

# [placeholder]
[placeholder]
```
