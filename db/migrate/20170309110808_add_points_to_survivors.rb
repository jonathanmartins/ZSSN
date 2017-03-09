class AddPointsToSurvivors < ActiveRecord::Migration[5.0]
  def change
    add_column :survivors, :points, :integer, default: 0
  end
end
