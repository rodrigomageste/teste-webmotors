require 'rails_helper'

RSpec.describe Model do
  describe 'associations' do
    it { is_expected.to belong_to(:make) }
  end
end