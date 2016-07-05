class Make < ActiveRecord::Base
  has_many :models

  URI_WEBMOTORS_BRANDS = URI('http://www.webmotors.com.br/carro/marcas')

  def self.create_entries_from_webmotors_api
    web_motors_response = Net::HTTP.post_form(URI_WEBMOTORS_BRANDS, {})
    car_brands = JSON.parse(web_motors_response.body)

    return if Make.count == car_brands.uniq.count

    car_brands.each do |brand|
      Make.find_or_create_by(name: brand["Nome"], webmotors_id: brand["Id"])
    end
  end

  def create_models_from_webmotors_api
    response = Net::HTTP.post_form(Model::URI_WEBMOTORS_MODELS, { marca: webmotors_id })
    models_json = JSON.parse response.body

    return if models.count == models_json.uniq.count

    models_json.each do |model|
      models.find_or_create_by(name: model["Nome"])
    end
  end
end
