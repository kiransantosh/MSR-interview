# MSR-interview
         Below are the details of the test. The test is divided into 6 steps, beginning with setting up the infrastructure to installing software and configuring the servers. Our preferred infrastructure automation tools are Terraform and Ansible, but it’s not mandatory to use them. Feel free to use the tools of your choice.  
## Usage<a name="usage"></a>

1. Create two EC2 Instances in AWS Cloud using,
Additional Information
•Instance Type of both instance is t2.micro
•Operating System for both instances Ubuntu Server 16.04 LTS
•Hostname of Instance 1 : MSR-test-Instance-1
•Hostname of Instance 2 : MSR-test-Instance-2
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

•NVM – Version 0.33.2
•Node – 8.12.0
•Docker – 18.06 or latest
•Docker Compose – 1.13 or latest
•Openssl – latest version
•Git – latest version
Preferred tools – Chef / Puppet / Salt stack / Ansible. 

**Directories to Refer in this repository**: docker_compose-1.13, nodejs-8.12.0, nvm-0.33.2 (This cookbook we are installing GIT as well added it as dependency), openssl-1.0.2, docker-18.06

``` 
Steps to Install chef cookbook's
1. cd  chef-repo
2. cd  cookbooks
3. chef generate cookbook httpd
4. cd httpd
5. vi  recipes/default.rb
6. package 'httpd' do
7. knife cookbook upload <package-name>
8. knife bootstrap <IP> --ssh-user ec2-user --sudo --identity-file /home/ec2-user/sankaraws.pem -N  node1 --run-list 'recipe[package-name]'
9. knife node run_list add node1 'recipe[package-name]'
```

3. Create a Docker Container in MSR-test-Instance-1 using Docker Compose file and ensure apache webserver is installed. Try to use configuration management tools to automate the entire installation of apache and deploy a sample html file from a GitHub repository.
Additional Information
•You can create your own GitHub repository with a sample html file.

**Directory to Refer in this repository**: apache-2.4.38
```
# In apache-2.4.38 cookbook initially we are downloading docker-compose.yml file from `curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-apache/master/docker-compose.yml > docker-compose.yml`
# subsequently executing `docker-compose up -d` to make apache webserver up and running.
# Apache webserver is installed via cookbook (apache-2.4.38) in this EC2 machine `MSR-test-Instance-1`

Usage

1. knife cookbook upload apache-2.4.38
2. knife node run_list add node1 'recipe[apache]'
```

4.Create a Docker Container in MSR-test-Instance-2 using Docker Compose file and ensure CouchDB Database is installed. Try to use any configuration management tool to automate the entire installation processes.
Additional Information
•We should be able to access the Futon – web GUI of CouchDB, from the external system.
Preferred tools – Chef / Puppet / Salt stack / Ansible. (Note – Ansible is Preferred)

**Directory to Refer in this repository**: couchdb-2.3.0
```
# In couchdb-2.3.0 cookbook, Using chef's bash resource https://docs.chef.io/resource_bash.html we are creating a docker-compose file
```
bash 'build-and-install-couchdb' do
  cwd ::File.dirname('/Users/santosh/')
  code <<-EOF
  echo 'some text for docker-compose' > docker-compose.yml
    docker-compose up -d
  EOF
  not_if { ::File.exist?(install_path) }
end
```
# subsequently executing `docker-compose up -d` to make couchDB up and running.
# Apache webserver is installed via cookbook (couchdb-2.3.0) in this EC2 machine `MSR-test-Instance-2`

Usage

1. knife cookbook upload couchdb-2.3.0
2. knife node run_list add node1 'recipe[couchdb]'
```
