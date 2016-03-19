class AddUrlsToLink < ActiveRecord::Migration
  def change
    add_column :links, :short_url, :string
    add_column :links, :actual_url, :string
  end
end
