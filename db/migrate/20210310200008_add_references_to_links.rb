class AddReferencesToLinks < ActiveRecord::Migration[6.1]
  def change
    # add_reference :links, :user, foreign_key: true
    add_column :links, :user_id, :integer, null: false
    add_index :links, :user_id
  end
end
