class AddInfectionReportToSurvivors < ActiveRecord::Migration[5.0]
  def change
    add_column :survivors, :infection_report, :integer, default: 0
  end
end
