class Work < ActiveRecord::Base
  attr_accessible :user_id, :work_time
  belongs_to :user
end
