class AddColumnsToStatistics < ActiveRecord::Migration
  def change
    add_column :statistics, :ip_address, :string
    add_column  :statistics, :browser_information, :string
    add_column  :statistics, :referer, :string
    add_column  :statistics, :link_id, :integer
  end
end
