#
# Cookbook:: couchDB
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

bash 'build-and-install-couchdb' do
  cwd ::File.dirname('/Users/santosh/')
  code <<-EOF
  echo 'db:
    image: couchdb
    ports:
      - "5984:5984"
    environment:
      - COUCHDB_USER=santosh
      - COUCHDB_PASSWORD=123456

  seed-db:
    image: ibmcom/swift-ubuntu
    volumes:
      - .:/root/MSR
    command: MSR/scripts/seed_couchdb.sh --username=santosh --password=123456 --url=http://db:5984
    links:
      - db' > docker-compose.yml
    docker-compose up -d
  EOF
  not_if { ::File.exist?(install_path) }
end
