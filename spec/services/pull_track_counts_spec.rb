require 'rails_helper'

RSpec.describe PullTrackCounts do
  describe '#call' do
    it 'return list of tracks with details' do
      start_time = DateTime.new(2020, 1, 1)
      end_time = DateTime.new(2020, 1, 15)
      username = "purinkle"
      allow(Lastfm::Chart).to receive(:new).and_return(chart_response)

      expected_result = chart_response.get

      expect(PullTrackCounts.call(start_time: start_time, end_time: end_time, username: username)).to eq(expected_result)
      expect(Lastfm::Chart).to have_received(:new).with(from: start_time, to: end_time, user: username)
    end
  end

  private

  def chart_response
    @_chart_response ||= double(:chart, get: [
      double(:entry, artist_name: 'Artist 1', track_name: 'Track 1', play_count: rand(10)),
      double(:entry, artist_name: 'Artist 2', track_name: 'Track 4', play_count: rand(10)),
      double(:entry, artist_name: 'Artist 3', track_name: 'Track 3', play_count: rand(10)),
      double(:entry, artist_name: 'Artist 4', track_name: 'Track 2', play_count: rand(10)),
    ])
  end
end
