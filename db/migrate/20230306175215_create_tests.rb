class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null:false, default: 0
      t.integer :category_id
      t.integer :author_id

      t.timestamps
    end

    add_foreign_key :tests, :categories
    add_foreign_key :tests, :users, column: :author_id
  end
end
