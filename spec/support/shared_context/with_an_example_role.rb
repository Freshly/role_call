# frozen_string_literal: true

RSpec.shared_context "with an example role" do
  subject(:example_role) { example_role_class.new }

  let(:example_role_class) { Class.new(RoleCall::RoleBase) }

  let(:root_name) { Faker::Internet.domain_word.capitalize }
  let(:example_role_name) { "#{root_name}Role" }

  before { stub_const(example_role_name, example_role_class) }
end
