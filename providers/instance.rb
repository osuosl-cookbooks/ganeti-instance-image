use_inline_resources

def whyrun_supported?
  true
end

action :create do
  config_dir = node['ganeti-instance-image']['config_dir']
  directory "#{config_dir}/networks/instances/" do
    recursive true
    action :create
  end
  template "#{config_dir}/networks/instances/#{new_resource.name}" do
    cookbook 'ganeti-instance-image'
    source 'instances.sh.erb'
    variables(
      address: new_resource.address,
      subnet: new_resource.subnet
    )
  end
end

action :delete do
  config_dir = node['ganeti-instance-image']['config_dir']
  file "#{config_dir}/networks/instances/#{new_resource.name}" do
    action :delete
  end
end
