class AddIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :introduction, :text, :user_id
  end
end
