# frozen_string_literal: true

# RSpec matcher that tests the key of a permissions.
#
#     class ExamplePermission < ApplicationPermission
#     end
#
#     RSpec.describe ExamplePermission, type: :permission do
#       it { is_expected.to have_default_key }
#     end
#

RSpec::Matchers.define :have_default_key do
  match { expect(test_subject.key).to eq test_subject.name.chomp("Permission").underscore.to_sym }
  description { "have default key" }
  failure_message { "expected #{test_subject} to have default key but had `#{test_subject.key}' instead." }
  failure_message_when_negated { "expected #{test_subject} not to have default key but did." }

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
