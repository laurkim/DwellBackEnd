class Api::V1::BookingsController < ApplicationController
  before_action :requires_login, only: [:create]

  def create
    user_id = decode_token
    @new_booking = Booking.new(user_id: user_id, workspace_id: params["workspaceId"], start_time: params["startTime"], end_time: params["endTime"])
    workspaceBookings = Booking.where(workspace_id: params["workspaceId"])

    # Iterate over each existing booking where the workspace id matches the one coming from the client
    # If there is an overlap of start and/or end time for the new booking the client is trying to create,
    # The new booking will not be created and return an error message
    workspaceBookings.each do |booking|
      if (@new_booking.start_time...@new_booking.end_time).overlaps?(booking.start_time...booking.end_time)
        render json: {message: "Time slot already booked"} and return
      end
    end

    # If there are no overlaps over all existing bookings, persist the new booking and render it to the client
    if @new_booking.save
      render json: @new_booking
    end
  end

  private

  def booking_params
  end
end
