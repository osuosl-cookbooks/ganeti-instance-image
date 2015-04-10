use_inline_resources

def whyrun_supported?
  true
end

action :create do
  config_dir = node['ganeti-instance-image']['config_dir']
  directory "#{config_dir}/variants" do
    recursive true
    action :create
  end
  template "#{config_dir}/variants/#{new_resource.name}.conf" do
    cookbook 'ganeti-instance-image'
    source 'variants.sh.erb'
    variables(
      arch: new_resource.arch,
      boot_size: new_resource.boot_size,
      cdinstall: new_resource.cdinstall,
      customize_dir: new_resource.customize_dir,
      filesystem: new_resource.filesystem,
      image_debug: new_resource.image_debug,
      image_dir: new_resource.image_dir,
      image_name: new_resource.image_name,
      image_type: new_resource.image_type,
      kernel_args: new_resource.kernel_args,
      nomount: new_resource.nomount,
      overlay: new_resource.overlay,
      swap: new_resource.swap,
      swap_size: new_resource.swap_size
    )
  end
end

action :delete do
  config_dir = node['ganeti-instance-image']['config_dir']
  file "#{config_dir}/variant/#{new_resource.name}.conf" do
    action :delete
  end
end
