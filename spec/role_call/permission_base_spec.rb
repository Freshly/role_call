# frozen_string_literal: true

RSpec.describe RoleCall::PermissionBase, type: :permission do
  include_context "with an example permission"

  it { is_expected.to inherit_from Spicerack::RootObject }

  it { is_expected.to include_module RoleCall::Permissions::Roles }

  describe ".key" do
    subject { example_permission_class.key }

    let(:root_name) { "FooBarBaz" }

    it { is_expected.to eq :foo_bar_baz }
  end
end
