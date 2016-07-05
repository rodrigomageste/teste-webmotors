class Make < ActiveRecord::Base
  URI_WEBMOTORS_BRANDS = URI('http://www.webmotors.com.br/carro/marcas')

  def self.create_entries_from_webmotors_api
    web_motors_response = Net::HTTP.post_form(URI_WEBMOTORS_BRANDS, {})
    car_brands = JSON.parse(web_motors_response.body)

    return if Make.count == car_brands.uniq.count

    car_brands.each do |brand|
      Make.find_or_create_by(name: brand["Nome"], webmotors_id: brand["Id"])
    end
  end
end
