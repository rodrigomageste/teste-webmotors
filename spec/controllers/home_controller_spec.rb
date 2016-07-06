require 'rails_helper'

RSpec.describe HomeController do
  describe 'GET index' do
    it 'saves all car brands at webmotors API' do
      get :index

      brands_json = JSON.parse Net::HTTP.post_form(WebMotorsAPI::URI_WEBMOTORS_BRANDS, {}).body
      brands_names = brands_json.map { |brand| brand["Nome"] }.uniq

      expect(assigns[:makes].count).to eq(brands_names.count)
      expect(response).to have_http_status :ok
    end
  end
end