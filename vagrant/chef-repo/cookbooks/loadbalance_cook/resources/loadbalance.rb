resource_name :loadbalance
property :roles, Array, default: []

template "/etc/nginx/conf.d/loadbalance.conf" do
  source 'loadbalance.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

action :attach do
  node_ip_arr = []
  new_resource.roles.each do |role|
    search(:node, "role:#{role}").each do |node|
      node_ip_arr << "server #{node['network']['interfaces']['enp0s8']['routes'][0]['src']};"
    end
  end
  if node_ip_arr.size != 0
    node_ip_arr.each do |node_ip|
      file = Chef::Util::FileEdit.new("/etc/nginx/conf.d/loadbalance.conf")
      file.insert_line_after_match(/upstream(.*)/,"server #{node_ip};") only_if { ::File.readlines("/etc/nginx/").grep(/server #{node_ip};/).size == 0 }
      file.write_file
    end
  end
  Chef::Log.info("#{node_ip_arr}")
  service "nginx" do
    action :restart
  end
end


