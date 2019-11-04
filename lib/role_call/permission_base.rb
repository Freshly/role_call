# frozen_string_literal: true

require_relative "permissions/roles"

# A **Permission** are the "keys" that are accumulated across the **Roles** of an **Actor**.
module RoleCall
  class PermissionBase < Spicerack::RootObject
    include RoleCall::Permissions::Roles

    def self.key
      name.chomp("Permission").underscore.to_sym
    end
  end
end
