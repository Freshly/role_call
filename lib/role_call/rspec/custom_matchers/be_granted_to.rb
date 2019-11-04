# frozen_string_literal: true

# RSpec matcher that tests references of roles to permissions.
#
#     class ExamplePermission < ApplicationPermission
#     end
#
#     class ExampleRole < ApplicationRole
#       grants ExamplePermission
#     end
#
#     RSpec.describe ExamplePermission, type: :permission do
#       it { is_expected.to be_granted_to ExampleRole }
#     end

RSpec::Matchers.define :be_granted_to do |*roles|
  match { expect(test_subject.roles).to include *Array.wrap(roles).flatten }
  description { "include roles #{Array.wrap(roles).flatten}" }
  failure_message do
    "expected #{test_subject} to include roles #{Array.wrap(roles).flatten}; #{test_subject.roles}"
  end
  failure_message_when_negated do
    "expected #{test_subject} not to include roles #{Array.wrap(roles).flatten}; #{test_subject.roles}"
  end

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
