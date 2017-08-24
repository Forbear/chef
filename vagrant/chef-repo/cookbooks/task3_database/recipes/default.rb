#
# Cookbook:: task3_database
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe "yum-mysql-community"

mysql_service 'default' do
  port '3306'
  version '5.5'
  initial_root_password 'vagrant'
  action [:create, :start]
end
