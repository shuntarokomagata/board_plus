class AddUserIdToMyThreads < ActiveRecord::Migration[5.2]
  def change
    add_column :my_threads, :user_id, :integer
  end
end
