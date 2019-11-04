# frozen_string_literal: true

# Signed In User Access
class UserRole < RoleCall::RoleBase
  grant AuthenticationPermission, OwnerPermission
end
