require 'rails_helper'

RSpec.describe Make do
  describe 'associations' do
    it { is_expected.to have_many(:models) }
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
end