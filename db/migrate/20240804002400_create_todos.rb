class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :text, null: false
      t.boolean :completed, default: false
      t.timestamps
    end
    
    add_index :todos, :completed
    add_index :todos, :created_at
  end
end