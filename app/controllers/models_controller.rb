class ModelsController < ApplicationController
  def index
    make = Make.find_by(webmotors_id: params[:webmotors_make_id])
    make.create_models_from_webmotors_api
  end
end
