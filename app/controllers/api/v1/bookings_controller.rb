class Api::V1::BookingsController < ApplicationController
  before_action :requires_login, only: [:index, :create]

  def index
    user = the_current_user
    @bookings = Booking.where(user_id: user.id)
    render json: @bookings
  end

  def create
    user = the_current_user
    @new_booking = Booking.new(booking_params)
    @new_booking.user_id = user.id
    workspaceBookings = Booking.where(workspace_id: params["booking"]["workspace_id"])

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
      render json: {booking: @new_booking, message: "Your booking is confirmed!"}
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:workspace_id, :start_time, :end_time)
  end
end
