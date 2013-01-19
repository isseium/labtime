class Work < ActiveRecord::Base
  attr_accessible :user_id, :work_time
  belongs_to :user
  has_many :likes #, :dependent => :destroy

end
