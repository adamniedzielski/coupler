# frozen_string_literal: true

class FriendProfile < ApplicationRecord
  validates :name, :description, presence: true
end
