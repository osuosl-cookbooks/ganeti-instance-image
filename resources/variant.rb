actions :create, :delete

default_action :create

attribute :name, kind_of: String, name_attribute: true

attribute :arch, kind_of: String, default: nil
attribute :boot_size, kind_of: String, default: nil
attribute :cache_dir, kind_of: String, default: nil
attribute :cdinstall, kind_of: String, default: nil
attribute :customize_dir, kind_of: String, default: nil
attribute :filesystem, kind_of: String, default: nil
attribute :image_cleanup, kind_of: String, default: nil
attribute :image_debug, kind_of: String, default: nil
attribute :image_dir, kind_of: String, default: nil
attribute :image_name, kind_of: String, required: true
attribute :image_type, kind_of: String, default: nil
attribute :image_url, kind_of: String, default: nil
attribute :image_verify, kind_of: String, default: nil
attribute :kernel_args, kind_of: String, default: nil
attribute :nomount, kind_of: String, default: nil
attribute :overlay, kind_of: String, default: nil
attribute :swap, kind_of: String, default: nil
attribute :swap_size, kind_of: String, default: nil
