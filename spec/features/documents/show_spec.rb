require 'rails_helper'

RSpec.describe 'Document show page' do
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
    end
    describe 'when I visit the document show page' do
      it 'shows the doc_type, expiration date, and name of the clinician' do
        visit document_path(@document1)

        expect(page).to have_content("Type: ")
        expect(page).to have_content("Expiration: ")
        expect(page).to have_content("Clinician: ")
        expect(page).to have_content(@document1.doc_type)
        expect(page).to have_content(@document1.expiration)
        expect(page).to have_content(@clinician1.name)
      end
    end
  end
end