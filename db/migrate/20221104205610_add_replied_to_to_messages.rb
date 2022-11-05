class AddRepliedToToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :replied_to
    add_foreign_key :messages, :messages, column: :replied_to_id
  end
end
