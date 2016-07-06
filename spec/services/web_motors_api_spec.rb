require 'rails_helper'

RSpec.describe WebMotorsAPI do
  subject { WebMotorsAPI }

  describe '.get_makes' do
    it 'return an array of hashs' do
      expect(subject.get_makes.count).to eq(178)
    end
  end

  describe '.get_models_of' do
    let(:make) { Make.create(name: "CHEVROLET", webmotors_id: 2) }

    it 'return an array of hashs' do
      expect(subject.get_models_of(make).count).to eq(93)
    end
  end
end