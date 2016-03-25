class AddVanityColumnToLink < ActiveRecord::Migration
  def change
  	add_column :links, :vanity, :string
  end
end
