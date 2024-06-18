# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    users = User.where.not(id: current_user.id)

    outgoing_connection_requests = current_user.outgoing_connection_requests.to_a
    incoming_connection_requests = current_user.incoming_connection_requests.to_a
    connections = current_user.connections.to_a

    @users_with_connections = users.map do |user|
      attach_connections(user, outgoing_connection_requests, incoming_connection_requests, connections)
    end
  end

  private

  def attach_connections(user, outgoing_connection_requests, incoming_connection_requests, connections)
    outgoing = outgoing_connection_requests.find do |connection_request|
      connection_request.to == user
    end

    connection = connections.find do |conn|
      conn.to == user
    end

    incoming = incoming_connection_requests.find do |connection_request|
      connection_request.from == user
    end

    [user, connection, incoming, outgoing]
  end
end
