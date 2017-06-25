# Genres
genres = ['Classical',
          'Electronic',
          'Funk',
          'Soul',
          'Hip Hop',
          'Jazz',
          'Latin',
          'Pop',
          'R&B',
          'Reggae',
          'Rock',
          'World',
          'Metal',
          'Alternative Metal',
          'Grunge',
          'Heavy Metal',
          'Thrash Metal',
          'Hard Rock',
          'Blues Rock',
          'Folk Rock'
        ]

genres.each do |g|
  Genre.create(name: g)
end

instruments = [
  'Keyboards',
  'Vocals',
  'Guitar',
  'Drums',
  'Piano',
  'Percussion',
  'Cello',
  'Violin'
]
# Band
Band.create(username: 'alice_in_chains',
            password: 'chains',
            name: 'Alice in Chains',
            state: 'Washington',
            zipcode: 98101,
            genres_attributes: [
              { name: 'Alternative Metal' },
              { name: 'Grunge' },
              { name: 'Heavy Metal' },
              { name: 'Rock' }
            ]
          )

Band.create(username: 'slayer',
            password: 'deathAngel124',
            name: 'Slayer',
            state: 'California',
            zipcode: 90255,
            genres_attributes: [
              { name: 'Thrash Metal' },
              { name: 'Rock' }
            ]
          )

Band.create(username: 'stairway_to_heaven_420',
            password: 'NoQuarter123',
            name: 'Led Zeppelin',
            state: 'New York',
            zipcode: 10033,
            genres_attributes: [
              { name: 'Hark Rock' },
              { name: 'Blues Rock' },
              { name: 'Folk Rock' },
              { name: 'Heavy Metal' },
              { name: 'Rock' }
            ]
          )

Artist.create(username: 'layne_staley',
              password: 'maninaBox12',
              name: 'Layne Staley',
              state: 'Washington',
              zipcode: 98154,
              age: 21,
              experience_in_years: 4,
              genres_attributes: [
                { name: 'Alternative Metal' },
                { name: 'Grunge' },
                { name: 'Heavy Metal' },
                { name: 'Rock' }
              ],
              instruments_attributes: [
                { name: 'Vocals' },
                { name: 'Guitar' },
                { name: 'Drums' }
              ]
            )

Artist.create(username: 'frankie_ocean',
              password: 'orange_juice',
              name: 'Frank Ocean',
              state: 'California',
              zipcode: 90801,
              age: 29,
              experience_in_years: 17,
              genres_attributes: [
                { name: 'R&B' },
                { name: 'Soul' }
              ],
              instruments_attributes: [
                {name: 'Keyboards'},
                {name: 'Vocals'},
                {name: 'Guitar'}
              ]
            )

Artist.create(username: 'aisleyPUNK',
              password: 'limpbizkit420',
              name: 'Rain Drupal',
              state: 'New Jersey',
              zipcode: 07067,
              age: 26,
              experience_in_years: 7,
              genres_attributes: [
                { name: 'Alternative Metal' },
                { name: 'Soul' },
                { name: 'Pop' },
                { name: 'Thrash Metal' }
              ],
              instruments_attributes: [
                {name: 'Bass'},
                {name: 'Drums'},
                {name: 'Piano'}
              ]
            )

# Artist.first.genres
