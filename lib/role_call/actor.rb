# frozen_string_literal: true

module RoleCall
  module Actor
    extend ActiveSupport::Concern

    included do
      include ShortCircuIt

      memoize :roles
      memoize :permissions
      memoize :permissions_map
    end

    def permitted_to?(object)
      permissions_map.key?(object.try(:key)) || permissions_map.key?(object) || permissions.include?(object)
    end

    def permissions
      Array.wrap(roles).map(&:permissions).flatten.uniq
    end

    def roles
      []
    end

    private

    def permissions_map
      permissions.index_by(&:key)
    end
  end
end
