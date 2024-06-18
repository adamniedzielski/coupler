# frozen_string_literal: true

class ConnectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    connection_request = current_user.incoming_connection_requests.find(params.fetch(:connection_request_id))
    Connection.create!(from: connection_request.from, to: connection_request.to)
    Connection.create!(from: connection_request.to, to: connection_request.from)
    redirect_to users_url, notice: "You are now connected"
  end
end
