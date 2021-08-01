require 'rails_helper'

RSpec.describe 'location show page' do
  describe 'as a user' do
    before(:each) do
      @location1 = Location.create!(
        name: Faker::Company.name,
        address: Faker::Address.full_address,
        practice: Faker::Job.practice
      )

      @clinician1 = Clinician.create!(
        name: 'The Doctor',
        specialty: 'timey-wimey'
      )
      @clinician2 = Clinician.create!(
        name: 'Dr Suess',
        specialty: 'rhyme-time'
      )

      @location1.clinicians << @clinician1
      @location1.clinicians << @clinician2
    end

    describe 'when I visit the location show page' do
      it 'shows the location name, practice, and address' do
        visit location_path(@location1.id)
        
        expect(page).to have_content("Location Profile")
        
        expect(page).to have_css("#location-profile")
        
        within("#location-profile") do
          expect(page).to have_content("Name: ")
          expect(page).to have_content(@location1.name)
          expect(page).to have_content("Practice: ")
          expect(page).to have_content(@location1.practice)
          expect(page).to have_content("Address: ")
          expect(page).to have_content(@location1.address)
        end
      end
      
      it 'lists the locations clinicians' do
        visit location_path(@location1.id)

        expect(page).to have_css("#location-clinician-list")

        within("#location-clinician-list") do
          expect(page).to have_content("Approved Clinicians:")
          expect(page).to have_content(@clinician1.name)
          expect(page).to have_link("#{@clinician1.name}")
          expect(page).to have_content(@clinician2.name)
          expect(page).to have_link("#{@clinician2.name}")
        end

        click_link("#{@clinician1.name}")
        expect(current_path).to eq(clinician_path(@clinician1.id))

        visit location_path(@location1.id)
        
        click_link("#{@clinician2.name}")
        expect(current_path).to eq(clinician_path(@clinician2.id))
      end
    end
  end
end
