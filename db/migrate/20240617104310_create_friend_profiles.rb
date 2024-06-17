# frozen_string_literal: true

class CreateFriendProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_profiles do |t|
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
