class AddCanvasDetailsToChartVersions < ActiveRecord::Migration
  def change
    add_column :chart_versions, :title, :string
    add_column :chart_versions, :description, :text
    add_column :chart_versions, :customer_segments, :text
    add_column :chart_versions, :value_propositions, :text
    add_column :chart_versions, :customer_relationships, :text
    add_column :chart_versions, :channels, :text
    add_column :chart_versions, :key_activities, :text
    add_column :chart_versions, :key_resources, :text
    add_column :chart_versions, :key_partnerships, :text
    add_column :chart_versions, :cost_structure, :text
    add_column :chart_versions, :revenue_streams, :text
  end
end
