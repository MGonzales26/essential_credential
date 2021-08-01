require 'rails_helper'

RSpec.describe 'clinician show page' do
  describe 'as a user' do
    before(:each) do
      @clinician1 = Clinician.create!(
        name: 'The Doctor',
        specialty: 'timey-wimey'
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

      @document1 = Document.create!(
        doc_type: Faker::Job.doc_type,
        expiration: Faker::Date.between(from: Date.tomorrow, to: 1.year.from_now),
        clinician_id: @clinician1.id
      )

      @document2 = Document.create!(
        doc_type: Faker::Job.doc_type,
        expiration: Faker::Date.between(from: Date.tomorrow, to: 1.year.from_now),
        clinician_id: @clinician1.id
      )
    end

    describe 'when I visit the clinicians show page' do
      it 'shows their name and specialty' do
        visit clinician_path(@clinician1.id)

        expect(page).to have_content("Name: ")
        expect(page).to have_content(@clinician1.name)
        expect(page).to have_content("Specialty")
        expect(page).to have_content(@clinician1.specialty)
      end

      it 'lists their locations names' do
        visit clinician_path(@clinician1.id)

        expect(page).to have_content("Approved Locations:")
        expect(page).to have_content(@location1.name)
        expect(page).to have_content(@location2.name)
      end

      it 'lists links to their documents' do
        visit clinician_path(@clinician1.id)

        expect(page).to have_content("Valid Documents:")
        expect(page).to have_link(@document1.doc_type)
        expect(page).to have_content(@document1.expiration)
        expect(page).to have_link(@document2.doc_type)
        expect(page).to have_content(@document2.expiration)
      end
    end
  end
end
