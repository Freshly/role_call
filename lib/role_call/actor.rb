# frozen_string_literal: true

module RoleCall
  module Actor
    extend ActiveSupport::Concern

    included do
      include ShortCircuIt

      memoize :permissions
      memoize :permission_classes
      memoize :permissions_map
    end

    def permitted_to?(object)
      permissions_map.key?(object.try(:key)) || permissions_map.key?(object) || permissions.include?(object)
    end

    def permissions
      permission_classes.map(&:key).uniq
    end

    def roles
      [ try(:role) ].compact
    end

    private

    def permission_classes
      Array.wrap(roles).map(&:permissions).flatten
    end

    def permissions_map
      permission_classes.index_by(&:key)
    end
  end
end
