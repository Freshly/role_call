# frozen_string_literal: true

# A **Role** is a collection of granted **Permissions**.
module RoleCall
  module Roles
    module Permissions
      extend ActiveSupport::Concern

      included do
        class_attribute :permissions, instance_writer: false, default: []
        delegate :unpermitted?, to: :class
      end

      class_methods do
        def unpermitted?
          permissions.blank?
        end

        def inherited(base)
          base.permissions = permissions.dup
          super
        end

        private

        def grant(*permission_grants)
          permission_grants = permission_grants.flatten.compact

          ensure_valid_permissions(permission_grants)

          permission_grants.each do |permission|
            permissions << permission
            track_permission(permission)
          end
        end

        def track_permission(permission)
          permission.granted_to(self)
        end

        def ensure_valid_permissions(permission_grants)
          raise ArgumentError, "a permission is required" if permission_grants.empty?

          invalid_permissions = permission_grants.reject { |permission| permission.respond_to?(:granted_to) }
          raise ArgumentError, "invalid permissions: #{invalid_permissions.join(", ")}" if invalid_permissions.present?
        end
      end
    end
  end
end
