require 'rails_helper'

RSpec.describe 'Welcome page' do
  describe 'as a user' do
    describe 'when I visit the page' do
      it 'has links to the clinician and location index pages' do
        visit '/'

        within("#links") do
          expect(page).to have_link('Clinicians')
          expect(page).to have_link('Locations')
        end
      end
    end

    describe 'when I click the clinician link' do
      it 'takes me to the clinician index page' do
        visit '/'
  
        within("#links") do
          click_link('Clinicians')
          expect(current_path).to eq(clinicians_path)
        end
      end
    end

    describe 'when I click the location link' do
      it 'takes me to the location index page' do
        visit '/'
  
        within("#links") do
          click_link('Locations')
          expect(current_path).to eq(locations_path)
        end
      end
    end
  end
end