# frozen_string_literal: true

RSpec.shared_context "with an example permission" do
  subject(:example_permission_class) { Class.new(RoleCall::PermissionBase) }

  let(:root_name) { Faker::Internet.domain_word.capitalize }
  let(:example_permission_name) { "#{root_name}Permission" }

  before { stub_const(example_permission_name, example_permission_class) }
end
