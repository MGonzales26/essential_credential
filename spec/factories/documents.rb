FactoryBot.define do
  factory :document do
    type { "" }
    expiration { "2021-07-31" }
    clinician { nil }
  end
end
