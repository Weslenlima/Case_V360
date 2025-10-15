class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :list, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :parent_id
      t.string :title, null: false
      t.text :description
      t.datetime :due_date
      t.datetime :completed_at
      t.boolean :completed, default: false, null: false
      t.integer :position
      t.integer :priority


      t.timestamps
    end


    add_index :tasks, :parent_id
    add_foreign_key :tasks, :tasks, column: :parent_id
  end
end