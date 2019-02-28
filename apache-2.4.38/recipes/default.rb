#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

bash 'build-and-install-apache' do
  cwd ::File.dirname('/Users/santosh/')
  code <<-EOF
    curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-apache/master/docker-compose.yml > docker-compose.yml
    docker-compose up -d
  EOF
  not_if { ::File.exist?(install_path) }
end
