class CreateRaces < ActiveRecord::Migration
  def change
    create_table :races do |t|
      t.string   :title
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps null: false
    end

    add_column :candidates, :race_id, :integer
  end
end
