class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :voter, index: true
      t.references :candidate, index: true
      t.references :race, index: true

      t.timestamps null: false
    end
    add_foreign_key :votes, :voters
    add_foreign_key :votes, :candidates
    add_foreign_key :votes, :races
  end
end
