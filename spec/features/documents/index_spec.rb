require 'rails_helper'

RSpec.describe 'Document index page' do
  describe 'as a user' do
    before(:each) do
      @clinician1 = Clinician.create!(
        name: 'The Doctor',
        specialty: 'timey-wimey'
      )  

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
      @document3 = Document.create!(
        doc_type: Faker::Job.doc_type,
        expiration: Faker::Date.between(from: 2.days.ago, to: Date.yesterday),
        clinician_id: @clinician1.id
      )
    end

    describe 'when I visit the document index page' do
      it 'shows the all of the valid documents under management' do
        visit documents_path

        expect(page).to have_content("All Valid Documents")
        expect(page).to have_content("Type: ")
        expect(page).to have_content("Expiration: ")
        expect(page).to have_content(@document1.doc_type)
        expect(page).to have_content(@document1.expiration)
        expect(page).to have_content(@document2.doc_type)
        expect(page).to have_content(@document2.expiration)
        expect(page).to_not have_content(@document3.expiration)
      end

      it 'has a button to visit document show' do
        visit documents_path

        within("#document-#{@document1.id}") do
          expect(page).to have_button("Visit Document Page")
          click_on("Visit Document Page")
          expect(current_path).to eq(document_path(@document1.id))
        end
      end
    end
  end
end