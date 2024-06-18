# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.references :from, null: false, foreign_key: { to_table: :friend_profiles }
      t.references :to, null: false, foreign_key: { to_table: :friend_profiles }

      t.timestamps
    end
  end
end
