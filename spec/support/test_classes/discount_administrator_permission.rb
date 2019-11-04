# frozen_string_literal: true

# Allows access to create discounts with no limitations.
class DiscountAdministratorPermission < RoleCall::PermissionBase
  def self.key
    :unlimited_discounter
  end
end
