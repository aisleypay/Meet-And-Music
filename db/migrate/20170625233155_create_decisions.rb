class CreateDecisions < ActiveRecord::Migration[5.1]
  def change
    create_table :decisions do |t|
      t.boolean :status
      t.integer :decider_id
      t.integer :chosen_id

      t.timestamps
    end
  end
end
