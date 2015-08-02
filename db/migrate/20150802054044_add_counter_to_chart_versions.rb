class AddCounterToChartVersions < ActiveRecord::Migration
  def change
    add_column :chart_versions, :counter, :integer
  end
end
