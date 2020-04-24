require 'rails_helper'

RSpec.describe TracksController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'return http success when given search parameters' do
      start_time = DateTime.new(2020, 1, 1)
      end_time = DateTime.new(2020, 1, 15)
      username = "purinkle"

      allow(PullTrackCounts).to receive(:call).and_return([])

      get :index, params: { q: {
        start_time: start_time.iso8601,
        end_time: end_time.iso8601,
        username: username
      } }

      expect(PullTrackCounts).to have_received(:call).with(start_time: start_time, end_time: end_time, username: username)
      expect(response).to have_http_status(:success)
    end
  end

end
