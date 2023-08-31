class AddTimerToTest < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :timer_in_sec, :integer
  end
end
