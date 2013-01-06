module SocialFeature
  class Like < ActiveRecord::Base
    belongs_to :work
    attr_accessible :work_id
  end
end
