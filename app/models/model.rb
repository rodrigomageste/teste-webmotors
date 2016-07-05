class Model < ActiveRecord::Base
  belongs_to :make

  URI_WEBMOTORS_MODELS = URI('http://www.webmotors.com.br/carro/modelos')
end
