# frozen_string_literal: true

class FriendProfile < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user
end
