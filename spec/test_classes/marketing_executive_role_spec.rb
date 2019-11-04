# frozen_string_literal: true

RSpec.describe MarketingExecutiveRole, type: :role do
  it { is_expected.to inherit_from AdminRole }

  it { is_expected.to grant_permissions DiscountAdministratorPermission }
end
