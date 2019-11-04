# frozen_string_literal: true

require_relative "actors/permissions"

# An **Actor** has a collection of **Permissions** granted to it by **Roles**.
module RoleCall
  class ActorBase < Spicerack::InputObject
    include RoleCall::Actors::Permissions
  end
end
