class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :identity_id
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    add_index :users, :identity_id, unique: true
  end
end
