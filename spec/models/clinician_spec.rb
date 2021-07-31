require 'rails_helper'

RSpec.describe Clinician, type: :model do
  describe "Relationships" do
    it { should have_many :documents }
    it { should have_many :clinician_locations }
    it { should have_many(:locations).through(:clinician_locations) }
  end
end
