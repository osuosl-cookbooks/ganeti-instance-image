actions :create, :delete

default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :netmask, kind_of: String, required: true
attribute :gateway, kind_of: String, required: true
