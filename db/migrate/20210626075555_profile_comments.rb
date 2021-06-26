class ProfileComments < ActiveRecord::Migration[5.2]
  def change
    drop_table :profile_comments
  end
end
