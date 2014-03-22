if Rails.env.test?
  Geocoder.configure(lookup: :test)

  old_city = [
              'Old City, Philadelphia, PA', [
                                             {
                                               'latitude'     => 39.9526,
                                               'longitude'    => -75.1427,
                                               'address'      => 'Old City, Philadelphia, PA, US',
                                               'state'        => 'Pennsylvania',
                                               'state_code'   => 'PA',
                                               'country'      => 'United States',
                                               'country_code' => 'US'
                                             }
                                            ]
             ]
  Geocoder::Lookup::Test.add_stub(*old_city)

  university_city = [
                     'University City, Philadelphia, PA', [
                                                           {
                                                             'latitude'     => 39.9515,
                                                             'longitude'    => -75.1954,
                                                             'address'      => 'University City, Philadelphia, PA, US',
                                                             'state'        => 'Pennsylvania',
                                                             'state_code'   => 'PA',
                                                             'country'      => 'United States',
                                                             'country_code' => 'US'
                                                           }
                                                          ]
                    ]
  Geocoder::Lookup::Test.add_stub(*university_city)
end
