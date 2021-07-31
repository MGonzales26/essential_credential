require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Relationships" do
    it { should have_many :clinician_locations }
    it { should have_many(:clinicians).through(:clinician_locations) }
  end
end
