class CreateChartSubscriptions < ActiveRecord::Migration
  def change
    create_table :chart_subscriptions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :chart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
