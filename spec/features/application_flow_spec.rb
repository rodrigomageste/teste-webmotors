require 'rails_helper'

RSpec.feature 'Application flow' do
  describe 'show all models when choose one make and click in button', :vcr do
    it 'success' do
      visit root_path
      select('CHEVROLET', from: 'Escolha a Fabricante:')
      click_button 'Buscar modelos'

      expect(page).to have_content('ASTRA')
      expect(page).not_to have_content('FIESTA')
    end
  end
end