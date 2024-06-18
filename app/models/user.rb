# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_profiles, dependent: :destroy
  has_many :outgoing_connection_requests, class_name: "ConnectionRequest", foreign_key: :from_id,
                                          dependent: :destroy, inverse_of: :from
  has_many :incoming_connection_requests, class_name: "ConnectionRequest", foreign_key: :to_id,
                                          dependent: :destroy, inverse_of: :to
  has_many :connections, foreign_key: :from_id, dependent: :destroy, inverse_of: :from
  has_many :connected_users, through: :connections, source: :to
  has_many :accessible_friend_profiles, through: :connected_users, source: :friend_profiles
end
