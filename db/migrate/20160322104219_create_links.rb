class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string  :short_url
      t.string   :actual_url
      t.boolean :active, default: true
      t.boolean :deleted, default: false
      t.integer :count, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
