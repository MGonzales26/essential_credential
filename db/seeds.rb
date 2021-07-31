# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Clinician.delete_all
Document.delete_all
Location.delete_all
ClinicianLocation.delete_all

(1..5).each do |id|
  Clinician.create!(
    id: id,
    name: Faker::Name.name,
    specialty: Faker::Job.specialty
  )
end

(1..50).each do |id|
  Document.create!(
    id: id,
    doc_type: Faker::Job.doc_type,
    expiration: Faker::Date.between(from: Date.tomorrow, to: 1.year.from_now),
    clinician_id: rand(1..5)
  )
end

(1..10).each do |id|
  Location.create!(
    id: id,
    name: Faker::Company.name,
    address: Faker::Address.full_address,
    practice: Faker::Job.practice
  )
end

(1..10).each do |id|
  ClinicianLocation.create!(
    clinician_id: rand(1..5),
    location_id: rand(1..10)
  )
end