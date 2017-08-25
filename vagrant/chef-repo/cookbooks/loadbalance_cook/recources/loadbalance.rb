actions :attach, :detach
template "/etc/nginx/conf.d/loadbalance.conf" do
  source 'loadbalance.conf.erb'
  variables(
    instance_name: new_resource.instance_name,
    port: new_resource.port
  )
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

