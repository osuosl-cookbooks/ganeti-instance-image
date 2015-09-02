actions :create, :delete

default_action :create

attribute :name, kind_of: String, name_attribute: true

attribute :arch, kind_of: String, default: ''
attribute :boot_size, kind_of: String, default: ''
attribute :cache_dir, kind_of: String, default: ''
attribute :cdinstall, kind_of: String, default: ''
attribute :customize_dir, kind_of: String, default: ''
attribute :filesystem, kind_of: String, default: ''
attribute :image_cleanup, kind_of: String, default: ''
attribute :image_debug, kind_of: String, default: ''
attribute :image_dir, kind_of: String, default: ''
attribute :image_name, kind_of: String, required: true
attribute :image_type, kind_of: String, default: ''
attribute :image_url, kind_of: String, default: ''
attribute :image_verify, kind_of: String, default: ''
attribute :kernel_args, kind_of: String, default: ''
attribute :nomount, kind_of: String, default: ''
attribute :overlay, kind_of: String, default: ''
attribute :swap, kind_of: String, default: ''
attribute :swap_size, kind_of: String, default: ''
