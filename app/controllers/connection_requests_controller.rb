# frozen_string_literal: true

class ConnectionRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    ConnectionRequest.create!(from: current_user, to: User.find(params.fetch(:user_id)))
    redirect_to users_url, notice: "Connection request was sent"
  end
end
