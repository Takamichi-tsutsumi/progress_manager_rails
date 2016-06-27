class CreateProgresses < ActiveRecord::Migration[5.0]
  def change
    create_table :progresses do |t|
      t.integer :status, null: false, default: 0
      t.text    :note
      t.integer :resource_id
      t.integer :user_id

      t.timestamps
    end

    add_index :progresses, :resource_id
    add_index :progresses, :user_id
    add_index :progresses, :status
  end
end
