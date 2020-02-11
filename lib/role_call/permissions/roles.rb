# frozen_string_literal: true

# A **Permission** is granted to various **Roles** to authorize **Actors** to perform actions.
module RoleCall
  module Permissions
    module Roles
      extend ActiveSupport::Concern

      included do
        class_attribute :roles, instance_writer: false, default: []
      end

      class_methods do
        def inherited(base)
          base.roles = []
          super
        end

        def granted_to(role)
          roles << role
        end
      end
    end
  end
end
