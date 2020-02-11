# frozen_string_literal: true

RSpec.describe SuperAdminRole, type: :role do
  it { is_expected.to inherit_from AdminRole }

  it { is_expected.to grant_permissions AuthenticationPermission, AdministrativePermission, DoAnythingPermission }
end
