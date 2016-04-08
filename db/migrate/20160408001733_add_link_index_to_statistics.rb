class AddLinkIndexToStatistics < ActiveRecord::Migration
  def change
      add_index :statistics, :link_id
  end
end
