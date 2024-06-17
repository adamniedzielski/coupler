# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id)

    @outgoing_connection_requests = current_user.outgoing_connection_requests
  end
end
