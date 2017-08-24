#
# Cookbook:: my_custom_cb
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
include_recipe "java"
include_recipe "netstat"
include_recipe "wildfly"
include_recipe "my_custom_cb::deploy"
