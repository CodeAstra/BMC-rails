class CreateChartVersions < ActiveRecord::Migration
  def change
    create_table :chart_versions do |t|
      t.references :chart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
