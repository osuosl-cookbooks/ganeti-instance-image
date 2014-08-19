#
# Cookbook Name:: ganeti-instance-image
# Recipe:: default
#
# Copyright (C) 2014 Oregon State University
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
include_recipe "ganeti"

case node['platform_family']
when "rhel"
  yum_repository "instance-image" do
    repositoryid "instance-image"
    description "Ganeti Instance Image - $basearch"
    url "http://ftp.osuosl.org/pub/osl/ganeti-instance-image/yum/$basearch"
    gpgcheck false
    action :add
  end
end

package "ganeti-instance-image"

template "/etc/ganeti/ganeti-instance-image" do
  source "defaults.sh.erb"
  variables( :params => node['ganeti-instance-image']['defaults'] )
  action :create
end

config_dir = node['ganeti-instance-image']['config_dir']
%w[subnets instances].each do |d|
  directory "#{config_dir}/networks/#{d}" do
    action :create
    recursive true
  end
end

unless node['ganeti-instance-image']['subnets'].nil?
  node['ganeti-instance-image']['subnets'].each do |subnet|
    template "#{config_dir}/networks/subnets/#{subnet.to_s}" do
      source "subnets.sh.erb"
      variables(
        :params => node['ganeti-instance-image']['subnet'][subnet.to_sym]
      )
      action :create
    end
  end
end

unless node['ganeti-instance-image']['instances'].nil?
  node['ganeti-instance-image']['instances'].each do |instance|
    template "#{config_dir}/networks/instances/#{instance.to_s}" do
      source "instances.sh.erb"
      variables(
        :params => node['ganeti-instance-image']['instance'][instance.to_sym]
      )
      action :create
    end
  end
end
