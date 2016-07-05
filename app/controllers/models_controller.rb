class ModelsController < ApplicationController
  def index
    make = Make.find_by(webmotors_id: params[:webmotors_make_id])

    response = Net::HTTP.post_form(Model::URI_WEBMOTORS_MODELS, { marca: make.webmotors_id })
    models_json = JSON.parse response.body

    # Itera no resultado e grava os modelos que ainda não estão persistidas
    models_json.each do |json|
      if Model.where(name: json["Nome"], make_id: make.id).size == 0
        Model.create(make_id: make.id, name: json["Nome"])
      end
    end
  end
end
