class HomeController < ApplicationController
  def index
    # Make request for Webmotors site
    response = Net::HTTP.post_form(Make::URI_WEBMOTORS_BRANDS, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |make_params|
      if Make.where(name: make_params["Nome"]).size == 0
        Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
      end
    end
  end
end
