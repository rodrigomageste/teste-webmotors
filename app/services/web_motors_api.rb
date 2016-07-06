class WebMotorsAPI
  URI_WEBMOTORS_BRANDS = URI('http://www.webmotors.com.br/carro/marcas')
  URI_WEBMOTORS_MODELS = URI('http://www.webmotors.com.br/carro/modelos')

  def self.get_makes
    response = Net::HTTP.post_form(URI_WEBMOTORS_BRANDS, {})
    JSON.parse(response.body).uniq
  end

  def self.get_models_of(make)
    response = Net::HTTP.post_form(URI_WEBMOTORS_MODELS, { marca: make.webmotors_id })
    JSON.parse(response.body).uniq
  end
end