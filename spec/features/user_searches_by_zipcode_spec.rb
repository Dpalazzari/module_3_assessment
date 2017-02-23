require 'rails_helper'

RSpec.describe 'User' do 
  context 'Searches for best buy stores 25 miles within entered zip' do
    it 'returns 16 total results, but loads ten on the page' do
      VCR.use_cassette('user_searches_by_zip') do
        visit root_path

        fill_in :q, with: '80202'
        click_on 'Find Stores'

        expect(current_path).to eq(search_path)
        expect(page).to have_content("16 Total Stores")
        expect(page).to have_selector('.longname')
        expect(page).to have_selector('.city')
        expect(page).to have_selector('.phone')
        expect(page).to have_selector('.store_type')
      end
    end
  end
end