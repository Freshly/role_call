# frozen_string_literal: true

RSpec.describe DiscountManagerPermission, type: :permission do
  it { is_expected.to inherit_from RoleCall::PermissionBase }

  it { is_expected.to have_key :limited_discounter }

  it { is_expected.to be_granted_to MarketingManagerRole }
end
