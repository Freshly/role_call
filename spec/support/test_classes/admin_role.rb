# frozen_string_literal: true

# General System Administrator
class AdminRole < RoleCall::RoleBase
  grant AdministrativePermission, AuthenticationPermission
end
