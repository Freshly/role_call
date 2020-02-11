# frozen_string_literal: true

RSpec.shared_context "with an example actor" do
  subject(:example_actor) { example_actor_class.new }

  let(:example_actor_class) do
    Class.new.tap { |klass| klass.include RoleCall::Actor }
  end

  let(:example_actor_name) { Faker::Internet.domain_word.capitalize }

  before { stub_const(example_actor_name, example_actor_class) }
end
