class Like < ActiveRecord::Base
  attr_accessible :user_id, :work_id
  belongs_to :work
  belongs_to :user


end
