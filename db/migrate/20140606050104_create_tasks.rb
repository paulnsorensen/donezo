class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :user_id
      t.integer :team_id
      t.datetime :done_at
      t.text :description

      t.timestamps
    end

    add_index :tasks, :user_id
    add_index :tasks, :team_id
    add_index :tasks :done_at
  end
end
