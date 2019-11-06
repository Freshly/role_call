# frozen_string_literal: true

module RoleCall
  module Actor
    extend ActiveSupport::Concern

    included do
      include ShortCircuIt

      memoize :permissions
      memoize :permissions_map
    end

    def permitted_to?(object)
      permissions_map.key?(object.try(:key)) || permissions_map.key?(object) || permissions.include?(object)
    end

    def permissions
      Array.wrap(try(:roles)).map(&:permissions).flatten.uniq
    end

    private

    def permissions_map
      permissions.index_by(&:key)
    end
  end
end
