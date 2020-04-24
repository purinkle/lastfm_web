class Tracks
  include ActiveModel::Model

  attr_accessor :start_time, :end_time, :username

  validates :start_time,
            :end_time,
            :username,
            presence: true

  def self.where(search_params)
    return [] unless search_params.present?

    new(search_params).where
  end

  def where
    PullTrackCounts.call(
      start_time: Time.parse(start_time),
      end_time: Time.parse(end_time),
      username: username
    )
  end
end
