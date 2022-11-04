class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user
    add_foreign_key :articles, :users
  end
end
