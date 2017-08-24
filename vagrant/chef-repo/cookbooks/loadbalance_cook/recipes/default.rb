#
# Cookbook:: loadbalance_cook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#include_recipe 'nginx'

package 'nginx' do
  action [:install]
end

service 'nginx' do
  action [:enable, :start]
end
