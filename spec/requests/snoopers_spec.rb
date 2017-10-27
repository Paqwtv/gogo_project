require 'rails_helper'

RSpec.describe "Snoopers", type: :request do
  describe "GET /snoopers" do
    it "works! (now write some real specs)" do
      get snoopers_path
      expect(response).to have_http_status(200)
    end
  end
end
