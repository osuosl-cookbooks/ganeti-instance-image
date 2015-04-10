actions :create, :delete

default_action :create

attribute :name, kind_of: String, name_attribute: true
attribute :address, kind_of: String, required: true
attribute :subnet, kind_of: String, required: true
