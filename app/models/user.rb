# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friend_profiles, dependent: :destroy
  has_many :outgoing_connection_requests, class_name: "ConnectionRequest", foreign_key: :from_id
  has_many :incoming_connection_requests, class_name: "ConnectionRequest", foreign_key: :to_id
end
