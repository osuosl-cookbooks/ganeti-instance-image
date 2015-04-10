include_recipe 'ganeti-instance-image'

ganeti_instance_image_subnet 'vlan100' do
  netmask '255.255.255.0'
  gateway '10.0.0.1'
end

ganeti_instance_image_instance 'foo.example.org' do
  address '10.0.0.100'
  subnet 'vlan100'
end
