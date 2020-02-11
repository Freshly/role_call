# frozen_string_literal: true

# RSpec matcher that tests the key of a permissions.
#
#     class ExamplePermission < ApplicationPermission
#       def self.key
#         :something_nonstandard
#       end
#     end
#
#     RSpec.describe ExamplePermission, type: :permission do
#       it { is_expected.to have_key :something_nonstandard }
#     end
#

RSpec::Matchers.define :have_key do |expected_key|
  match { expect(test_subject.key).to eq expected_key }
  description { "have key #{expected_key}" }
  failure_message do
    "expected #{test_subject} to have key `#{expected_key}' but had `#{test_subject.key}' instead."
  end
  failure_message_when_negated { "expected #{test_subject} not to have key `#{expected_key}' but did." }

  def test_subject
    subject.is_a?(Class) ? subject : subject.class
  end
end
