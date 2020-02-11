# frozen_string_literal: true

# RSpec matcher that tests grants of permissions to roles.
#
#     class ExamplePermission < ApplicationPermission
#     end
#
#     class ExampleRole < ApplicationRole
#       grants ExamplePermission
#     end
#
#     RSpec.describe ExampleRole, type: :role do
#       it { is_expected.to grant_permissions ExamplePermission }
#     end

RSpec::Matchers.define :grant_permissions do |*permissions|
  match { expect(test_subject.permissions).to include *Array.wrap(permissions).flatten }
  description { "have permissions #{Array.wrap(permissions).flatten}" }
  failure_message do
    "expected #{test_subject} to have permissions #{Array.wrap(permissions).flatten}; #{test_subject.permissions}"
  end
  failure_message_when_negated do
    "expected #{test_subject} not to have permissions #{Array.wrap(permissions).flatten}; #{test_subject.permissions}"
  end

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
