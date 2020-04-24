class TracksController < ApplicationController
  def index
    @track_counts = Tracks.where(search_params)
  end

  private

  def search_params
    params.fetch(:q, ActionController::Parameters.new).permit(
      :start_time,
      :end_time,
      :username
    )
  end
end
