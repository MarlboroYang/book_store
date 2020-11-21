class CreateVoteLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :vote_logs do |t|
      t.references :book, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
