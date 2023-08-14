class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_rules do |t|
      t.string :title, null: false

      t.timestamps
    end

    create_table :badges do |t|
      t.string :title, null: false
      t.string :rule_params, null: false
      t.string :url, null: false
      t.references :badge_rule, null: false

      t.timestamps
    end

    create_table :user_badges do |t|
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end

    add_column :results, :is_passed, :boolean, default: false
  end
end
