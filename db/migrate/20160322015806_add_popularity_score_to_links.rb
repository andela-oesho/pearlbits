class AddPopularityScoreToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :popularity_score, :integer, default: 0
  end
end
