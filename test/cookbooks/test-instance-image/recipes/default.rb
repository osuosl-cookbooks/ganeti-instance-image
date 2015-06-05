# XXX: This recipe is only used for testing and should not be used otherwise.
# Setup a fake ganeti cluster ip that's resolvable
hostsfile_entry '192.168.125.10' do
  hostname 'ganeti.local'
  action :create
end
# Make sure the hostname isn't set to localhost
# NOTE: This usually happens on vagrant systems
hostsfile_entry node['network']['interfaces']['eth0']['addresses'].keys[1] do
  hostname node['fqdn']
  aliases [node['hostname']]
  unique true
  action :create
end

include_recipe 'ganeti-instance-image'

ganeti_instance_image_subnet 'vlan100' do
  netmask '255.255.255.0'
  gateway '10.0.0.1'
end

ganeti_instance_image_instance 'foo.example.org' do
  address '10.0.0.100'
  subnet 'vlan100'
end

ganeti_instance_image_variant 'centos-6' do
  image_name 'centos-6.6'
  filesystem 'ext4'
end
