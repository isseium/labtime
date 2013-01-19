class ChangeColumn < ActiveRecord::Migration
  def change
  	change_column :likes, :user_id, :integer
  	change_column :likes, :work_id, :integer
  end
end
