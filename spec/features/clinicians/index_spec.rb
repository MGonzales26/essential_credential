require 'rails_helper'

RSpec.describe 'clinician index page' do
  describe 'as a user' do
    before(:each) do
      @clinician1 = Clinician.create!(
        name: 'The Doctor',
        specialty: 'timey-wimey'
      )
      @clinician2 = Clinician.create!(
        name: 'Dr Suess',
        specialty: 'rhyme-time'
      )
      @clinician3 = Clinician.create!(
        name: 'Dr Jekyll',
        specialty: 'science'
      )
      @location1 = Location.create!(
        name: 'on the mend',
        address: '123 Fake Street',
        practice: 'Orthopedics'
      )
      @location2 = Location.create!(
        name: 'Happy Hearts Healtcare',
        address: '123 Fake Street',
        practice: 'Cardiology'
      )

      @clinician1.locations << @location1
      @clinician1.locations << @location2
      @clinician2.locations << @location1
      @clinician3.locations << @location2
    end

    describe 'when I visit the clinicians index page'do
      it 'shows a list of links to the clinicians and links to their locations' do
        visit clinicians_path

        expect(page).to have_css("#clinician-list")

        within("#clinician-list") do
          expect(page).to have_css("#clinician-#{@clinician1.id}")
          expect(page).to have_css("#clinician-#{@clinician2.id}")
          expect(page).to have_css("#clinician-#{@clinician3.id}")
        end

        within("#clinician-#{@clinician1.id}") do
          expect(page).to have_content("Name:")
          expect(page).to have_content(@clinician1.name)
          expect(page).to have_content("Specialty:")
          expect(page).to have_content(@clinician1.specialty)
        end
        
        within("#clinician-#{@clinician2.id}") do
          expect(page).to have_content("Name:")
          expect(page).to have_content(@clinician2.name)
          expect(page).to have_content("Specialty:")
          expect(page).to have_content(@clinician2.specialty)
        end

        within("#clinician-#{@clinician3.id}") do
          expect(page).to have_content("Name:")
          expect(page).to have_content(@clinician3.name)
          expect(page).to have_content("Specialty:")
          expect(page).to have_content(@clinician3.specialty)
        end
      end

      it 'has a link to each location for the clinicians' do
        visit clinicians_path

        within("#clinician-#{@clinician1.id}") do
          expect(page).to have_link(@location1.name)
          expect(page).to have_link(@location2.name)
        end

        within("#clinician-#{@clinician2.id}") do
          expect(page).to have_link(@location1.name)
        end

        within("#clinician-#{@clinician3.id}") do
          expect(page).to have_link(@location2.name)
        end
      end

      it 'links to the clinician show page on the clinician name' do
        visit clinicians_path

        within("#clinician-#{@clinician1.id}") do
          expect(page).to have_link(@clinician1.name)
          click_link(@clinician1.name)
          expect(current_path).to eq(clinician_path(@clinician1.id))
        end

        visit clinicians_path
        
        within("#clinician-#{@clinician2.id}") do
          expect(page).to have_link(@clinician2.name)
          click_link(@clinician2.name)
          expect(current_path).to eq(clinician_path(@clinician2.id))
        end

        visit clinicians_path
        
        within("#clinician-#{@clinician3.id}") do
          expect(page).to have_link(@clinician3.name)
          click_link(@clinician3.name)
          expect(current_path).to eq(clinician_path(@clinician3.id))
        end
      end
    end
  end
end
