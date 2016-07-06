require 'rails_helper'

RSpec.describe Make do
  describe 'associations' do
    it { is_expected.to have_many(:models) }
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to validate_uniqueness_of(:webmotors_id) }
  end

  describe '.create_entries_from_webmotors_api' do
    it 'not run find_or_create_by if all brands already are created' do
      expect(Make).to receive(:count) { 178 }
      expect(Make).not_to receive(:find_or_create_by)
      Make.create_entries_from_webmotors_api
    end

    it 'create car brands if database is empty' do
      Make.create_entries_from_webmotors_api
      expect(Make.count).to eq(178)
    end
  end

  describe '#create_models_from_webmotors_api' do
    let(:make) { Make.create(name: "CHEVROLET", webmotors_id: 2) }

    it 'not run find_or_create_by if all models already are created' do
      expect(make.models).to receive(:count) { 93 }
      expect(make.models).not_to receive(:find_or_create_by)
      make.create_models_from_webmotors_api
    end

    it 'create all models belongs to a make id database is empty' do
      make.create_models_from_webmotors_api
      expect(make.models.count).to eq(93)
    end
  end
end