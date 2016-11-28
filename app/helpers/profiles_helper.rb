module ProfilesHelper
  def geocode_zip(user)
    url = "http://maps.googleapis.com/maps/api/geocode/json?"
    parameters = { address: user.zipcode, sensor: 'true' }
    response = Unirest.get(url, headers: {}, parameters: parameters)
    @location = response.body['results'][0]['address_components'][1]['short_name']
  end
end
