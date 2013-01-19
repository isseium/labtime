class ChangeColumn < ActiveRecord::Migration
  def change
  	rename_column :likes, :user_id, :user_id_old
  	rename_column :likes, :work_id, :work_id_old

  	add_column :likes, :user_id, :integer
  	add_column :likes, :work_id, :integer

  end
end
