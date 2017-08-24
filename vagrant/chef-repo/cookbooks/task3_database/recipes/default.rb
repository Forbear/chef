#
# Cookbook:: task3_database
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

mysql_service 'task3' do
  port '3306'
  version '5.5'
  initial_root_password 'vagrant'
  action [:create, :start]
end
