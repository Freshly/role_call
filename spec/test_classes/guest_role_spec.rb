# frozen_string_literal: true

RSpec.describe GuestRole, type: :role do
  it { is_expected.to inherit_from RoleCall::RoleBase }

  it { is_expected.to be_unpermitted }
end
