# frozen_string_literal: true

RSpec.shared_context "with roles and permissions" do
  let(:root_name) { Faker::Internet.domain_word.capitalize }

  let(:regulation0_name) { "#{root_name}xPermission" }
  let(:regulation1_name) { "#{root_name}yPermission" }
  let(:regulation2_name) { "#{root_name}zPermission" }

  let(:permission0) { Class.new(RoleCall::PermissionBase) }
  let(:permission1) { Class.new(RoleCall::PermissionBase) }
  let(:permission2) { Class.new(RoleCall::PermissionBase) }

  let(:role0) do
    Class.new(RoleCall::RoleBase).tap { |klass| klass.__send__(:grant, permission0, permission1) }
  end
  let(:role1) do
    Class.new(RoleCall::RoleBase).tap { |klass| klass.__send__(:grant, permission1, permission2) }
  end

  before do
    stub_const(permission0_name, permission0)
    stub_const(permission1_name, permission1)
    stub_const(permission2_name, permission2)
  end
end

# frozen_string_literal: true

RSpec.shared_context "with statutes and regulations" do
  include_context "with lock and key names"
  let(:root_name) { Faker::Internet.domain_word.capitalize }

  let(:regulation0_name) { "#{root_name}xRegulation" }
  let(:regulation1_name) { "#{root_name}yRegulation" }
  let(:regulation2_name) { "#{root_name}zRegulation" }

  let(:regulation0) { Class.new(Law::RegulationBase) }
  let(:regulation1) { Class.new(Law::RegulationBase) }
  let(:regulation2) { Class.new(Law::RegulationBase) }
  let(:statute0) do
    Class.new(Law::StatuteBase).tap { |klass| klass.__send__(:impose, regulation0, regulation1) }
  end
  let(:statute1) do
    Class.new(Law::StatuteBase).tap { |klass| klass.__send__(:impose, regulation1, regulation2) }
  end
  before do
    stub_const(regulation0_name, regulation0)
    stub_const(regulation1_name, regulation1)
    stub_const(regulation2_name, regulation2)
  end
end
