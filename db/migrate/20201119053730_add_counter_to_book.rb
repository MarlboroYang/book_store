class AddCounterToBook < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :vote_logs_count, :integer
  end
end
