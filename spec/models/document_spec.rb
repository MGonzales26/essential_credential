require 'rails_helper'

RSpec.describe Document, type: :model do
  describe "Relationships" do
    it { should belong_to :clinician }
  end
end
