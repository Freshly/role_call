# frozen_string_literal: true

RSpec.describe RoleCall::Actor, type: :concern do
  include_context "with an example actor"

  it { is_expected.to include_module ShortCircuIt }

  describe "#roles" do
    subject { example_actor.roles }

    context "with role" do
      before { allow(example_actor).to receive(:role).and_return(role) }

      context "when nil" do
        let(:role) { nil }

        it { is_expected.to eq [] }
      end

      context "when present" do
        let(:role) { double }

        it { is_expected.to eq [ role ] }
      end
    end

    context "without role" do
      it { is_expected.to eq [] }
    end
  end

  describe "#permissions" do
    include_context "with roles and permissions"

    subject { example_actor.permissions }

    before { allow(example_actor).to receive(:roles).and_return(roles) }

    context "with no roles" do
      let(:roles) { [] }

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

    subject { example_actor.__send__(:permissions_map) }

    before { allow(example_actor).to receive(:roles).and_return(roles) }

    let(:roles) { [ role0, role1 ] }
    let(:expected_hash) do
      Hash[permission0.key, permission0, permission1.key, permission1, permission2.key, permission2]
    end

    it { is_expected.to eq expected_hash }
  end

  describe "#permitted_to?" do
    include_context "with roles and permissions"

    subject { example_actor.permitted_to?(object) }

    let(:roles) { role0 }

    before { allow(example_actor).to receive(:roles).and_return(roles) }

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

      context "with something responding to key" do
        let(:object) { double(key: permission0.key) }

        it { is_expected.to eq true }
      end
    end
  end
end
