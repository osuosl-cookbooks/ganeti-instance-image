include_recipe 'ganeti-instance-image'

ganeti_instance_image_subnet 'vlan100' do
  netmask '255.255.255.0'
  gateway '10.0.0.1'
end
