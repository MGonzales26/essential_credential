require 'rails_helper'

RSpec.describe ClinicianLocation, type: :model do
  describe "Relationships" do
    it { should belong_to :clinician }
    it { should belong_to :location }
  end
end
