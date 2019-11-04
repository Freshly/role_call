# frozen_string_literal: true

# Root Access
class SuperAdminRole < AdminRole
  grant DoAnythingPermission
end
