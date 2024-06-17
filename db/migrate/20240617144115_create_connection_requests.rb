class CreateConnectionRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :connection_requests do |t|
      t.references :from, null: false, foreign_key: {to_table: :users}
      t.references :to, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
