class RenameCountsToVisits < ActiveRecord::Migration
  def change
  	rename_column :links, :count, :visits
  end
end
