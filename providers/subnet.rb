use_inline_resources

def whyrun_supported?
  true
end

action :create do
  config_dir = node['ganeti-instance-image']['config_dir']
  directory "#{config_dir}/networks/subnets/" do
    recursive true
    action :create
  end
  template "#{config_dir}/networks/subnets/#{new_resource.name}" do
    cookbook 'ganeti-instance-image'
    source 'subnets.sh.erb'
    variables(
      netmask: new_resource.netmask,
      gateway: new_resource.gateway
    )
  end
end

action :delete do
  config_dir = node['ganeti-instance-image']['config_dir']
  file "#{config_dir}/networks/subnets/#{new_resource.name}" do
    action :delete
  end
end
