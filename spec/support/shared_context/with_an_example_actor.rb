# frozen_string_literal: true

RSpec.shared_context "with an example actor" do
  subject(:example_actor) { example_actor_class.new(roles: roles) }

  let(:example_actor_class) { Class.new(RoleCall::ActorBase) }

  let(:roles) { [] }

  let(:root_name) { Faker::Internet.domain_word.capitalize }
  let(:example_actor_name) { "#{root_name}Actor" }

  before { stub_const(example_actor_name, example_actor_class) }
end
