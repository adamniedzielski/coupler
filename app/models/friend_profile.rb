# frozen_string_literal: true

class FriendProfile < ApplicationRecord
  validates :name, :description, presence: true
  belongs_to :user

  has_many :outgoing_matches, class_name: "Match", foreign_key: :from_id,
                              dependent: :destroy, inverse_of: :from
  has_many :incoming_matches, class_name: "Match", foreign_key: :to_id,
                              dependent: :destroy, inverse_of: :to
end
