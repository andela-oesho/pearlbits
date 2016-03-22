class RenamePopularityScoreToVisits < ActiveRecord::Migration
  def change
  	rename_column :links, :popularity_score, :visits
  end
end
