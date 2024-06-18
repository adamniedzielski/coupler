# frozen_string_literal: true

class MatchesController < ApplicationController
  before_action :authenticate_user!

  def create
    from_friend_profile = current_user.friend_profiles.find(params.fetch(:friend_profile_id))
    to_friend_profile = current_user.accessible_friend_profiles.find(params.fetch(:to_friend_profile_id))

    Match.create!(from: from_friend_profile, to: to_friend_profile)

    redirect_to from_friend_profile, notice: "Match created"
  end
end
