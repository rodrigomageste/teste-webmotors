require 'rails_helper'

RSpec.describe ModelsController do
  describe 'GET index', :vcr do
    let(:uri) { URI("http://www.webmotors.com.br/carro/modelos") }
    let(:make) { Make.create(name: "CHEVROLET", webmotors_id: 2) }

    it 'create models for a make' do
      get :index, webmotors_make_id: make.webmotors_id

      webmotors_response = Net::HTTP.post_form(uri, { marca: make.webmotors_id })
      models_json = JSON.parse webmotors_response.body

      expect(assigns[:models].count).to eq(models_json.count)
      expect(response).to have_http_status(:ok)
    end
  end
end