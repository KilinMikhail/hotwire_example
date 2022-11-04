class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribtions do |t|
      t.references :recepient, null: false, foreign_key: { to_table: :users }
      t.references :subscriber, null: false, foreign_key: { to_table: :users }
    end
  end
end
