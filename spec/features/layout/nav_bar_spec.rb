require 'rails_helper'

RSpec.describe 'Nav bar links' do
  describe 'when I visit any page' do
    it 'shows a link to the locations, clinicians documents and home' do
      visit '/'

      expect(page).to have_link("Home")
      expect(page).to have_link("Locations")
      expect(page).to have_link("Clinicians")
      expect(page).to have_link("Documents")
    end

    it 'shows a link to the locations, clinicians documents and home' do
      visit clinicians_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Locations")
      expect(page).to have_link("Clinicians")
      expect(page).to have_link("Documents")
    end

    it 'shows a link to the locations, clinicians documents and home' do
      visit locations_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Locations")
      expect(page).to have_link("Clinicians")
      expect(page).to have_link("Documents")
    end

    xit 'shows a link to the locations, clinicians documents and home' do
      visit documents_path

      expect(page).to have_link("Home")
      expect(page).to have_link("Locations")
      expect(page).to have_link("Clinicians")
      expect(page).to have_link("Documents")
    end

  end
end