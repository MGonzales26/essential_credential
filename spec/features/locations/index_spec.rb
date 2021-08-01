require 'rails_helper'

RSpec.describe 'location show page' do
  describe 'as a user' do
    before(:each) do
      @location1 = Location.create!(
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        practice: Faker::Job.practice
      )

      @location2 = Location.create!(
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        practice: Faker::Job.practice
      )
    end

    describe 'when I visit the location index page' do
      it 'has the name, practice, and address' do
        visit locations_path

        expect(page).to have_content("Your Locations")

        expect(page).to have_css("#location-list")

        within("#location-list") do
          expect(page).to have_css("#location-#{@location1.id}")
          expect(page).to have_css("#location-#{@location2.id}")
        end

        within("#location-#{@location1.id}") do
          expect(page).to have_content("Name:")
          expect(page).to have_content(@location1.name)
          expect(page).to have_content("Practice:")
          expect(page).to have_content(@location1.practice)
          expect(page).to have_content("Address:")
          expect(page).to have_content(@location1.address)
        end
        
        within("#location-#{@location2.id}") do
          expect(page).to have_content("Name:")
          expect(page).to have_content(@location2.name)
          expect(page).to have_content("Practice:")
          expect(page).to have_content(@location2.practice)
          expect(page).to have_content("Address:")
          expect(page).to have_content(@location2.address)
        end
      end

      it 'links to the location page' do
        visit locations_path

        within("#location-#{@location1.id}") do
          expect(page).to have_link(@location1.name)
          click_link(@location1.name)
          expect(current_path).to eq(location_path(@location1.id))
        end

        visit locations_path
        
        within("#location-#{@location2.id}") do
          expect(page).to have_link(@location2.name)
          click_link(@location2.name)
          expect(current_path).to eq(location_path(@location2.id))
        end
        save_and_open_page
      end
    end
  end
end
