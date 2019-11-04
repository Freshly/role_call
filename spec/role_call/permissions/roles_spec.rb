# frozen_string_literal: true

RSpec.describe RoleCall::Permissions::Roles, type: :concern do
  include_context "with an example permission"

  describe ".granted_to" do
    subject(:granted_to) { example_permission_class.granted_to role }

    let(:role) { double }

    it "tracks" do
      expect { granted_to }.to change { example_permission_class.roles }.from([]).to([ role ])
    end
  end

  describe ".inherited" do
    subject(:inherited_permission_class) { Class.new(example_permission_class) }

    before { example_permission_class.granted_to role }

    let(:role) { double }

    it "is not inherited" do
      expect(inherited_permission_class.roles).to eq []
      expect(example_permission_class.roles).to eq [ role ]
    end
  end
end
