# frozen_string_literal: true

RSpec.describe RoleCall::ActorBase, type: :actor do
  include_context "with an example actor"

  it { is_expected.to inherit_from Spicerack::InputObject }

  it { is_expected.to include_module RoleCall::Actors::Permissions }
end
