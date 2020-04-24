module PullTrackCounts
  extend self

  def call(start_time:, end_time:, username:)
    Lastfm::Chart.new(from: start_time, to: end_time, user: username).get
  end
end
