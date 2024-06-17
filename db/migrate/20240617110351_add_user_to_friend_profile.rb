# frozen_string_literal: true

class AddUserToFriendProfile < ActiveRecord::Migration[7.1]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :friend_profiles, :user, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
