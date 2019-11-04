# frozen_string_literal: true

# Allows access to create discounts with limitations.
class DiscountManagerPermission < RoleCall::PermissionBase
  def self.key
    :limited_discounter
  end
end
