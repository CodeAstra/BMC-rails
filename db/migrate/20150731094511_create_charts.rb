class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.string :title
      t.text :description
      t.text :customer_segments
      t.text :value_propositions
      t.text :customer_relationships
      t.text :channels
      t.text :key_activities
      t.text :key_resources
      t.text :key_partnerships
      t.text :cost_structure
      t.text :revenue_streams
      t.references :owner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
