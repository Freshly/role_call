# frozen_string_literal: true

require_relative "roles/permissions"

# A **Role** is authorized to take actions by virtue of having the appropriate **Permissions**.
module RoleCall
  class RoleBase < Spicerack::RootObject
    include RoleCall::Roles::Permissions
  end
end
