# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :from, class_name: "FriendProfile"
  belongs_to :to, class_name: "FriendProfile"
end
