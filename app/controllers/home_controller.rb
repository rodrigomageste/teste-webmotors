class HomeController < ApplicationController
  def index
    Make.create_entries_from_webmotors_api
  end
end
