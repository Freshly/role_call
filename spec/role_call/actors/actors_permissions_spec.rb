# frozen_string_literal: true

RSpec.describe RoleCall::Actors::Permissions, type: :concern do
  include_context "with an example actor"

  it { is_expected.to define_argument :roles, allow_nil: false }

  describe "#permissions" do
    include_context "with roles and permissions"

    subject { example_actor.permissions }

    context "with no roles" do
      it { is_expected.to eq [] }
    end

    context "with one role" do
      let(:roles) { role0 }

      it { is_expected.to match_array [ permission0, permission1 ] }
    end

    context "with many roles" do
      let(:roles) { [ role0, role1 ] }

      it { is_expected.to match_array [ permission0, permission1, permission2 ] }
    end
  end

  describe "#permissions_map" do
    include_context "with roles and permissions"

    let(:roles) { [ role0, role1 ] }

    subject { example_actor.permissions_map }

    let(:expected_hash) do
      Hash[permission0.key, permission0, permission1.key, permission1, permission2.key, permission2]
    end

    it { is_expected.to eq expected_hash }
  end

  describe "#permitted_to?" do
    include_context "with roles and permissions"

    subject { example_actor.permitted_to?(object) }

    let(:roles) { role0 }

    context "without permission" do
      context "when class" do
        let(:object) { permission2 }

        it { is_expected.to eq false }
      end

      context "when key" do
        let(:object) { permission2.key }

        it { is_expected.to eq false }
      end

      context "when regulation" do
        let(:object) { double(key: permission2.key) }

        it { is_expected.to eq false }
      end
    end

    context "with permission" do
      context "when class" do
        let(:object) { permission0 }

        it { is_expected.to eq true }
      end

      context "when key" do
        let(:object) { permission0.key }

        it { is_expected.to eq true }
      end

      context "when regulation" do
        let(:object) { double(key: permission0.key) }

        it { is_expected.to eq true }
      end
    end
  end
end
