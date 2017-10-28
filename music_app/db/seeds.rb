# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'user', password: 'password')

bands = []
10.times {
  bands << Band.create(name: Faker::RickAndMorty.character)
}

albums = []
bands.each do |band|
  (0..10).to_a.sample.times do
    albums << Album.create(
      band_id: band.id,
      title: Faker::RickAndMorty.location,
      year: (1990..2017).to_a.sample.to_s,
      live: [true, false].sample
    )
  end
end

albums.each do |album|
  (1..11).to_a.sample.times do |i|
    Track.create(
      album_id: album.id,
      title: Faker::Superhero.power,
      ord: i,
      lyrics: Faker::ChuckNorris.fact,
      regular: [true, false].sample
    )
  end
end
