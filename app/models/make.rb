class Make < ActiveRecord::Base
  has_many :models

  def self.create_entries_from_webmotors_api
    makes_json = WebMotorsAPI.get_makes

    return if Make.count == makes_json.count

    makes_json.each do |make|
      Make.find_or_create_by(name: make["Nome"], webmotors_id: make["Id"])
    end
  end

  def create_models_from_webmotors_api
    models_json = WebMotorsAPI.get_models_of(self)

    return if models.count == models_json.count

    models_json.each do |model|
      models.find_or_create_by(name: model["Nome"])
    end
  end
end
