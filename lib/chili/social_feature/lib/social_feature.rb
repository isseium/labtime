require "chili"
require "social_feature/engine"

module SocialFeature
  extend Chili::Base
  active_if { current_user? } # edit this to activate/deactivate feature at runtime
end
