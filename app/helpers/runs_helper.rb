module RunsHelper
  def convert_hours_to_seconds(params)
    (params.to_i)*3600
  end

  def convert_minutes_to_seconds(params)
    (params.to_i)*60
  end

  def find_midpoint(user_coord, result_coord)
    [(user_coord[0] + result_coord[0]) / 2 , (user_coord[1] + result_coord[1]) / 2 ]
  end

  def retrieve_zipcodes_within_radius(run_zipcode)
    api_key = "" #will need to store api key as ENV
    url = "http://www.zipcodeapi.com/rest/#{api_key}/radius.json/#{run_zipcode}/2/mile"
    response = Unirest.get(url, headers: {}, parameters: {})
    nearby_zips = {}
    response.body['zip_codes'].each { |zip, distance| nearby_zips[zip['zip_code']] = zip['distance'] }
    convert_to_int = Hash[nearby_zips.map { |z,d| [z.to_i, d.to_i] }]
  end

  def nearby_runs(zipcodes)
    Run.where(zipcode: zipcodes.keys)
  end

  def search_by_date_time(zipcodes, run)
    potential_runs = nearby_runs(zipcodes)
    runs = potential_runs.where(time: run.time, run_date: run.run_date)
    runs.where.not(runner_id: current_user.id)
  end
end
