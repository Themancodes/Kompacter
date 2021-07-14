class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.belongs_to :link, foreign_key: true
      t.belongs_to :visitor, foreign_key: true
      t.integer :counter, default: 1

      t.timestamps
    end
  end
end
