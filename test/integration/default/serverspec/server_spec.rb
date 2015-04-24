require 'serverspec'

set :backend, :exec

describe yumrepo('instance-image') do
  it { should exist }
  it { should be_enabled }
end

describe package('ganeti-instance-image') do
  it { should be_installed }
end

describe file('/etc/default/ganeti-instance-image') do
  its(:content) do
    should match(%r{
ARCH="x86_64"
BOOT_SIZE=""
CACHE_DIR="/var/lib/cache/ganeti-instance-image"
CDINSTALL="no"
CUSTOMIZE_DIR=""
EXPORT_DIR=""
FILESYSTEM="ext4"
IMAGE_CLEANUP="no"
IMAGE_DEBUG="0"
IMAGE_DIR=""
IMAGE_NAME=""
IMAGE_TYPE="dump"
IMAGE_URL=""
IMAGE_VERIFY="yes"
KERNEL_ARGS=""
NOMOUNT=""
OVERLAY=""
SWAP_SIZE=""
SWAP="yes"})
  end
end

describe file('/etc/ganeti/instance-image/variants.list') do
  its(:content) do
    should match(/
default
centos-6/)
  end
end

describe file('/etc/ganeti/instance-image/networks/subnets/vlan100') do
  its(:content) do
    should match(/
NETMASK="255.255.255.0"
GATEWAY="10.0.0.1"/)
  end
end

describe file(
  '/etc/ganeti/instance-image/networks/instances/foo.example.org') do
  its(:content) do
    should match(/
ADDRESS="10.0.0.100"
SUBNET="vlan100"/)
  end
end

describe file('/etc/ganeti/instance-image/variants/centos-6.conf') do
  its(:content) do
    should match(/
FILESYSTEM="ext4"
IMAGE_NAME="centos-6.6"/)
  end
end
